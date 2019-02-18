//
//  UIView+NetworkConnectivity.swift
//  NetworkConnectivity
//
//  Created by Matt Eaton on 1/30/19.
//  Copyright © 2019 Matt Eaton. All rights reserved.
//

import UIKit

extension UIView {
    
    func addShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 3.0
    }
}
