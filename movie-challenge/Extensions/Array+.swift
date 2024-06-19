//
//  Array+.swift
//  movie-challenge
//
//  Created by Kalil Bego Rocha on 14/06/24.
//

import Foundation

extension Array {

    subscript(safe index: Int) -> Element? {
        guard indices.contains(index) else {
            return nil
        }

        return self[index]
    }

}
