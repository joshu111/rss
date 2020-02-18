//
//  Helper.swift
//  RSS
//
//  Created by Joshu Sonawane on 2/9/20.
//  Copyright © 2020 Joshu Sonawane. All rights reserved.
//

import UIKit

class Helper {
    static let shared = Helper()
    
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
    
    func setConstaint(constraints: [NSLayoutConstraint], level: Float = 999) {
        for constraint in constraints {
            constraint.priority = UILayoutPriority(rawValue: level)
            constraint.isActive = true
        }
    }
}
