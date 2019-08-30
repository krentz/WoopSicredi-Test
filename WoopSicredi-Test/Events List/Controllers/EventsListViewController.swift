//
//  ViewController.swift
//  WoopSicredi-Test
//
//  Created by Rafael.Krentz on 29/08/19.
//  Copyright © 2019 Rafael.Krentz. All rights reserved.
//

import UIKit

class EventsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicatorActivity: UIActivityIndicatorView!
    var eventList : [EventsList] = [EventsList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = .eventsNavigationTitle
        self.tableView.register(UINib(nibName: "EventsTableViewCell", bundle: nil), forCellReuseIdentifier: "eventsCellID")
       
        self.getEventsList()
    }
    
    func getEventsList(){
        Service.shared.getEventsList(completionHandler: { response,error  in
            if let errorLocalizedDescription = error?.localizedDescription {
                self.showAlertPopup(title: "Ops!" , message: errorLocalizedDescription, in: self)
            }
            else{
                self.eventList = response!
                DispatchQueue.main.async {
                    self.tableView.showTableViewWithAnimation()
                    self.indicatorActivity.stopAnimating()
                }
            }
        })
    }
}


//----------------------------- TABLE VIEW ------------------------------------------

extension EventsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clicked event : \(self.eventList[indexPath.row].title)")
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

extension EventsListViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell = self.tableView.dequeueReusableCell(withIdentifier: "eventsCellID", for: indexPath) as! EventsTableViewCell
        
        cell.titleLabel.text = self.eventList[indexPath.row].title
    
        return cell
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.eventList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}



