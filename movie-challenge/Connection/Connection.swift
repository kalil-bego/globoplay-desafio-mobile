//
//  Connection.swift
//  movie-challenge
//
//  Created by Kalil Bego Rocha on 05/06/24.
//

import Foundation

enum Connection: String {
    case THE_MOVIE_DB = "https://api.themoviedb.org/3"
    case IMAGE_TMDB = "https://image.tmdb.org"

    enum Failure: Error {
        case IS_NOT_VALID_URL(String?)
        case REQUEST(URLResponse?, Error?)
        case DECODABLE(Error)
    }

    enum Endpoint {
        case POPULAR_MOVIES(language: String, page: Int)
        case GENRE_MOVIES
        case IMAGE_MOVIE(path: String)

        var uriString: String {
            switch self {
            case .POPULAR_MOVIES(let language, let page):
                return "/movie/popular?language=\(language)&page=\(page)"
            case .GENRE_MOVIES:
                return "/genre/movie/list"
            case .IMAGE_MOVIE(let path):
                return "/t/p/w500/\(path)"
            }
        }

        var method: String {
            switch self {
            case .POPULAR_MOVIES, .GENRE_MOVIES, .IMAGE_MOVIE:
                Method.GET.rawValue
            }
        }
    }

    var headers: [String: String]? {
        switch self {
        case .THE_MOVIE_DB, .IMAGE_TMDB:
            return [
                "accept": "application/json",
                "Authorization": "Bearer \(token)"
            ]
        }
    }

    func request<T: Decodable>(
        with endpoint: Endpoint,
        additionalHeaders: [String: String]? = nil,
        model type: T.Type,
        completion: @escaping(Result<T, Failure>) -> Void
    ) {
        let stringURL = self.rawValue + endpoint.uriString
        guard let url = stringURL.toURL else {
            return completion(.failure(.IS_NOT_VALID_URL(stringURL)))
        }
        let request = self.getRequest(from: url, endpoint, additionalHeaders)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil,
                  let data = data else {
                return completion(.failure(.REQUEST(response, error)))
            }
            do {
                let decodedData = try data.decode(type: type)
                completion(.success(decodedData))
            } catch let error {
                completion(.failure(.DECODABLE(error)))
            }
        }
        task.resume()
    }

    func request(
        with endpoint: Endpoint,
        additionalHeaders: [String: String]? = nil,
        completion: @escaping(Result<Data, Failure>) -> Void
    ) {
        let stringURL = self.rawValue + endpoint.uriString
        guard let url = stringURL.toURL else {
            return completion(.failure(.IS_NOT_VALID_URL(stringURL)))
        }
        let request = self.getRequest(from: url, endpoint, additionalHeaders)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil,
                  let data = data else {
                return completion(.failure(.REQUEST(response, error)))
            }
            completion(.success(data))
        }
        task.resume()
    }

    // MARK: - Private

    private var token: String { "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMjAzNGVhYTViMWQ4ZmQ5MzI1MGNlYjBkM2MzMDkxNiIsInN1YiI6IjY2NTY3NTAxYWY2NGFjNDg2ZTFmZGYyNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.JccPAQf6XaA1A82MH_EWXYqvlrVGbhWa7PFGraVxvqk" }

    private enum Method: String {
        case GET, POST
    }

    private func getRequest(from url: URL,_ endpoint: Endpoint,_ additionalHeaders: [String: String]?) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method
        request.allHTTPHeaderFields = self.headers
        if let additionalHeaders {
            additionalHeaders.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key) }
        }
        return request
    }
}
