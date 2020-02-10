//
//  String+Extension.swift
//  RSS
//
//  Created by Joshu Sonawane on 2/9/20.
//  Copyright © 2020 Joshu Sonawane. All rights reserved.
//

import Foundation

extension String {
    func convertToDate() -> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale     = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone   = .current
        
        return dateFormatter.date(from: self)
    }
    
    func convertToDisplay() -> String {
        guard let date = self.convertToDate() else { return "Invalid Date"}
        return date.dateToMMMddyyyy()
    }
}
