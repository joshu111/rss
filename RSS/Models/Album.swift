//
//  AlbumsList.swift
//  RSS
//
//  Created by Joshu Sonawane on 2/3/20.
//  Copyright © 2020 Joshu Sonawane. All rights reserved.
//

import Foundation


struct Album: Codable {
    let artistName, releaseDate, name: String
    let copyright: String
    let artworkUrl100: String
    let genres: [Genre]
    let url: String

    enum CodingKeys: String, CodingKey {
        case artistName, releaseDate, name, copyright
        case artworkUrl100, genres, url
    }
}
