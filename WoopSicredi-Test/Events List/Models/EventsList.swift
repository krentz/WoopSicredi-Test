//
//  EventsList.swift
//  WoopSicredi-Test
//
//  Created by Rafael.Krentz on 29/08/19.
//  Copyright © 2019 Rafael.Krentz. All rights reserved.
//

import Foundation

struct EventsList: Decodable {
    var date : Int
    var description : String
    var image : String
    var longitude : Any
    var latitude : Any
    var price: Double
    var title : String
    var id : String
    var cupons : [Coupon]
    var people : [Person]
    
    enum CodingKeys : String, CodingKey {
        case date
        case description
        case image
        case price
        case title
        case id
        case cupons
        case people
        case latitude
        case longitude
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
         date = try values.decode(Int.self, forKey: .date)
         description = try values.decode(String.self, forKey: .description)
         image = try values.decode(String.self, forKey: .image)
         title = try values.decode(String.self, forKey: .title)
         id = try values.decode(String.self, forKey: .id)
         cupons = try values.decode([Coupon].self, forKey: .cupons)
         people = try values.decode([Person].self, forKey: .people)
         price = try values.decode(Double.self, forKey: .price)
        
        if let stringProperty = try? values.decode(String.self, forKey: .latitude) {
            latitude = stringProperty
        } else {
            latitude = try values.decode(Double.self, forKey: .latitude)
        }
        
        if let stringProperty = try? values.decode(String.self, forKey: .longitude) {
            longitude = stringProperty
        } else {
            longitude = try values.decode(Double.self, forKey: .longitude)
        }
        
        
    }
    
}
