//
//  CheckinTableViewCell.swift
//  WoopSicredi-Test
//
//  Created by Rafael Krentz Gonçalves on 8/31/19.
//  Copyright © 2019 Rafael.Krentz. All rights reserved.
//

import UIKit

class CheckinTableViewCell: UITableViewCell {

    @IBOutlet weak var checkinButton: UIButton!{
        didSet{
            checkinButton.layer.cornerRadius = 15
            checkinButton.clipsToBounds = true
            
        }
    }
  
    var item: EventViewModelItem?
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    
    
}
