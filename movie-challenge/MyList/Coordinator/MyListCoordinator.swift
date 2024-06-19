//
//  MyListCoordinator.swift
//  movie-challenge
//
//  Created by Kalil Bego Rocha on 04/06/24.
//

import UIKit

final class MyListCoordinator: Coordinator {
    lazy var navigationController: UINavigationController = {
        UINavigationController(rootViewController: viewController)
    }()

    lazy var viewController: UIViewController = {
        let viewController = MyListViewController()
        viewController.title = "Minha Lista"
        viewController.tabBarItem.image = UIImage(named: "star")
        return viewController
    }()
}
