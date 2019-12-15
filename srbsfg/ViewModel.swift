//
//  ViewModel.swift
//  srbsfg
//
//  Created by Ravi Shankar S. V. V on 15/12/19.
//  Copyright © 2019 Ravi Shankar S. V. V. All rights reserved.
//

import Foundation

protocol ViewModelDelegate: class {
    
    func reloadData()
}

class ViewModel {
    
    
    weak var delegate: ViewModelDelegate?
    var rates = [Rate]()
    var initialCurrencyRate: String = "INR"
    var initialAmount: Double = 1000
    var baseVal = ""
    
    
    
    func loadCurrencyRates(currency: String){
        let urlBased = "https://api.openrates.io/latest?base=\(currency)"
        guard let url = URL(string: urlBased) else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if error != nil{
                    
                   
                    //(title: "No connection", msg: "Please check your connection and press refresh button", vc: self)
                }
                else{
                    if data != nil{
                        do{
                            self.rates.removeAll()
                            let json = try JSONDecoder().decode(CurrencyData.self, from: data!)
                            for (key, value) in json.rates {
                                self.rates.append(Rate(currency: key, rate: value))
                            }
                            self.baseVal = json.base
                            
                        }
                        catch{
                            print(error)
                        }
                    }
                }
                self.delegate?.reloadData()
            }
        }
        task.resume()
    }
    
}
