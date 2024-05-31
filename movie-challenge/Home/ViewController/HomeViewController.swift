//
//  ViewController.swift
//  movie-challenge
//
//  Created by Kalil Bego Rocha on 28/05/24.
//

import UIKit

final class HomeViewController: UIViewController {

    private let viewModel = HomeViewModel()

    init() {
        super.init(nibName: nil, bundle: nil)
        self.tabBarItem.title = viewModel.title
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = viewModel.title
        self.navigationItem.title = viewModel.title
        self.tabBarItem.image = viewModel.icon
        self.view = HomeView(frame: self.view.frame)
    }
}
