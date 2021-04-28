//
//  ErrorMessages.swift
//  ItunesTopOneHundred
//
//  Created by Anthony H on 4/28/21.
//

import Foundation
import UIKit

func checkWhichError(error: NetworkErrors, vc: UIViewController) {
    
    switch error {
    case .invalidResponse:
        Alert.displayError(titleString: "Invalid Response", messageString: "The response received was invalid", vc: vc)
    case .unableToComplete:
        Alert.displayError(titleString: "Unable to Complete", messageString: "Unable to continue with request", vc: vc)
    case .invalidData:
        Alert.displayError(titleString: "Invalid Data", messageString: "The data received was invalid", vc: vc)
    case .unableToDecode:
        Alert.displayError(titleString: "Unable to Process", messageString: "Unable to process the data received", vc: vc)
        
    }
}
