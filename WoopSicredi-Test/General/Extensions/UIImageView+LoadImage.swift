//
//  UIImageView+LoadImage.swift
//  WoopSicredi-Test
//
//  Created by Rafael.Krentz on 30/08/19.
//  Copyright © 2019 Rafael.Krentz. All rights reserved.
//

import UIKit

extension UIImageView {
    public func loadImage(url: String) {
        var kf = self.kf
        kf.cancelDownloadTask()
        kf.indicatorType = .activity
        kf.setImage(
            with: URL(string: url),
            placeholder: UIImage(named: "placeholder"),
            options: [.transition(.fade(0.2))] ) {
            result in
          
        }
    }
}
