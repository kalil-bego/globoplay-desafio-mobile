//
//  MovieCellViewModel.swift
//  movie-challenge
//
//  Created by Kalil Bego Rocha on 12/06/24.
//

import Foundation
import UIKit

final class MovieCellViewModel {

    private var movie: Movie
    private var dataImage: Data?
    private let service: HomeServiceProtocol

    init(movie: Movie, service: HomeServiceProtocol = HomeService()) {
        self.movie = movie
        self.service = service
    }

    func getBackgroundImage(completion: @escaping (UIImage?) -> Void) {
        service.getMovieDataImage(path: movie.poster_path, completion: { data in
            guard let dataImage = data else { return completion(nil) }
            let image = UIImage(data: dataImage)
            completion(image)
        })
    }
}
