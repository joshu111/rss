//
//  Feed.swift
//  RSS
//
//  Created by Joshu Sonawane on 2/4/20.
//  Copyright © 2020 Joshu Sonawane. All rights reserved.
//

import Foundation

struct Feed: Codable {
    let title: String
    let results: [Album]
}
