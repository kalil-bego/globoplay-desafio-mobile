//
//  HomeView.swift
//  movie-challenge
//
//  Created by Kalil Bego Rocha on 28/05/24.
//

import UIKit

final class HomeView: UIView {

    private let viewModel = HomeViewModel()
    private var components: HomeComponents?
    weak var delegate: TranslucentDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.components = HomeComponents(superview: self)
        self.viewModel.delegate = self
    }

    required init?(coder: NSCoder) { nil }

}

extension HomeView: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var position = scrollView.contentOffset.y
        position = position < -100 ? -100 : position
        position = -position - 100
        position = -position / 100
        print(position)
        self.delegate?.didScrolling(translucent: position)
    }

}

extension HomeView: ViewModelDelegate {

    func didFinishedFetch() {
        DispatchQueue.main.async {
            self.components?.tableView.delegate = self
            self.components?.tableView.dataSource = self
            self.components?.tableView.reloadData()
        }
    }

}

extension HomeView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        viewModel.cellHeight
    }

}

extension HomeView: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.totalGenres
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        viewModel.genresTitles?[safe: section]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GenreViewCell.identifier, for: indexPath) as? GenreViewCell,
              let genre = viewModel.getGenreIn(index: indexPath.section),
              let moviesByGenre = viewModel.getMoviesBy(genre: genre) else {
            return UITableViewCell()
        }
        cell.setMovies(moviesByGenre)
        return cell
    }

}
