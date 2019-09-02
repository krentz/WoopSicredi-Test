//
//  EventDetailViewModel.swift
//  WoopSicredi-Test
//
//  Created by Rafael Krentz Gonçalves on 8/31/19.
//  Copyright © 2019 Rafael.Krentz. All rights reserved.
//

import Foundation
import UIKit

enum EventViewModelItemType {
    case header
    case description
    case price
    case date
    case location
    case checkin
}

protocol EventViewModelItem {
    var type: EventViewModelItemType { get }
    var rowCount: Int { get }
}

class EventDetailViewModel: NSObject {
    var items = [EventViewModelItem]()
 
    init(event: Event) {
        items.append(EventViewModelHeaderItem(header: event.title))
        items.append(EventViewModelDescriptionItem(description: event.description))
        items.append(EventViewModelPriceItem(price: event.price))
        items.append(EventViewModelLocationItem(latitude: event.latitude, longitude: event.longitude))
        items.append(EventViewModelDateItem(date: event.date))
        items.append(EventViewModelCheckinItem())
    }
}

extension EventDetailViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        switch item.type {
            case .header:
                if let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier, for: indexPath) as? HeaderTableViewCell {
                    cell.item = item
                    return cell
                }
            case .description:
                if let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionTableViewCell.identifier, for: indexPath) as? DescriptionTableViewCell {
                    cell.item = item
                    return cell
                }
            case .price:
                if let cell = tableView.dequeueReusableCell(withIdentifier: PriceTableViewCell.identifier, for: indexPath) as? PriceTableViewCell {
                    cell.item = item
                    return cell
                }
            case .date:
                if let cell = tableView.dequeueReusableCell(withIdentifier: DateTableViewCell.identifier, for: indexPath) as? DateTableViewCell {
                    cell.item = item
                    return cell
                }
            case .location:
                if let cell = tableView.dequeueReusableCell(withIdentifier: LocationTableViewCell.identifier, for: indexPath) as? LocationTableViewCell {
                    cell.item = item
                    return cell
                }
            case .checkin:
                if let cell = tableView.dequeueReusableCell(withIdentifier: CheckinTableViewCell.identifier, for: indexPath) as? CheckinTableViewCell {
                    cell.item = item
                   // cell.checkinDelegate = delegate
                    return cell
                }
        }
        return UITableViewCell()
    }
    
}

class EventViewModelDescriptionItem: EventViewModelItem {
    var type: EventViewModelItemType {
        return .description
    }
   
    var rowCount: Int {
        return 1
    }

    var description: String
    
    init(description: String) {
        self.description = description
    }
}
class EventViewModelPriceItem: EventViewModelItem {
    
    var type: EventViewModelItemType {
        return .price
    }
    
    var rowCount: Int {
        return 1
    }
    
    var price: Double
    
    init(price: Double) {
        self.price = price
    }
}
class EventViewModelDateItem: EventViewModelItem {
    
    var type: EventViewModelItemType {
        return .date
    }
    
    var rowCount: Int {
        return 1
    }
    
    var date: Int
    
    init(date: Int) {
        self.date = date
    }
}
class EventViewModelLocationItem: EventViewModelItem {
    
    var type: EventViewModelItemType {
        return .location
    }
    
    var rowCount: Int {
        return 1
    }
    
    var latitude: Any
    var longitude: Any
    
    init(latitude: Any, longitude: Any) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
class EventViewModelCheckinItem: EventViewModelItem {
    
    var type: EventViewModelItemType {
        return .checkin
    }
    
    var rowCount: Int {
        return 1
    }
   
 }
class EventViewModelHeaderItem: EventViewModelItem {
    
    var type: EventViewModelItemType {
        return .header
    }
    
    var rowCount: Int {
        return 1
    }
    
    var header: String
    
    init(header: String) {
        self.header = header
    }
}

