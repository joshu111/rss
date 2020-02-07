//
//  RSSLoadingScreen.swift
//  RSS
//
//  Created by Joshu Sonawane on 2/7/20.
//  Copyright © 2020 Joshu Sonawane. All rights reserved.
//

import UIKit

class RSSLoadingScreen: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .systemBackground
        alpha           = 0
        UIView.animate(withDuration: 0.27) {
            self.alpha   = 0.81
        }
        let activityIndicator = UIActivityIndicatorView(style: .large)
        self.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        activityIndicator.startAnimating()
    }
}
