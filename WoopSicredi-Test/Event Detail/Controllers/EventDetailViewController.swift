//
//  EventDetailViewController.swift
//  WoopSicredi-Test
//
//  Created by Rafael.Krentz on 30/08/19.
//  Copyright © 2019 Rafael.Krentz. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {

    var event : Event!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.setNavigation()
        self.layoutSubviews()
      
    }
    
    
   
    
    func setNavigation(){
        self.navigationItem.title = "Evento"
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
    }
    func layoutSubviews() {
        self.titleLabel.text = event.title
        self.descriptionLabel.text = event.description
        self.priceLabel.text = event.price.getPriceWithMask()
        self.dateLabel.text = Utils.shared.getFormattedDate(timeInterval: event.date)
    }
}
