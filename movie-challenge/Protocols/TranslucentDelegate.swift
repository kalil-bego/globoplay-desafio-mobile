//
//  TranslucentDelegate.swift
//  movie-challenge
//
//  Created by Kalil Bego Rocha on 04/06/24.
//

import UIKit

protocol TranslucentDelegate: AnyObject {
    func didScrolling(translucent alpha: CGFloat)
}
