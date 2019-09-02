//
//  LocationTableViewCell.swift
//  WoopSicredi-Test
//
//  Created by Rafael Krentz Gonçalves on 8/31/19.
//  Copyright © 2019 Rafael.Krentz. All rights reserved.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var latitude = 0.0
    var longitude = 0.0
    
    var item: EventViewModelItem? {
        didSet {
            guard let item = item as? EventViewModelLocationItem else {
                return
            }
            
            if let latDouble = item.latitude as? Double, let lonDouble = item.longitude as? Double {
                self.latitude = latDouble
                self.longitude = lonDouble
            }
            else{
                self.latitude = (item.latitude as! NSString).doubleValue
                self.longitude = (item.longitude as! NSString).doubleValue
            }
            
            Utils.shared.getAddressFromLatLon(latitude: self.latitude , longitude: self.longitude, completionHandler: { address, error in
                self.addressLabel.text = address
                self.addressLabel.alpha = 1
                self.activityIndicator.isHidden = true
            } )
      
        }
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }

    
}
