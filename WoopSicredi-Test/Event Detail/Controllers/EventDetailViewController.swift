//
//  EventDetailViewController.swift
//  WoopSicredi-Test
//
//  Created by Rafael.Krentz on 30/08/19.
//  Copyright © 2019 Rafael.Krentz. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {

    var viewModel : EventDetailViewModel! // (event: self.event)

    @IBOutlet weak var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNavigation()
        
        tableView?.dataSource = viewModel
        
        tableView?.estimatedRowHeight = 100
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.preservesSuperviewLayoutMargins = false
        tableView?.separatorInset = UIEdgeInsets.zero
        tableView?.layoutMargins = UIEdgeInsets.zero
        
        tableView?.register(DescriptionTableViewCell.nib, forCellReuseIdentifier: DescriptionTableViewCell.identifier)
        tableView?.register(PriceTableViewCell.nib, forCellReuseIdentifier: PriceTableViewCell.identifier)
        tableView?.register(DateTableViewCell.nib, forCellReuseIdentifier: DateTableViewCell.identifier)
        tableView?.register(LocationTableViewCell.nib, forCellReuseIdentifier: LocationTableViewCell.identifier)
        tableView?.register(CheckinTableViewCell.nib, forCellReuseIdentifier: CheckinTableViewCell.identifier)
        tableView?.register(HeaderTableViewCell.nib, forCellReuseIdentifier: HeaderTableViewCell.identifier)
        
    }
    
    func setNavigation(){
        self.navigationItem.title = "Evento"
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
    }

}
