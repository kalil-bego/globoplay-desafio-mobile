//
//  HomeCoordinator.swift
//  movie-challenge
//
//  Created by Kalil Bego Rocha on 28/05/24.
//

import UIKit

final class HomeCoordinator: Coordinator {

    lazy var navigationController: UINavigationController = {
        HomeNavigationController(rootViewController: viewController)
    }()

    lazy var viewController: UIViewController = {
        let viewController = HomeViewController()
        viewController.tabBarItem.image = UIImage(named: "home")
        viewController.tabBarItem.title = "Início"
        return viewController
    }()

    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .clear
        self.navigationController.navigationBar.standardAppearance = appearance
        self.navigationController.navigationBar.scrollEdgeAppearance = self.navigationController.navigationBar.standardAppearance
    }
}
