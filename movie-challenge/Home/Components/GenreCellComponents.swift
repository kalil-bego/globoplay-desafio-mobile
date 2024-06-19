//
//  GenreCellComponents.swift
//  movie-challenge
//
//  Created by Kalil Bego Rocha on 11/06/24.
//

import UIKit

final class GenreCellComponents {

    private let superview: UIView

    init(superview: UIView) {
        self.superview = superview
        self.setup()
    }

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(MovieViewCell.self, forCellWithReuseIdentifier: MovieViewCell.identifier)
        collection.backgroundColor = .clear
//        collection.isPagingEnabled = true
        collection.showsHorizontalScrollIndicator = false
        let padding = 15.0
        collection.contentInset = UIEdgeInsets(top: .zero, left: padding, bottom: .zero, right: padding)
        return collection
    }()
}

extension GenreCellComponents: ViewCode {

    func setupViews() {
        superview.addSubview(collectionView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: superview.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        ])
    }

}
