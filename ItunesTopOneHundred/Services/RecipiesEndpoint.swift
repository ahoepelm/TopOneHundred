//
//  RecepiesEndpoint.swift
//  ItunesTopOneHundred
//
//  Created by Anthony H on 4/28/21.
//

import Foundation

enum RecipiesEndpoint: Endpoint {
    
    case getEndpoint
    
    var scheme: String {
        
        switch self {
            default:
                return "https"
        }
    }
    
    var baseURL: String {
        
        switch self {
            default:
                return "gl-endpoint.herokuapp.com"
        }
    }
    
    var path: String {
        
        switch self {
            case .getEndpoint:
                return "/recipes"
        }
        
    }
    
    var parameters: [URLQueryItem] {
        
        switch self {
            case .getEndpoint:
                return []
        //return []
        }
    }
    
    var method: String {
        
        switch self {
            case .getEndpoint:
                return "GET"
        }
        
    }
}
