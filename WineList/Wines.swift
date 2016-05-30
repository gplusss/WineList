//
//  Wines.swift
//  WineList
//
//  Created by Vladimir Saprykin on 18.05.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import Foundation

class Wine {
    var name: String = ""
    var color: String = ""
    var type: String = "" //sweet, dry, etc
    var grape: String = ""
    var wineMaker: String = ""
    var country: String = ""
    var region: String = ""
    var description: String = ""
    var size: String = ""
    var price: Double = 0
    var image: String = ""
    
    
    init(name: String, color: String, type: String, grape: String, wineMaker: String, country: String, region: String, description: String, size: String, price: Double, image: String) {
        self.name = name
        self.color = color
        self.type = type
        self.grape = grape
        self.wineMaker = wineMaker
        self.country = country
        self.region = region
        self.description = description
        self.size = size
        self.price = price
        self.image = image
    }
    
    
    func title() -> String {
        return "\(self.name)"
    }
    
}

