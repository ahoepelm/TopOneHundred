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
    func loadImage(imageURL: URL, placeHolderImage: String) {
        
        // If we are given a place holder image use it
        self.image = UIImage(named: placeHolderImage)
        
        // Check if we already have the image and use it
        if let cachedImage = imageCache.object(forKey: imageURL as AnyObject) {
            
            self.image = cachedImage

            return
        }
        
        // We don't have the image so download it
        DispatchQueue.global().async {
            
            if let imageData = try? Data(contentsOf: imageURL) {
                
                if let image = UIImage(data: imageData) {
                    
                    DispatchQueue.main.async {
                        
                        self.imageCache.setObject(image, forKey: imageURL as AnyObject)
                        self.image = image
                    }
                }
            }
        }
        
    }
}
