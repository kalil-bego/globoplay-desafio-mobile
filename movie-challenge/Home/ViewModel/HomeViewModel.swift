//
//  HomeViewModel.swift
//  movie-challenge
//
//  Created by Kalil Bego Rocha on 28/05/24.
//

import UIKit

final class HomeViewModel {

    private let region: String = "BR"
    private let language: String = "pt-BR"
    private var genres: [Genre] = [Genre]()
    private var movies: [Movie] = [Movie]()

    weak var delegate: ViewModelDelegate?

    init(service: HomeServiceProtocol = HomeService()) {
        service.getGenreMovieList(language: self.language) { genres in
            service.getPopularMovies(language: self.language, page: 1, region: self.region) { movies in
                guard let genres = genres,
                      let movies = movies else { return }
                self.movies = movies
                self.genres = self.getAvailable(genres, by: self.movies)
                self.delegate?.didFinishedFetch()
            }
        }
    }

    var genresTitles: [String]? {
        genres.map { genre in genre.name }
    }

    var totalGenres: Int {
        genres.count
    }

    var totalMovies: Int {
        movies.count
    }

    var cellHeight: CGFloat {
        200
    }

    func getGenreIn(index: Int) -> Genre? {
        genres[safe: index]
    }

    func getMoviesBy(genre: Genre) -> [Movie]? {
        movies.filter { movie in
            movie.genre_ids.first == genre.id
        }
    }

    private func getAvailable(_ genres: [Genre], by movies: [Movie]) -> [Genre] {
        genres.filter { genre in
            movies.contains { movie in
                movie.genre_ids.first == genre.id
            }
        }
    }
}
