//
//  EventDetailViewController.swift
//  WoopSicredi-Test
//
//  Created by Rafael.Krentz on 30/08/19.
//  Copyright © 2019 Rafael.Krentz. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {

    var viewModel : EventDetailViewModel!
    var event : Event!
    
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.checkinAction), name: .checkin, object: nil)
    }
   deinit {
        NotificationCenter.default.removeObserver(self, name: .checkin, object: nil)
    }
    
    @objc func checkinAction(){
        self.showChekinPopup(actionButtonCompletion: { name, email in
            if name != "", email != ""{
                Service.shared.checkin(name: name, email: email, eventID: self.event.id, completionHandler: { success,error  in
                    if success == true {
                        self.showSampleNativeAlert(title: "Parabéns!", message: "Checkin feito com sucesso!.")
                    }
                    else{
                        self.showSampleNativeAlert(title: "Ops", message: "Ocorreu um problema com o servidor, por favor tente novamente.")
                    }
                })
            }
            else{
                self.showSampleNativeAlert(title: "Ops", message: "Os dois campos devem ser preenchidos para que o checkin possa ser feito.")
            }
        })
    }
    
    @IBAction func shareEvent(_ sender: Any) {
        
        let shareText = Utils.shared.makeShareText(event: self.event)
        
            let vc = UIActivityViewController(activityItems: [shareText], applicationActivities: [])
            present(vc, animated: true)
      
    }
    func setNavigation(){
        self.navigationItem.title = "Evento"
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
    }

}
