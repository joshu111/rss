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
    let padding: CGFloat = 20
    var itemViews: [UIView] = []
    
    let albumName       = RSSTitleLabel(textAlignment: .center, fontSize: 18, weight: .bold)
    let albumArtwork    = RSSImageView(frame: .zero)
    let artistNameView  = RSSInfoBlock(frame: .zero)
    let releaseDateView = RSSInfoBlock(frame: .zero)
    let copyRightView   = RSSInfoBlock(frame: .zero)
    let genreView       = RSSInfoBlock(frame: .zero)
    let storeLink       = RSSButton(backgroundColor: .systemRed, title: "Store Link")
    
    init(album: Album){
        super.init(nibName: nil, bundle: nil)
        self.album = album
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        guard let album = album else {
            self.presentRSSAlertOnMainThread(title: "Error", message: "Album not found or invalid", buttinTitle: "OK")
            return
        }
        
        configureLayout()
        setAlbum(album: album)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = album?.name
        self.navigationItem.largeTitleDisplayMode = .never
    }

    func configureLayout() {
        view.addSubview(albumArtwork)
        view.addSubview(albumName)
        view.addSubview(storeLink)
        
        albumArtwork.translatesAutoresizingMaskIntoConstraints = false
        albumName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            albumArtwork.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding*3),
            albumArtwork.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding*3),
            albumArtwork.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            albumArtwork.heightAnchor.constraint(equalTo: albumArtwork.widthAnchor),
            
            albumName.topAnchor.constraint(equalTo: albumArtwork.bottomAnchor, constant: padding),
            albumName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            storeLink.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            storeLink.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            storeLink.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding)
        ])
        
        itemViews = [artistNameView, releaseDateView, genreView, copyRightView]
        for (index,itemView) in itemViews.enumerated() {
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints  = false
            itemView.backgroundColor = .systemGray6
            if index == 0 {
                NSLayoutConstraint.activate([itemView.topAnchor.constraint(equalTo: albumName.bottomAnchor, constant: padding/2)])
            } else {
                NSLayoutConstraint.activate([itemView.topAnchor.constraint(equalTo: itemViews[index - 1].bottomAnchor, constant: padding/2)])
            }
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
                itemView.heightAnchor.constraint(equalToConstant: padding*2)
            ])
        }
        
    }
    
    func setAlbum(album: Album) {
        albumArtwork.getImage(from: album.artworkUrl100)
        albumName.text = album.name
        artistNameView.set(infoType: .artistName, value: album.artistName)
        copyRightView.set(infoType: .copyright, value: album.copyright)
        releaseDateView.set(infoType: .releaseDate, value: album.releaseDate.convertToDisplay())
        let genreList = GenreFormatter.shared.genreNameList(genres: album.genres) 
        genreView.set(infoType: .genre, value: genreList)
    }

}
