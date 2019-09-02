//
//  ViewController.swift
//  WoopSicredi-Test
//
//  Created by Rafael.Krentz on 29/08/19.
//  Copyright © 2019 Rafael.Krentz. All rights reserved.
//

import UIKit
import Kingfisher

class EventsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicatorActivity: UIActivityIndicatorView!
    var eventList : [Event] = [Event]()
    var viewModel = EventListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = .eventsNavigationTitle
        self.tableView.register(EventsTableViewCell.nib, forCellReuseIdentifier: EventsTableViewCell.identifier)
       
        self.getEventsList()
        
        tableView?.delegate = viewModel
        tableView?.estimatedRowHeight = 100
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.preservesSuperviewLayoutMargins = false
        tableView?.separatorInset = UIEdgeInsets.zero
        tableView?.layoutMargins = UIEdgeInsets.zero
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.showEventDetail(_:)), name: .detailSegue, object: nil)
    }
    deinit {
        NotificationCenter.default.removeObserver(self, name: .detailSegue, object: nil)
    }
    
    
    @objc func showEventDetail(_ notification: NSNotification){
        self.performSegue(withIdentifier: "showDetailEventView", sender: notification.object)
    }
    func getEventsList(){
        Service.shared.getEventsList(completionHandler: { response,error  in
            if error != nil {
                self.showAlertPopup(title: "Ops!" , message: "Ocorreu um erro ao tentar buscar os eventos. Gostaria de tentar novamente?", closeButtonCompletion: {
                    self.getEventsList()
                })
            }
            else{
                self.viewModel.eventList = response!
                self.tableView?.dataSource = self.viewModel
                DispatchQueue.main.async {
                    self.tableView.showTableViewWithAnimation()
                    self.indicatorActivity.stopAnimating()
                }
            }
        })
    }
    //segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showDetailEventView") {
            let vc = segue.destination as! EventDetailViewController
            vc.viewModel = EventDetailViewModel(event: (sender as? Event)!)
            vc.event = sender as? Event
        }
    }
    
}

