//
//  MovieCellComponents.swift
//  movie-challenge
//
//  Created by Kalil Bego Rocha on 12/06/24.
//

import UIKit

final class MovieCellComponents {

    private let superview: UIView

    init(superview: UIView) {
        self.superview = superview
        self.setup()
    }

    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()

}

extension MovieCellComponents: ViewCode {

    func setupViews() {
        superview.addSubview(imageView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: superview.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        ])
    }

}
