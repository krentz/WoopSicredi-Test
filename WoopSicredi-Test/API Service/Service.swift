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
       
        guard let url = URL(string: .eventListURL) else{ return }
       
        Alamofire.request(url).responseJSON { response in
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
        
        guard let url = URL(string: .checkinURL) else{ return }
        
        let params = ["eventId" : eventID,
                      "name" : name,
                      "email" : email]
        
        Alamofire.request(url, method: .post, parameters: params).responseJSON { response in
            switch response.result {
            case .success:
                completionHandler(true, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
    
}
