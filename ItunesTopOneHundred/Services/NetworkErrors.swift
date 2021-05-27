//
//  NetworkErrors.swift
//  ItunesTopOneHundred
//
//  Created by Anthony H on 4/22/21.
//

import Foundation

// Generic Custom Network Errors

enum NetworkErrors: String, Error {
    
    case unableToComplete
    case invalidResponse
    case invalidData
    case unableToDecode

    
}
