//
//  currencyCodeCell.swift
//  srbsfg
//
//  Created by Ravi Shankar S. V. V on 15/12/19.
//  Copyright © 2019 Ravi Shankar S. V. V. All rights reserved.
//

import Foundation
import UIKit

class currencyCodeCell: UITableViewCell {

    @IBOutlet weak var countryCodeLabel: UILabel!


func configureContent(countryCode: String) {
    
    countryCodeLabel.text = countryCode
}
}
