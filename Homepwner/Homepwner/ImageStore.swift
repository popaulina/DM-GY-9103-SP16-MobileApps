//
//  ImageStore.swift
//  Homepwner
//
//  Created by Paulina Levit on 3/15/16.
//  Copyright © 2016 Paulina Levit. All rights reserved.
//

import UIKit

class ImageStore {
    let cache = NSCache()
    
    func setImage(image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key)
    }
    
    func imageForKey(key: String) -> UIImage? {
        return cache.objectForKey(key) as? UIImage
    }
    
    func deleteImageForKey(key: String) {
        cache.removeObjectForKey(key)
    }
}