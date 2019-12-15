//
//  CurrencyDataCell.swift
//  CurrencyApp
//
//  Created by Ravi Shankar S. V. V on 14/12/19.
//  Copyright © 2019 Ravi Shankar S. V. V. All rights reserved.
//

import Foundation
import UIKit

class CurrencyDataCell: UITableViewCell {
    
    
    @IBOutlet weak var countryCodeLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    
    func configureContent(countryCode: String, amount: Double, exchangeRate: Double) {
        
        countryCodeLabel.text = countryCode
        
        let totalVal = amount * exchangeRate
        amountLabel.text = String(format: "%.2f", totalVal)
        
        cellView.addDefaultShadow()
        cellView.addDefaultCornerRadius()
        cellView.defaultBorderColor()
        
    }
    
}



