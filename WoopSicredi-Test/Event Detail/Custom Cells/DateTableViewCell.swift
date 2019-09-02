//
//  DateTableViewCell.swift
//  WoopSicredi-Test
//
//  Created by Rafael Krentz Gonçalves on 8/31/19.
//  Copyright © 2019 Rafael.Krentz. All rights reserved.
//

import UIKit

class DateTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel?
    
    var item: EventViewModelItem? {
        didSet {
            guard let item = item as? EventViewModelDateItem else {
                return
            }
            
            dateLabel?.text = Utils.shared.getFormattedDate(timeInterval: item.date)
        }
    }
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    static var identifier: String {
        return String(describing: self)
    }
}
