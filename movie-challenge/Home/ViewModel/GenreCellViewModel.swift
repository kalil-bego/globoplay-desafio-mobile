//
//  GenreCellViewModel.swift
//  movie-challenge
//
//  Created by Kalil Bego Rocha on 12/06/24.
//

import Foundation

final class GenreCellViewModel {

    private let movies: [Movie]

    init(movies: [Movie]) {
        self.movies = movies
    }

    var totalMovies: Int {
        movies.count
    }

    func getMovieIn(index: Int) -> Movie? {
        movies[safe: index]
    }
}
