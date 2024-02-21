//
//  ItunesEndpoint.swift
//  ItunesTopOneHundred
//
//  Created by Anthony H on 4/22/21.
//

import Foundation

enum ItunesEndpoint: Endpoint {
    
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
                return "rss.applemarketingtools.com"
        }
    }
    
    var path: String {
        
        switch self {
            case .getEndpoint:
                return "/api/v2/us/music/most-played/10/albums.json"
        }
        
    }
    
    var parameters: [URLQueryItem] {
        
        switch self {
            case .getEndpoint:
                return []
        }
    }
    
    var method: String {
        
        switch self {
            case .getEndpoint:
                return "GET"
        }
        
    }
    
}
