//
//  RSSInfoBlock.swift
//  RSS
//
//  Created by Joshu Sonawane on 2/9/20.
//  Copyright © 2020 Joshu Sonawane. All rights reserved.
//

import UIKit

enum InfoType {
    case artistName, genre, copyright, releaseDate
}

let padding: CGFloat = 9
class RSSInfoBlock: UIView {

    let symbolImageView = UIImageView()
    let titleLabel      = RSSTitleLabel(textAlignment: .left, fontSize: 14, weight: .semibold)
    let valueLabel      = RSSTitleLabel(textAlignment: .right, fontSize: 12, weight: .thin)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .systemGray5
        layer.cornerRadius = 9
        addSubview(symbolImageView)
        addSubview(titleLabel)
        addSubview(valueLabel)
        valueLabel.adjustsFontSizeToFitWidth = true
        valueLabel.adjustsFontForContentSizeCategory = true
        symbolImageView.translatesAutoresizingMaskIntoConstraints = false
        symbolImageView.contentMode = .scaleToFill
        symbolImageView.tintColor   = .label
        
        Helper.shared.setConstaint(constraints: [
            symbolImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            symbolImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            symbolImageView.heightAnchor.constraint(equalToConstant: padding*2),
            symbolImageView.widthAnchor.constraint(equalToConstant: padding*2),
            
            titleLabel.centerYAnchor.constraint(equalTo: symbolImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: symbolImageView.trailingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -padding*6),
            titleLabel.heightAnchor.constraint(equalToConstant: padding*2),
            
            valueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            valueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            valueLabel.topAnchor.constraint(equalTo: symbolImageView.bottomAnchor, constant: padding),
            valueLabel.heightAnchor.constraint(equalToConstant: padding*2)
        ])
        
    }
    
    func set(infoType: InfoType, value: String) {
        switch infoType {
            case .artistName:
                symbolImageView.image = UIImage(systemName: SFSymbols.artist)
                titleLabel.text       = "Artist"
            case .genre:
                symbolImageView.image = UIImage(systemName: SFSymbols.genre)
                titleLabel.text       = "Genre"
            case .copyright:
                symbolImageView.image = UIImage(systemName: SFSymbols.copyRight)
                titleLabel.text       = "Copyright"
            case .releaseDate:
                symbolImageView.image = UIImage(systemName: SFSymbols.releaseDate)
                titleLabel.text       = "Released"
        }
        valueLabel.text = value
    }
}
