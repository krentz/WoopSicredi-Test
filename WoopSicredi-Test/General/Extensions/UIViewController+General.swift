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
    
    func showChekinPopup (actionCancelButtonCompletion: (() -> ())? = nil,
                          actionButtonCompletion: ((_ name: String, _ email: String) -> ())? = nil) {
        
        let alertController = UIAlertController(title: "Por favor, informe os dados para o checkin:", message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Nome"
        }
        let saveAction = UIAlertAction(title: "Checkin", style: .default, handler: { alert -> Void in
            let firstTextField = alertController.textFields![0] as UITextField
            let secondTextField = alertController.textFields![1] as UITextField
            actionButtonCompletion!(firstTextField.text ?? "", secondTextField.text ?? "")
        })
        let cancelAction = UIAlertAction(title: "Cancelar", style: .destructive, handler: {
            (action : UIAlertAction!) -> Void in })
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Email"
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
 
    func showSampleNativeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}
