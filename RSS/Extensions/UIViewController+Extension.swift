//
//  UIViewControllerExtension.swift
//  RSS
//
//  Created by Joshu Sonawane on 2/2/20.
//  Copyright © 2020 Joshu Sonawane. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentRSSAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = RSSAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle  = .overFullScreen
            alertVC.modalTransitionStyle    = .crossDissolve
            self.present(alertVC, animated: true, completion: nil)
        }
    }
}
