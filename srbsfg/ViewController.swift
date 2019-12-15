//
//  ViewController.swift
//  CurrencyApp
//
//  Created by Ravi Shankar S. V. V on 14/12/19.
//  Copyright © 2019 Ravi Shankar S. V. V. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController, ViewModelDelegate {
    
    @IBOutlet weak var currencyTableView: UITableView!
    
    @IBOutlet weak var currentCurrencyLabel: UILabel!
    
    @IBOutlet weak var currencyCodeLabel: UILabel!
    
    @IBOutlet weak var inputTextView: UITextField!
    
    @IBOutlet weak var currencyButton: UIButton!
    
    @IBOutlet weak var currencySelectionTBView: UITableView!
    
    @IBOutlet weak var selectionView: UIView!
    
    let viewModel: ViewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        // initial API call with default values
        viewModel.loadCurrencyRates(currency: "INR")
        self.inputTextView.text = String(1000)
        selectionView.isHidden = true
        currencyCodeLabel.text = "INR"
        currencyButton.addDefaultCornerRadius()
        currencySelectionTBView.addDefaultCornerRadius()
    }

    
    @IBAction func selectCurrencyButtonTapped(_ sender: Any) {
        
        selectionView.isHidden = false
        currencySelectionTBView.reloadData()
    }
    
    
    //delegate Method
    func reloadData() {
        
        currencyTableView.reloadData()
        currencyCodeLabel.text = viewModel.baseVal
    }
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == currencyTableView {
            return viewModel.rates.count
        } else {
            return viewModel.rates.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         if tableView == currencyTableView {
        if let cell: CurrencyDataCell = tableView.dequeueReusableCell(withIdentifier: "CurrencyDataCell", for: indexPath) as? CurrencyDataCell {
            cell.configureContent(countryCode: viewModel.rates[indexPath.row].currency, amount: viewModel.initialAmount, exchangeRate: viewModel.rates[indexPath.row].rate)
            return cell
        }
         } else {
            
            if let cell: currencyCodeCell = tableView.dequeueReusableCell(withIdentifier: "currencyCodeCell", for: indexPath) as? currencyCodeCell {
                cell.configureContent(countryCode: viewModel.rates[indexPath.row].currency)
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         if tableView == currencySelectionTBView {
            
            viewModel.loadCurrencyRates(currency: viewModel.rates[indexPath.row].currency)
            selectionView.isHidden = true
            
        }
    }
}

extension ViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool  {
        
        if string.length > 0 && !string.hasOnlyNumbers {
            return false
        }
        
        var newString: String = ""
        let currentCharacterCount = textField.text?.count ?? 0
        let newLength = currentCharacterCount + string.count - range.length
        
        
        if (range.length + range.location > currentCharacterCount){
            return false
        }
        
        if newLength > 15 {
            return false
        }
        
        if let text = textField.text {
            if string.count > 0 {
                newString = text + string
            }else {
                newString = (text as NSString).substring(to: newLength)
            }
        }else {
            newString = string
        }
        
        if let value = Double(newString) {
          
            if newString.length == 0 {
                viewModel.initialAmount = 0
            } else {
                viewModel.initialAmount = value
            }
        } else {
            viewModel.initialAmount = 0
        }
        viewModel.loadCurrencyRates(currency: viewModel.initialCurrencyRate)
        
        return true
    }
    
}



