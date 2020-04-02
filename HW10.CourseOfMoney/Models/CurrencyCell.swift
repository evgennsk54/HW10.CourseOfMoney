//
//  CurrencyCell.swift
//  HW10.CourseOfMoney
//
//  Created by Евгений Каратаев on 30.03.2020.
//  Copyright © 2020 Evgen Studio. All rights reserved.
//

import UIKit

class CurrencyCell: UITableViewCell {
    
    @IBOutlet var nameCurrencyLabel: UILabel!
    @IBOutlet var countCurrencyLabel: UILabel!
    @IBOutlet var fullNameCurrencyLabel: UILabel!
    @IBOutlet var currentCourceLabel: UILabel!
    
    func configure(with rate: Valute) {
        nameCurrencyLabel.text = rate.charCode
        fullNameCurrencyLabel.text = rate.name
        countCurrencyLabel.text = "\(rate.nominal ?? 0)"
//        currentCourceLabel.text = "\(rate.value ?? 0.0)"
        currentCourceLabel.text = String(describing:
            Double(round(100*(rate.value ?? 0.00))/100))
    }
}
