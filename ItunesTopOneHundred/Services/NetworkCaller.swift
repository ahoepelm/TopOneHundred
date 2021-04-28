//
//  NetworkCaller.swift
//  ItunesTopOneHundred
//
//  Created by Anthony H on 4/22/21.
//

import Foundation

class NetworkCaller {
    
    // Makes the network call and decodes the JSON response
    
    class func request<T: Codable>(endpoint: Endpoint, result: @escaping (Result<T, NetworkErrors>) -> Void) {
        
        // Build the URL components
        var components = URLComponents()
        
        components.scheme = endpoint.scheme
        components.host = endpoint.baseURL
        components.path = endpoint.path
        components.queryItems = endpoint.parameters
        
        // Make sure we have a URL
        guard let url = components.url else { return }
        //print("The url is: \(url)")
        
        // Prepare the request
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method
        
        let session = URLSession(configuration: .default)
        
        // Make the request, exit on failure
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            
            guard error == nil else {
                result(.failure(.unableToComplete))

                return
            }
            
            // If we have a response try to decode it
            guard response != nil, let data = data else { return }
            
            DispatchQueue.main.async {
                
                if let responseObject = try? JSONDecoder().decode(T.self, from: data) {
                    
                    result(.success(responseObject))
                    
                } else {
                    
                    result(.failure(.unableToDecode))
                    
                }
                
            }
            
        }
        dataTask.resume()
    }
    
}

