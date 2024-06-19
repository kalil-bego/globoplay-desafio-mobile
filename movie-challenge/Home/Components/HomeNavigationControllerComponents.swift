//
//  HomeNavigationControllerComponents.swift
//  movie-challenge
//
//  Created by Kalil Bego Rocha on 04/06/24.
//

import UIKit

struct Button {
    let imageName: String
    let action: UIAction? = nil
    let event: UIControl.Event = .touchUpInside

    var image: UIImage? {
        UIImage(systemName: imageName)
    }
}

final class HomeNavigationControllerComponents {

    private let navigationBar: UINavigationBar

    init(navigationBar: UINavigationBar) {
        self.navigationBar = navigationBar
        self.navigationBar.topItem?.titleView = self.contentView
        self.setup()
    }

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.text = "globoplay"
        label.textColor = .white
        return label
    }()

    private lazy var rightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 5.0
        stackView.distribution = .fillEqually
        return stackView
    }()

    private lazy var rightButtons: [UIButton] = {
        let customButtons = [
            Button(imageName: "airplayvideo"),
            Button(imageName: "magnifyingglass"),
            Button(imageName: "person.crop.circle.fill")
        ]
        return customButtons.map { customButtom in
            let button = UIButton()
            button.tintColor = .white
            button.setImage(customButtom.image, for: .normal)
            return button
        }
    }()

    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

}

extension HomeNavigationControllerComponents: ViewCode {
    func setupViews() {
        contentView.addSubview(titleLabel)
        rightButtons.forEach { rightStackView.addArrangedSubview($0) }
        contentView.addSubview(rightStackView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.9),

            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            rightStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            rightStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
