//
//  GenreFormatter.swift
//  RSS
//
//  Created by Joshu Sonawane on 2/9/20.
//  Copyright © 2020 Joshu Sonawane. All rights reserved.
//

import Foundation

class GenreFormatter {
    static let shared = GenreFormatter()
    
    func genreNameList(genres : [Genre]) -> String {
        var genreList = ""
        for (index, genre) in genres.enumerated() {
            if (index == 0) {
                genreList = genre.name
            } else {
                genreList += ", " + genre.name
            }
        }
        return genreList
    }
}
