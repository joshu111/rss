//
//  AlbumsListVC.swift
//  RSS
//
//  Created by Joshu Sonawane on 2/2/20.
//  Copyright © 2020 Joshu Sonawane. All rights reserved.
//

import UIKit

class AlbumsListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        NetworkManager.shared.getAlbums { result in
            switch result {
                case.success(let dataRoot):
                    print(dataRoot.feed.results)
                case.failure(let error):
                    self.presentRSSAlertOnMainThread(title: "Error occured", message: error.rawValue, buttinTitle: "OK")
            }
        }
    }

}
