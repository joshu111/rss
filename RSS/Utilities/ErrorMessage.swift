//
//  ErrorMessage.swift
//  RSS
//
//  Created by Joshu Sonawane on 2/5/20.
//  Copyright © 2020 Joshu Sonawane. All rights reserved.
//

import Foundation

enum RSSError: String, Error{
    
    case urlInvalid         = "Invalid URL calculated"
    case unableToComplete   = "Unable to complete the request. Check Internet Connection"
    case invalideResponse   = "Invalid Response recieved from server"
    case invalidData        = "Data recieved from server is not valid"
    case cannotDecode       = "Data recieved can not be iterpreted"
}
