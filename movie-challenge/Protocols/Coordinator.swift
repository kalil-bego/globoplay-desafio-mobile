//
//  Coordinator.swift
//  movie-challenge
//
//  Created by Kalil Bego Rocha on 04/06/24.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    var viewController: UIViewController { get }
    func start()
}

extension Coordinator {
    func start() {
        self.navigationController.pushViewController(self.viewController, animated: true)
    }
}
