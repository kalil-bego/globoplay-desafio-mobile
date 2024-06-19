//
//  PopularMoviesResponse.swift
//  movie-challenge
//
//  Created by Kalil Bego Rocha on 05/06/24.
//

struct PopularMoviesResponse: Decodable {
    let page: Int?
    let results: [Movie]?
}
