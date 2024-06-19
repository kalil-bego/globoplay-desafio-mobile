//
//  HomeNavigationController.swift
//  movie-challenge
//
//  Created by Kalil Bego Rocha on 04/06/24.
//

import UIKit

final class HomeNavigationController: UINavigationController {

    private var components: HomeNavigationControllerComponents?
    private var colors: [CGColor] {
        get {
            [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor, #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0).cgColor]
        }
        set(newColors) {
            let gradient = self.gradient(newColors, self.navigationBar.bounds)
            let image = gradient.imageFromLayer
            self.navigationBar.standardAppearance = self.appearance(image)
            self.navigationBar.scrollEdgeAppearance = self.navigationBar.standardAppearance
        }
    }
    private let appearance = { (backgroundImage: UIImage?) -> UINavigationBarAppearance in
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .clear
        appearance.backgroundImage = backgroundImage
        return appearance
    }
    private let gradient = { (colors: [CGColor], frame: CGRect) -> CAGradientLayer in
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        gradientLayer.colors = colors
        gradientLayer.shouldRasterize = true
        return gradientLayer
    }

    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        self.components = HomeNavigationControllerComponents(navigationBar: self.navigationBar)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension HomeNavigationController: TranslucentDelegate {
    func didScrolling(translucent alpha: CGFloat) {
        colors[1] = #colorLiteral(red: 0, green: 0, blue: 0, alpha: Float(alpha)).cgColor
    }
}
