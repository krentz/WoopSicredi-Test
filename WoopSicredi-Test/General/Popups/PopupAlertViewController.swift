//
//  PopupAlertViewController.swift
//  WoopSicredi-Test
//
//  Created by Rafael.Krentz on 30/08/19.
//  Copyright © 2019 Rafael.Krentz. All rights reserved.
//

import UIKit

class PopupAlertViewController: UIViewController{

    
    @IBOutlet weak var popupView: UIView!{
        didSet{
            popupView.layer.cornerRadius = 5
            popupView.alpha = 0
        }
    }
    @IBOutlet weak var popupHeaderView: UIView!{
        didSet{
             popupHeaderView.layer.cornerRadius = 5
        }
    }
    @IBOutlet weak var titleLabel: UILabel!{
        didSet {
            titleLabel.text = self.alertTitle
        }
    }
    @IBOutlet weak var alertMessageLabel: UILabel!{
        didSet{
            alertMessageLabel.text = self.alertMessage
        }
    }
    @IBOutlet weak var closeButton: UIButton!{
        didSet{
            closeButton.layer.borderWidth = 1
            closeButton.layer.borderColor = UIColor.gray.cgColor
            closeButton.layer.cornerRadius = 5
            closeButton.setTitle(.tryAgain, for: .normal)
        }
    }
    
    var alertTitle = ""
    var alertMessage = ""
    var completionAction: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
   
        self.navigationController?.navigationBar.alpha = 0.7
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .transitionCrossDissolve, animations: {
            self.popupView.alpha = 1
        })
    }
    @IBAction func closePopupAction(_ sender: Any) {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .transitionCrossDissolve, animations: {
            self.popupView.alpha = 0
        }) { success in
            
            self.completionAction?()
            self.navigationController?.navigationBar.backgroundColor = UIColor.white
            self.navigationController?.navigationBar.alpha = 1
            
            self.willMove(toParent: nil)
            self.view.removeFromSuperview()
            self.removeFromParent()
        }
    }
}
