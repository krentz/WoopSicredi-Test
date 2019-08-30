//
//  EventDetailViewController.swift
//  WoopSicredi-Test
//
//  Created by Rafael.Krentz on 30/08/19.
//  Copyright © 2019 Rafael.Krentz. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {

    var eventList : EventsList!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNavigation()
    }
    
    func setNavigation(){
        self.navigationItem.title = "Evento"
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
    }
  
}
