//
//  EventsTableViewCell.swift
//  WoopSicredi-Test
//
//  Created by Rafael.Krentz on 30/08/19.
//  Copyright © 2019 Rafael.Krentz. All rights reserved.
//

import UIKit

class EventsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
   
    @IBOutlet weak var eventImage: UIImageView!{
        didSet{
            eventImage.layer.cornerRadius = 5
        }
    }
    
    @IBOutlet weak var roundView: UIView!{
        didSet{
            roundView.layer.cornerRadius = 5
            roundView.layer.shadowColor = UIColor.gray.cgColor
            roundView.layer.shadowOpacity = 0.5
            roundView.layer.shadowOffset = CGSize.zero
            roundView.layer.shadowRadius = 3
        }
    }
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        eventImage.layer.cornerRadius = 5
        eventImage.clipsToBounds = true
    }
}
