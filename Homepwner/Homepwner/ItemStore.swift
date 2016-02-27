//
//  ItemStore.swift
//  Homepwner
//
//  Created by Paulina Levit on 2/23/16.
//  Copyright © 2016 Paulina Levit. All rights reserved.
//

import UIKit

class ItemStore {
    var allItems = [Item]()

    func createItem() -> Item {
        let newItem = Item(random: true)
    
        allItems.append(newItem)
    
        return newItem
    }
    
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }
}