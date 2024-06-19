//
//  HomeService.swift
//  movie-challenge
//
//  Created by Kalil Bego Rocha on 28/05/24.
//

import Foundation

final class HomeService: HomeServiceProtocol {
    func getGenreMovieList(language: String, completion: @escaping ([Genre]?) -> Void) {
        Connection.THE_MOVIE_DB.request(with: .GENRE_MOVIES, model: GenresResponse.self) { response in
            switch response {
            case .success(let success):
                completion(success.genres)
            case .failure(let failure):
                print(failure)
                completion(nil)
            }
        }
    }

    func getPopularMovies(language: String, page: Int, region: String?, completion: @escaping([Movie]?) -> Void) {
        Connection.THE_MOVIE_DB.request(
            with: .POPULAR_MOVIES(language: language, page: page),
            model: PopularMoviesResponse.self,
            completion: { response in
                switch response {
                case .success(let success):
                    completion(success.results)
                case .failure(let failure):
                    print(failure)
                    completion(nil)
                }
            }
        )
    }

    func getMovieDataImage(path: String, completion: @escaping (Data?) -> Void) {
        Connection.IMAGE_TMDB.request(
            with: .IMAGE_MOVIE(path: path),
            completion: { response in
                switch response {
                case .success(let success):
                    completion(success)
                case .failure(let failure):
                    print(failure)
                    completion(nil)
                }
            }
        )
    }
}
