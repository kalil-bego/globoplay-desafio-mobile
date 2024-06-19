//
//  MyListView.swift
//  movie-challenge
//
//  Created by Kalil Bego Rocha on 04/06/24.
//

import UIKit

final class MyListView: UIView {

    private let components = MyListComponents()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .gray
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
