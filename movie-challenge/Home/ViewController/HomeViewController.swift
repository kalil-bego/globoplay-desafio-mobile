//
//  ViewController.swift
//  movie-challenge
//
//  Created by Kalil Bego Rocha on 28/05/24.
//

import UIKit

final class HomeViewController: UIViewController {

    private lazy var homeView: HomeView = {
        let view = HomeView()
        if let navigationController = self.navigationController as? HomeNavigationController {
            view.delegate = navigationController
        }
        return view
    }()

    override func loadView() {
        self.view = homeView
    }

}
