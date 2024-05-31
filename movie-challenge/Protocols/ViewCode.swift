//
//  ViewCode.swift
//  movie-challenge
//
//  Created by Kalil Bego Rocha on 28/05/24.
//

protocol ViewCode {
    func setupViews()
    func setupConstraints()
}

extension ViewCode {
    func setup() {
        self.setupViews()
        self.setupConstraints()
    }
}
