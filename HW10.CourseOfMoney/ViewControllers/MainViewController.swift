//
//  MainViewController.swift
//  HW10.CourseOfMoney
//
//  Created by Евгений Каратаев on 31.03.2020.
//  Copyright © 2020 Evgen Studio. All rights reserved.
//

import UIKit

enum UserActions: String, CaseIterable {
    case urlSession = "URL Session"
    case alamofire = "Alamofire"
}

class MainViewController: UICollectionViewController {
    
    private let userActions = UserActions.allCases

    override func viewDidLoad() {
        super.viewDidLoad()
    }



    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userActions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserActionCell
        
        cell.userActionLabel.text = userActions[indexPath.item].rawValue
        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = userActions[indexPath.item]
        
        switch userAction {
        case .alamofire:
            performSegue(withIdentifier: "Alamofire", sender: nil)
        case .urlSession:
            performSegue(withIdentifier: "URLSession", sender: nil)
        }
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let currencyVC = segue.destination as! CurrencyViewController
        switch segue.identifier {
        case "URLSession":
            currencyVC.fetchCurrency()
        case "Alamofire":
            print(currencyVC)
        default: break
        }
    }
}


// Размеры ячейки зависит от размера экрана
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
    
}
