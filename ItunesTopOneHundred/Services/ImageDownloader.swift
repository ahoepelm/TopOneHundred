//
//  ImageDownloader.swift
//  ItunesTopOneHundred
//
//  Created by Anthony H on 5/7/21.
//

import Foundation
import UIKit

class ImageDownloader : UIImageView {
    
    private let imageCache = NSCache<AnyObject, UIImage>()
    
    // Download image and cache it
    func loadImage(imageURL: URL, placeHolderImage: String = "") {
        
        // Tried to adjust cache to see if it would make a difference in behavior
//        imageCache.totalCostLimit = 1024 * 1024
//        imageCache.countLimit = 150
        
        // If we are given a place holder image use it
        if placeHolderImage != "" {
            
            self.image = UIImage(named: placeHolderImage)
        }
        
        
        
        // Check if we already have the image and use it
        if let cachedImage = imageCache.object(forKey: imageURL as AnyObject) {
            
            self.image = cachedImage
            //print("Using Cached Image")

            return
        }
        
        
        // We don't have the image so download it and cache it
        DispatchQueue.global().async {
            
            if let imageData = try? Data(contentsOf: imageURL) {
                
                if let image = UIImage(data: imageData) {
                    
                    DispatchQueue.main.async {
                        
                        // cache the image
                        self.imageCache.setObject(image, forKey: imageURL as AnyObject)
                        self.image = image
                    }
                }
            }
        }
        
    }
}
