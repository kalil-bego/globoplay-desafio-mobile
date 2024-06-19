//
//  MovieViewCell.swift
//  movie-challenge
//
//  Created by Kalil Bego Rocha on 12/06/24.
//

import UIKit

final class MovieViewCell: UICollectionViewCell {
    
    static let identifier: String = "MovieViewCell"
    private var components: MovieCellComponents?
    private var viewModel: MovieCellViewModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        self.backgroundColor = .lightGray
        self.components = MovieCellComponents(superview: self.contentView)
    }
    
    required init?(coder: NSCoder) { nil }
    
    func setMovie(_ movie: Movie) {
        viewModel = MovieCellViewModel(movie: movie)
        viewModel?.getBackgroundImage(completion: { image in
            DispatchQueue.main.async {
                self.components?.imageView.image = image
            }
        })
    }
    
}
