//
//  AlbumTableViewModel.swift
//  ItunesTopOneHundred
//
//  Created by Anthony H on 4/30/21.
//

import Foundation

struct AlbumTableViewModel {
    
    static func callAPIForItunes(completion: @escaping ([Results]?, String?) -> Void) {
        
        NetworkCaller.request(endpoint: ItunesEndpoint.getEndpoint) { (result: Result<Album, NetworkErrors>) in
            switch result {
            
            case .success(let response):
                
                completion(response.feed.results, nil)
                
            case .failure(let error):
                
                switch error {
                
                case .invalidResponse:
                    
                    completion(nil, "The response received was invalid")
                    
                case .unableToComplete:
                    
                    completion(nil, "Unable to continue with request")
                    
                case .invalidData:
                    
                    completion(nil, "The data received was invalid")
                    
                case .unableToDecode:
                    
                    completion(nil, "Unable to process the data received")
                    
                }
                
            }
        }
        
    }
    
}
