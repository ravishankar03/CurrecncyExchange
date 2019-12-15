//
//  CurrencyModel.swift
//  CurrencyApp
//
//  Created by Ravi Shankar S. V. V on 14/12/19.
//  Copyright © 2019 Ravi Shankar S. V. V. All rights reserved.
//

import Foundation

class CurrencyData: Decodable {
    let base: String
    let date: String
    let rates: [String: Double]
    
    init(base: String, date: String, rates: [String: Double]) {
        self.base   = base
        self.date   = date
        self.rates  = rates
    }
}

class Rate {
    let currency: String
    let rate: Double
    
    init(currency: String, rate: Double) {
        self.currency   = currency
        self.rate       = rate
    }
}
