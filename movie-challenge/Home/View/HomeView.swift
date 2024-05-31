//
//  HomeView.swift
//  movie-challenge
//
//  Created by Kalil Bego Rocha on 28/05/24.
//

import UIKit

final class HomeView: UIView {

    private let components: HomeComponents = HomeComponents()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView: ViewCode {
    func setupViews() {
        self.addSubview(components.scrollView)
    }
    
    func setupConstraints() {
        let scrollView = components.scrollView
        let view = self.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
