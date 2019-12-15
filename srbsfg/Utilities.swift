//
//  Utilities.swift
//  srbsfg
//
//  Created by Ravi Shankar S. V. V on 15/12/19.
//  Copyright © 2019 Ravi Shankar S. V. V. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func addDefaultShadow(withPath: Bool = true, opacity: Float = 0.2) {
        
        self.layer.masksToBounds = false
        
        // shadow
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = 2.0
        if withPath {
            self.layer.shadowPath = UIBezierPath(roundedRect: layer.bounds, cornerRadius: self.layer.cornerRadius == 0 ? 4.0 : self.layer.cornerRadius).cgPath
        }
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func defaultBorderColor(_ color:UIColor? = nil, width:CGFloat = 1.0) {
        self.layer.borderWidth = width
        var borderColor = UIColor.lightGray
        if let bColor = color {
            borderColor = bColor
        }
        self.layer.borderColor = borderColor.cgColor
    }
    
    
    func addDefaultCornerRadius(){
        self.clipsToBounds = true
        self.layer.cornerRadius = 4.0
    }
}


extension String {
    
    
    var hasOnlyNumbers: Bool {
        let characterSet = NSCharacterSet(charactersIn: "0123456789")
        return rangeOfCharacter(from: characterSet.inverted) == nil
    }
    var length: Int {
        get {
            return self.count
        }
    }
}
