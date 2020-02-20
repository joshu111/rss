//
//  AlbumCell.swift
//  RSS
//
//  Created by Joshu Sonawane on 2/5/20.
//  Copyright © 2020 Joshu Sonawane. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {

    static let reuseID  = "AlbumCell"
    let padding: CGFloat         = 9
        
    let albumArtwork    = RSSImageView(frame: .zero)
    let albumName       = RSSTitleLabel(textAlignment: .center, fontSize: 18)
    let artistName      = RSSBodyLabel(textAlignment: .center)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(album: Album) {
        albumName.text  = album.name
        artistName.text = album.artistName
        albumArtwork.getImage(from: album.artworkUrl100)
        albumArtwork.isAccessibilityElement = true
        albumArtwork.accessibilityHint      = "Album Artwork Image"

        albumName.isAccessibilityElement    = true
        albumName.accessibilityHint         = "Name of the Album is \(album.name)"

        artistName.isAccessibilityElement   = true
        artistName.accessibilityHint        = "Name of the artist"
        artistName.accessibilityValue       = "Artist is \(album.artistName)"
    }
    
    private func configure() {
        addSubview(albumArtwork)
        addSubview(albumName)
        addSubview(artistName)
        accessoryType   = .disclosureIndicator
        NSLayoutConstraint.activate([
            albumArtwork.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            albumArtwork.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            albumArtwork.heightAnchor.constraint(equalToConstant: 63),
            albumArtwork.widthAnchor.constraint(equalToConstant: 63),
            
            albumName.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            albumName.bottomAnchor.constraint(equalTo: self.centerYAnchor),
            albumName.leadingAnchor.constraint(equalTo: albumArtwork.trailingAnchor, constant: padding),
            albumName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            
            artistName.topAnchor.constraint(equalTo: self.centerYAnchor, constant: padding),
            artistName.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            artistName.leadingAnchor.constraint(equalTo: albumArtwork.trailingAnchor, constant: padding),
            artistName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding)
        ])
    }
}
