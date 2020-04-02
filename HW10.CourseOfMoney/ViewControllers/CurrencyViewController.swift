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
    
    private var currencies: Currency?
    private var valutes: [Valute] = []
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return valutes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CurrencyCell
        
        let valute = valutes[indexPath.row]
        cell.configure(with: valute)
        
        return cell
    }
    
    func fetchCurrency() {
        guard let url = URL(string: jsonURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            guard let response = response else { return }
            
            do {
                self.currencies = try JSONDecoder().decode(Currency.self, from: data)
                print(self.currencies as Any)
                print(response)
                print(self.valutes)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
}
