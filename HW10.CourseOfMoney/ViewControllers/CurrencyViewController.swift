//
//  CurrencyViewController.swift
//  HW10.CourseOfMoney
//
//  Created by Евгений Каратаев on 31.03.2020.
//  Copyright © 2020 Evgen Studio. All rights reserved.
//

import UIKit

class CurrencyViewController: UITableViewController {

    let jsonURL = "https://www.cbr-xml-daily.ru/daily_json.js"
    
    var rates: [Valute] = []
    
    let valutes = ["USD" ,"EUR","GBP","AUD", "AZN", "AMD", "BYN", "BGN", "BRL", "HUF", "DKK", "INR" ,"KZT" ,"CAD" ,"KGS","CNY" ,"MDL" ,"NOK" ,"PLN" ,"RON" ,"XDR" ,"SGD" ,"TJS" ,"TRY" ,"TMT" ,"UZS" ,"UAH" ,"CZK" ,"SEK" ,"CHF" ,"ZAR" ,"KRW" ,"JPY" ]
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rates.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CurrencyCell
        
        let rate = rates[indexPath.row]
        cell.configure(with: rate)
        
        return cell
    }
    
    func fetchCurrency() {
        guard let url = URL(string: jsonURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let currencies = try decoder.decode(Currency.self, from: data)
                for value in self.valutes {
                    self.rates.append(currencies.valute[value]!)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
}
