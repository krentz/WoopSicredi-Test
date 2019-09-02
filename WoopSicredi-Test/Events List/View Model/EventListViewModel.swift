//
//  EventListViewModel.swift
//  WoopSicredi-Test
//
//  Created by Rafael.Krentz on 02/09/19.
//  Copyright © 2019 Rafael.Krentz. All rights reserved.
//

import UIKit

class EventListViewModel: NSObject {
    var eventList = [Event]()
}

//----------------------------- TABLE VIEW ------------------------------------------

extension EventListViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NotificationCenter.default.post(name: .detailSegue, object: self.eventList[indexPath.row],userInfo: nil)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

extension EventListViewModel: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: EventsTableViewCell.identifier, for: indexPath) as! EventsTableViewCell
        
        cell.titleLabel.text = self.eventList[indexPath.row].title
        cell.eventImage?.loadImage(url: self.eventList[indexPath.row].image)
        cell.dateLabel?.text = Utils.shared.getFormattedDate(timeInterval: self.eventList[indexPath.row].date)
        cell.priceLabel?.text = self.eventList[indexPath.row].price.getPriceWithMask()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.eventList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}



