//
//  UIViewController+Extension.swift
//  Gen1Pokedex
//
//  Created by Consultant on 11/16/22.
//

import UIKit

extension UIViewController {
    
    func presentNetworkErrorAlert(error: NetworkError) {
        let alert = UIAlertController(title: "Something went wrong!", message: error.errorDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: "Okay", style: .default)
        alert.addAction(action)
        
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
    
}
