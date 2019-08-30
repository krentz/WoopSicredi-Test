//
//  UIViewController+General.swift
//  WoopSicredi-Test
//
//  Created by Rafael.Krentz on 30/08/19.
//  Copyright © 2019 Rafael.Krentz. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlertPopup(title: String,
                   message: String,
                   closeButtonCompletion: (() -> ())? = nil ){
                   
        guard let popvc = UIStoryboard(name: "Popups", bundle: nil).instantiateViewController(withIdentifier: "alertPopupID") as? PopupAlertViewController else { return }
        
        popvc.alertTitle = title
        popvc.alertMessage = message
        popvc.completionAction = closeButtonCompletion
        
        self.addChild(popvc)
        popvc.view.frame = UIScreen.main.bounds
        self.view.addSubview(popvc.view)
        popvc.didMove(toParent: self)
        
    }
}
