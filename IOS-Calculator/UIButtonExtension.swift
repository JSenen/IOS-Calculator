//
//  UIButtonExtension.swift
//  IOS-Calculator
//
//  Created by JSenen on 7/2/23.
//

import UIKit

extension UIButton {
    
    //MARK: -Efectos en botones
    
    // Borde redondo
        func round() {
            layer.cornerRadius = bounds.height / 2
            clipsToBounds = true
        }
    
    // Brilla
        func shine() {
            UIView.animate(withDuration: 0.1, animations: {
                self.alpha = 0.5
            }) { (completion) in
                UIView.animate(withDuration: 0.1, animations: {
                    self.alpha = 1
                })
            }
        }
    

}
