//
//  AlbumInfoVC+Extension.swift
//  RSS
//
//  Created by Joshu Sonawane on 2/13/20.
//  Copyright © 2020 Joshu Sonawane. All rights reserved.
//

import UIKit
import SafariServices

extension AlbumInfoVC: AlbumInfoBottomVCDelegate {
    func didTapStoreLink(urlString: String) {
        guard let url = URL(string: urlString) else {
            self.presentRSSAlertOnMainThread(title: "Error", message: "Invalid URL", buttonTitle: "OK")
            return
        }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
}
