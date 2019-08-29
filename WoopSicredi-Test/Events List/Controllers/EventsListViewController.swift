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
        
       
        self.getEventsList()
    }
    
    func getEventsList(){
        Service.shared.getEventsList(completionHandler: { response,error  in
            if error != nil {
                
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
        return 60
    }
}

extension EventsListViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = self.eventList[indexPath.row].title
        cell.textLabel?.textAlignment = .center
        
        //line separator
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        
        //remove extra separator
        self.tableView.tableFooterView = UIView()
        
        return cell
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.eventList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}



