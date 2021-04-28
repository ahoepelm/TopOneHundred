//
//  NetworkErrors.swift
//  ItunesTopOneHundred
//
//  Created by Anthony H on 4/22/21.
//

import Foundation

// Generic Custom Network Errors

enum NetworkErrors: String, Error {
    
//    case unableToComplete = "Can't complete network request. Please check your connection"
//    case invalidResponse = "Invalid response from the server. Please try again"
//    case invalidData = "The data received was invalid"
//    case unableToDecode = "Unable to Decode Data"
    
    case unableToComplete
    case invalidResponse
    case invalidData
    case unableToDecode

    
}
