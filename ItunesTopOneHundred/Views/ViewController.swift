//
//  ViewController.swift
//  ItunesTopOneHundred
//
//  Created by Anthony H on 4/22/21.
//

import UIKit

class ViewController: UIViewController {
    
    //private let albumTableViewModel = AlbumTableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        AlbumTableViewModel.callAPIForItunes { (model, error) in

            guard error == nil else {

                DispatchQueue.main.async {
                    Alert.displayError(titleString: "Error", messageString: error ?? "Unknown Error", vc: self)
                }

                return
            }

            print(model as Any)


        }
        
        
        RecipeTableViewModel.callAPIForRecipes { (model, error) in
            
            guard error == nil else {
                
                DispatchQueue.main.async {
                    Alert.displayError(titleString: "Error", messageString: error ?? "Unknown Error", vc: self)
                }
                
                return
            }
            
            print(model as Any)
            

        }
        
    }
    
}

