//
//  GenreViewCell.swift
//  movie-challenge
//
//  Created by Kalil Bego Rocha on 11/06/24.
//

import UIKit

final class GenreViewCell: UITableViewCell {

    static let identifier: String = "GenreViewCell"
    private var components: GenreCellComponents?
    private var viewModel: GenreCellViewModel?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.components = GenreCellComponents(superview: self.contentView)
    }

    required init?(coder: NSCoder) { nil }

    func setMovies(_ movies: [Movie]) {
        viewModel = GenreCellViewModel(movies: movies)
        DispatchQueue.main.async {
            self.components?.collectionView.delegate = self
            self.components?.collectionView.dataSource = self
            self.components?.collectionView.reloadData()
        }
    }

}

extension GenreViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 120, height: 180)
    }

}

extension GenreViewCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.totalMovies ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieViewCell.identifier, for: indexPath) as? MovieViewCell,
              let movie = viewModel?.getMovieIn(index: indexPath.row) else {
            return UICollectionViewCell()
        }
        cell.setMovie(movie)
        return cell
    }

}
