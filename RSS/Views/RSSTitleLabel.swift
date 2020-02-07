//
//  RSSTitleLabel.swift
//  RSS
//
//  Created by Joshu Sonawane on 2/2/20.
//  Copyright © 2020 Joshu Sonawane. All rights reserved.
//

import UIKit

class RSSTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment, fontSize: CGFloat, weight: UIFont.Weight = .bold) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        configure()
    }
    
    private func configure() {
        textColor                                   = .label
        adjustsFontSizeToFitWidth                   = true
        minimumScaleFactor                          = 0.9
        lineBreakMode                               = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints   = false
    }
}
