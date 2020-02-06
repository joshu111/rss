//
//  Genre.swift
//  RSS
//
//  Created by Joshu Sonawane on 2/4/20.
//  Copyright © 2020 Joshu Sonawane. All rights reserved.
//

import Foundation

struct Genre: Codable {
    let name: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name, url
    }
}
