//
//  HomServiceProtocol.swift
//  movie-challenge
//
//  Created by Kalil Bego Rocha on 05/06/24.
//

import Foundation

protocol HomeServiceProtocol: ServiceProtocol {
    func getGenreMovieList(language: String, completion: @escaping([Genre]?) -> Void)
    func getPopularMovies(language: String, page: Int, region: String?, completion: @escaping([Movie]?) -> Void)
    func getMovieDataImage(path: String, completion: @escaping(Data?) -> Void)
}
