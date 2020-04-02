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
    
    func configure(with valute: Valute) {
        nameCurrencyLabel.text = valute.charCode
        fullNameCurrencyLabel.text = valute.name
        countCurrencyLabel.text = "\(valute.nominal ?? 0)"
        currentCourceLabel.text = "\(valute.value ?? 0.0)"
    }
}
