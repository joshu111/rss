//
//  AlbumsListVC.swift
//  RSS
//
//  Created by Joshu Sonawane on 2/2/20.
//  Copyright © 2020 Joshu Sonawane. All rights reserved.
//

import UIKit

class AlbumsListVC: UIViewController {

    let tableView       = UITableView()
    var albums: [Album] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAlbumsList()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Albums List"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame         = view.bounds
        tableView.rowHeight     = 81
        tableView.delegate      = self
        tableView.dataSource    = self
        tableView.register(AlbumCell.self, forCellReuseIdentifier: AlbumCell.reuseID)
    }
    
    func getAlbumsList() {
        let loadingScreen = RSSLoadingScreen(frame: view.bounds)
        view.addSubview(loadingScreen)
        NetworkManager.shared.getAlbums { [weak self] result in
            DispatchQueue.main.async {
                loadingScreen.removeFromSuperview()
            }
            guard let self = self else { return }
            switch result {
                case.success(let dataRoot):
                    self.albums = dataRoot.feed.results
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                case.failure(let error):
                    self.presentRSSAlertOnMainThread(title: "Error occured", message: error.rawValue, buttinTitle: "OK")
            }
        }
    }
}

extension AlbumsListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlbumCell.reuseID) as! AlbumCell
        let album = albums[indexPath.row]
        cell.set(album: album)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let album = albums[indexPath.row]
        let destVC = AlbumInfoVC()
        destVC.album = album
        destVC.title = album.name
        navigationController?.pushViewController(destVC, animated: true)
    }
    
}
