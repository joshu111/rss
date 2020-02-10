//
//  Date+Extension.swift
//  RSS
//
//  Created by Joshu Sonawane on 2/9/20.
//  Copyright © 2020 Joshu Sonawane. All rights reserved.
//

import Foundation

extension Date {
    func dateToMMMddyyyy() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        return dateFormatter.string(from: self)
    }
}
