//
//  PriceTableViewCell.swift
//  WoopSicredi-Test
//
//  Created by Rafael Krentz Gonçalves on 8/31/19.
//  Copyright © 2019 Rafael.Krentz. All rights reserved.
//

import UIKit

class PriceTableViewCell: UITableViewCell {

    @IBOutlet weak var priceLabel: UILabel?
    
    var item: EventViewModelItem? {
        didSet {
            guard let item = item as? EventViewModelPriceItem else {
                return
            }
            
            priceLabel?.text = item.price.getPriceWithMask()
        }
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    
}
