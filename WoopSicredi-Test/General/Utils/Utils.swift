//
//  Utils.swift
//  WoopSicredi-Test
//
//  Created by Rafael Krentz Gonçalves on 8/29/19.
//  Copyright © 2019 Rafael.Krentz. All rights reserved.
//

import Foundation

class Utils {
    
    static let shared = Utils()
    
    func getFormattedDate(timeInterval: Int) -> String{
        let date = Date(timeIntervalSince1970: TimeInterval(timeInterval/1000))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd 'de' MMM 'de' yyyy, HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "pt_BR")
        
        return dateFormatter.string(from: date)
    }
    
}
