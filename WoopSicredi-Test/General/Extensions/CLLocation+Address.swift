//
//  CLLocation+Address.swift
//  WoopSicredi-Test
//
//  Created by Rafael.Krentz on 02/09/19.
//  Copyright © 2019 Rafael.Krentz. All rights reserved.
//

import CoreLocation

extension CLLocation {
    func geocode(completion: @escaping (_ placemark: [CLPlacemark]?, _ error: Error?) -> Void)  {
        CLGeocoder().reverseGeocodeLocation(self, completionHandler: completion)
    }
}
