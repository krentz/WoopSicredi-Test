//
//  Utils.swift
//  WoopSicredi-Test
//
//  Created by Rafael Krentz Gonçalves on 8/29/19.
//  Copyright © 2019 Rafael.Krentz. All rights reserved.
//

import Foundation
import CoreLocation

class Utils {
    
    static let shared = Utils()
    
    func getFormattedDate(timeInterval: Int) -> String{
        let date = Date(timeIntervalSince1970: TimeInterval(timeInterval/1000))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd 'de' MMM 'de' yyyy, HH:mm"
        dateFormatter.locale = Locale(identifier: "pt_BR")
        
        return dateFormatter.string(from: date)
    }
    
    func makeShareText(event: Event) -> String{
        return "Evento: \(event.title)\n\nPreço: \(event.price.getPriceWithMask())\n\nData: \(self.getFormattedDate(timeInterval: event.date))\n\n\(event.description)"
    }
    
    func getAddressFromLatLon(latitude: Double, longitude: Double, completionHandler: @escaping (String,Error?) -> Void) {
        
        let location = CLLocation(latitude: latitude, longitude: longitude)

        location.geocode { placemark, error in
            if let error = error as? CLError {
                print("CLError:", error)
                return
            } else if let placemark = placemark?.first {
                DispatchQueue.main.async {
                    let address = "\(String(describing: placemark.thoroughfare ?? "")) , \(String(describing: placemark.subThoroughfare ?? "")) - \(placemark.locality ?? "")"
                    
                    completionHandler(address,nil)
                }
            }
        }
    }
}

extension CLLocation {
    func geocode(completion: @escaping (_ placemark: [CLPlacemark]?, _ error: Error?) -> Void)  {
        CLGeocoder().reverseGeocodeLocation(self, completionHandler: completion)
    }
}
