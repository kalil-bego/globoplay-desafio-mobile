//
//  TabBarController.swift
//  movie-challenge
//
//  Created by Kalil Bego Rocha on 04/06/24.
//

import UIKit

final class TabBarController: UITabBarController {

    private let coordinators: [Coordinator] = [
        HomeCoordinator(),
        MyListCoordinator()
    ]

    override func loadView() {
        super.loadView()
        self.view.backgroundColor = #colorLiteral(red: 0.1215686426, green: 0.1215686426, blue: 0.1215686426, alpha: 1)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let viewControllers = self.coordinators.map { $0.navigationController }
        self.setViewControllers(viewControllers, animated: true)
    }

    override func setViewControllers(_ viewControllers: [UIViewController]?, animated: Bool) {
        super.setViewControllers(viewControllers, animated: animated)
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        self.tabBar.standardAppearance = appearance
        self.tabBar.scrollEdgeAppearance = self.tabBar.standardAppearance
        self.tabBar.tintColor = .white
    }

}
