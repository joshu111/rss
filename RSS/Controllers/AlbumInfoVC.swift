//
//  AlbumInfoVC.swift
//  RSS
//
//  Created by Joshu Sonawane on 2/6/20.
//  Copyright © 2020 Joshu Sonawane. All rights reserved.
//

import UIKit

class AlbumInfoVC: UIViewController {

    var album: Album?  = nil
    var genre: [Genre] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        guard let album = album else {
            return
        }
        print(album.artistName)
    }
    
    

}
