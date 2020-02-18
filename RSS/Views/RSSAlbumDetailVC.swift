//
//  RSSAlbumDetailVC.swift
//  RSS
//
//  Created by Joshu Sonawane on 2/10/20.
//  Copyright © 2020 Joshu Sonawane. All rights reserved.
//

import UIKit

class RSSAlbumDetailVC: UIViewController {

    let artistNameView  = RSSInfoBlock()
    let releaseDateView = RSSInfoBlock()
    let copyRightView   = RSSInfoBlock()
    let genreView       = RSSInfoBlock()
    let storeLinkButton = RSSButton()
    let stackView       = UIStackView()

    var urlString       = ""
    let padding:CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
        configureStackView()
    }
    
    private func configureStackView() {
        stackView.axis          = .vertical
        stackView.distribution  = .fillProportionally
        stackView.spacing       = padding
        stackView.addArrangedSubview(artistNameView)
        stackView.addArrangedSubview(releaseDateView)
        stackView.addArrangedSubview(genreView)
        stackView.addArrangedSubview(copyRightView)
    }
    
    private func layoutUI()
    {
        view.addSubview(storeLinkButton)
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        Helper.shared.setConstaint(constraints: [
            storeLinkButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            storeLinkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            storeLinkButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: storeLinkButton.topAnchor, constant: -padding)
        ])
    }

}
