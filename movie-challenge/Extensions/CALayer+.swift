//
//  CALayer+.swift
//  movie-challenge
//
//  Created by Kalil Bego Rocha on 05/06/24.
//

import UIKit

extension CALayer {
    var imageFromLayer: UIImage? {
        var image: UIImage?
        UIGraphicsBeginImageContext(self.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            render(in: context)
            image = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        }
        UIGraphicsEndImageContext()
        return image
    }
}
