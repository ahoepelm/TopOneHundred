//
//  Endpoint.swift
//  ItunesTopOneHundred
//
//  Created by Anthony H on 4/22/21.
//

// A generic Enpoint for Network calls

import Foundation

protocol Endpoint {
    
    // HTTP or Https
    var scheme: String { get }
    
    // apple.com
    var baseURL: String { get }
    
    // /api/v1/us/apple-music/top-albums/all/100/expicit.json
    var path: String { get }
    
    // [URLQueryIyem(name: String, value: String]
    var parameters: [URLQueryItem] { get }
    
    // Get or Post
    var method: String { get }
    
}
