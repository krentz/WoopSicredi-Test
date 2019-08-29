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

    func getEventsList(completionHandler: @escaping (Bool?,Error?) -> Void) {
        Alamofire.request("http://5b840ba5db24a100142dcd8c.mockapi.io/api/events/").responseJSON { response in

            switch response.result {
            case .success:
                completionHandler(true, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
            
        }
    }
   
    
}
