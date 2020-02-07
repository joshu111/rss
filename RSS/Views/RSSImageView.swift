//
//  RSSImageView.swift
//  RSS
//
//  Created by Joshu Sonawane on 2/5/20.
//  Copyright © 2020 Joshu Sonawane. All rights reserved.
//

import UIKit

class RSSImageView: UIImageView {

    let placeholderImage = UIImage(named: "musicLogo")
    let cache            = NetworkManager.shared.cache
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius  = 9
        clipsToBounds       = true
        image               = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func getImage(from urlString: String){
        NetworkManager.shared.downloadImage(from: urlString) { (image) in
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
