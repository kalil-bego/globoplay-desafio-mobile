//
//  String+.swift
//  movie-challenge
//
//  Created by Kalil Bego Rocha on 10/06/24.
//

import Foundation

extension String {
    var toURL: URL? { URL(string: self) }
}
