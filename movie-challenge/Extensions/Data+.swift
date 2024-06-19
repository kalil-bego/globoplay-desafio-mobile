//
//  Data+.swift
//  movie-challenge
//
//  Created by Kalil Bego Rocha on 10/06/24.
//

import Foundation

extension Data {
    var toString: String? { String(data: self, encoding: .utf8) }

    func decode<T: Decodable>(type: T.Type) throws -> T {
        let decodedData = try JSONDecoder().decode(type, from: self)
        return decodedData
    }
}
