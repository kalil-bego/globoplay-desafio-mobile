//
//  ServiceProtocol.swift
//  movie-challenge
//
//  Created by Kalil Bego Rocha on 06/06/24.
//

import Foundation

protocol ServiceProtocol {
    var uri: URL? { get }
}

extension ServiceProtocol {
    var uri: URL? {
        URL(string: "https://api.themoviedb.org/3")
    }
}
