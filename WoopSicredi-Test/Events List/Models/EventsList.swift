//
//  EventsList.swift
//  WoopSicredi-Test
//
//  Created by Rafael.Krentz on 29/08/19.
//  Copyright © 2019 Rafael.Krentz. All rights reserved.
//

import Foundation

struct EventsList : Codable {
    
    var date : Int
    var description : String
    var image : String
   // var longitude : String
   // var latitude : String
    var price: Double
    var title : String
    var id : String
    var cupons : [Coupon]
    var people : [Person]
    
}
