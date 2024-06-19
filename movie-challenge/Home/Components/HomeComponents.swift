//
//  HomeComponents.swift
//  movie-challenge
//
//  Created by Kalil Bego Rocha on 28/05/24.
//

import UIKit

final class HomeComponents {

    private let superview: UIView

    init(superview: UIView) {
        self.superview = superview
        self.setup()
    }

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(GenreViewCell.self, forCellReuseIdentifier: GenreViewCell.identifier)
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        return tableView
    }()

}

extension HomeComponents: ViewCode {
    func setupViews() {
        superview.addSubview(tableView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: superview.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        ])
    }
}
