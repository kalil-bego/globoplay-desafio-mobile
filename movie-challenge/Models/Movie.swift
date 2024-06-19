//
//  Movie.swift
//  movie-challenge
//
//  Created by Kalil Bego Rocha on 05/06/24.
//

import UIKit

struct Movie: Decodable {
    let id: Int
    let adult: Bool
    let backdrop_path: String
    let genre_ids: [Int]
    let original_language: String
    let original_title: String
    let overview: String
    let popularity: Double
    let poster_path: String
    let release_date: String
    let title: String
    let video: Bool
    let vote_average: Double
    let vote_count: Int
}
