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
        NetworkManager.shared.getAlbums { (albums, error) in
            guard let albums = albums else {
                self.presentRSSAlertOnMainThread(title: "Error occured", message: error!, buttinTitle: "OK")
                return
            }
            
            print(albums.feed.results)
        }
    }

}
