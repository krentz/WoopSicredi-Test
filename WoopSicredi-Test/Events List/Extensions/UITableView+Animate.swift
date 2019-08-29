//
//  UITableView+Animations.swift
//  WoopSicredi-Test
//
//  Created by Rafael.Krentz on 29/08/19.
//  Copyright © 2019 Rafael.Krentz. All rights reserved.
//

import UIKit

extension UITableView{

    func showTableViewWithAnimation(){
        UIView.transition(with:  self,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: {
                            self.reloadData()
                            self.isHidden = false
        })
    }
}
