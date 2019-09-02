//
//  Service.swift
//  WoopSicredi-Test
//
//  Created by Rafael.Krentz on 29/08/19.
//  Copyright © 2019 Rafael.Krentz. All rights reserved.
//

import Foundation
import Alamofire

class Service {
    
    static let shared = Service()

    func getEventsList(completionHandler: @escaping ([Event]?,Error?) -> Void) {
        Alamofire.request("http://5b840ba5db24a100142dcd8c.mockapi.io/api/events/").responseJSON { response in
            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        let jsonDecoder = JSONDecoder()
                        let json = try jsonDecoder.decode([Event]?.self, from: data)
                        completionHandler(json,nil)
                    } catch let error{
                        completionHandler(nil, error)
                    }
                }
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
    
    func checkin(name: String, email: String,eventID: String, completionHandler: @escaping (Bool?,Error?) -> Void) {
        
        let params = ["eventId" : eventID,
                      "name" : name,
                      "email" : email]
        
        Alamofire.request("https://5b840ba5db24a100142dcd8c.mockapi.io/api/checkin", method: .post, parameters: params).responseJSON { response in
            switch response.result {
            case .success:
                completionHandler(true, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
    
}
