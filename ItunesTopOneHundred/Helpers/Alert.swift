//
//  Alert.swift
//  ItunesTopOneHundred
//
//  Created by Anthony H on 4/28/21.
//

import Foundation
import UIKit

class Alert {
    class func displayError(titleString: String, messageString: String, vc: UIViewController) {
        
        let alert = UIAlertController(title: titleString, message: messageString, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        vc.present(alert, animated: true)
        
    }
    
}
