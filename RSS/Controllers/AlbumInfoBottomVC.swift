//
//  AlbumInfoBottomVC.swift
//  RSS
//
//  Created by Joshu Sonawane on 2/10/20.
//  Copyright © 2020 Joshu Sonawane. All rights reserved.
//

import UIKit

class AlbumInfoBottomVC: RSSAlbumDetailVC {
    
    var album: Album?  = nil
    var delegate: AlbumInfoVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let album = album else {
            self.presentRSSAlertOnMainThread(title: "Error", message: "Album not found or invalid", buttonTitle: "OK")
            return
        }
        urlString = album.url
        setAlbum(album: album)
    }
    
    init(album: Album){
        super.init(nibName: nil, bundle: nil)
        self.album = album

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setAlbum(album: Album) {
        artistNameView.set(infoType: .artistName, value: album.artistName)
        copyRightView.set(infoType: .copyright, value: album.copyright)
        releaseDateView.set(infoType: .releaseDate, value: album.releaseDate.convertToDisplay())
        let genreList = Helper.shared.genreNameList(genres: album.genres)
        genreView.set(infoType: .genre, value: genreList)
        storeLinkButton.set(backgroundColor: .systemPurple, title: "Go to Store")
        storeLinkButton.addTarget(self, action: #selector(storeLinkTapped), for: .touchUpInside)
    }
    
    @objc func storeLinkTapped() {
        delegate?.didTapStoreLink(urlString: urlString)
    }
}
