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
    let bottomView = UIView()
    let speechService = SpeechService()
    let speechButton  = RSSButton(backgroundColor: .systemOrange, title: "Speech")
    
    let albumName       = RSSTitleLabel(textAlignment: .center, fontSize: 18, weight: .bold)
    let albumArtwork    = RSSImageView(frame: .zero)
    
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
            self.presentRSSAlertOnMainThread(title: "Error", message: "Album not found or invalid", buttonTitle: "OK")
            return
        }
        configureLayout()
        albumArtwork.getImage(from: album.artworkUrl100)
        albumName.text = album.name
        let bottomInfoVC = AlbumInfoBottomVC(album: album, delegate: self)
        self.add(childVC: bottomInfoVC, to: self.bottomView)
        speechButton.addTarget(self, action: #selector(speakNextSpeed), for: .touchUpInside)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        speechService.stopPlaying()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = album?.name
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    @objc func speakNextSpeed() {
        guard let album = album else { return }
        speechService.changeRate()
        speechService.say("Album is\(String(describing: album.name)) and artist is \(String(describing: album.artistName))")
    }
    
    func configureLayout() {
        view.addSubview(albumArtwork)
        view.addSubview(albumName)
        view.addSubview(bottomView)
        view.addSubview(speechButton)
        
        albumArtwork.translatesAutoresizingMaskIntoConstraints = false
        albumName.translatesAutoresizingMaskIntoConstraints = false
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            albumName.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: padding),
            albumName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            albumName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            albumName.heightAnchor.constraint(equalToConstant: padding),
            
            albumArtwork.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            albumArtwork.bottomAnchor.constraint(equalTo: albumName.topAnchor, constant: -padding),
            albumArtwork.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            albumArtwork.widthAnchor.constraint(equalTo: albumArtwork.heightAnchor),
            
            speechButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
            speechButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            speechButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            bottomView.topAnchor.constraint(equalTo: albumName.bottomAnchor, constant: padding/2),
            bottomView.bottomAnchor.constraint(equalTo: speechButton.topAnchor, constant: -padding)

        ])
    }
}
