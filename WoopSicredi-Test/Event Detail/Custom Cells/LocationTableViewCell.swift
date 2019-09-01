//
//  LocationTableViewCell.swift
//  WoopSicredi-Test
//
//  Created by Rafael Krentz Gonçalves on 8/31/19.
//  Copyright © 2019 Rafael.Krentz. All rights reserved.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

    @IBOutlet weak var howToGetButton: UIButton!{
        didSet{
            howToGetButton.setTitleColor(UIColor.blue, for: .normal)
        }
    }
    
    var latitude = 0.0
    var longitude = 0.0
    
    var item: EventViewModelItem? {
        didSet {
            guard let item = item as? EventViewModelLocationItem else {
                return
            }
            if let long = item.longitude as? Double {
                self.longitude = long
            }
            if let lat = item.latitude as? Double {
                self.latitude = lat
            }
        }
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }

    
}
