//
//  ViewController.swift
//  ItunesTopOneHundred
//
//  Created by Anthony H on 4/22/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkCaller.request(endpoint: ItunesEndpoint.getEndpoint) { (result: Result<Album, NetworkErrors>) in
            switch result {
            
            case .success(let response):
                print("Response: ", response)
                
            case .failure(let error):
                
                checkWhichError(error: error, vc: self)
                
            }
        }
        
        
        NetworkCaller.request(endpoint: RecipiesEndpoint.getEndpoint) { (result: Result<[Recipe], NetworkErrors>) in
            switch result {
            
            case .success(let response):
                print("Response: ", response)
                
            case .failure(let error):
                
                checkWhichError(error: error, vc: self)

            }
        }
        
    }
    
}

