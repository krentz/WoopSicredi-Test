//
//  HeaderTableViewCell.swift
//  WoopSicredi-Test
//
//  Created by Rafael Krentz Gonçalves on 8/31/19.
//  Copyright © 2019 Rafael.Krentz. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var headerTitle: UILabel!
    
    var item: EventViewModelItem? {
        didSet {
            guard let item = item as? EventViewModelHeaderItem else {
                return
            }
            
            headerTitle?.text = item.header
        }
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }



}


