//
//  Сurrency.swift
//  HW10.CourseOfMoney
//
//  Created by Евгений Каратаев on 30.03.2020.
//  Copyright © 2020 Evgen Studio. All rights reserved.
//

import UIKit

 // MARK: - Valute
struct Valute: Decodable {
    let charCode: String?
    let nominal: Int?
    let name: String?
    let value: Double?
    let previous: Double?

    enum CodingKeys: String, CodingKey {
        case charCode = "CharCode"
        case nominal = "Nominal"
        case name = "Name"
        case value = "Value"
        case previous = "Previous"
    }
}


// MARK: - Currency
struct Currency: Decodable {
    let previousURL: String?
    let valute: [String: Valute]?
    
    enum CodingKeys: String, CodingKey {
        case previousURL = "PreviousURL"
        case valute = "Valute"
    }
}


