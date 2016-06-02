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
    var sweetness: String = "" //sweet, dry, etc
    var type:  String = ""
    var grape: String = ""
    var wineMaker: String = ""
    var country: String = ""
    var region: String = ""
    var description: String = ""
    var size: String = ""
    var price: Double = 0
    var image: String = ""
    var style: String = ""
    
    
    init(name: String, color: String, sweetness: String, type: String, grape: String, wineMaker: String, country: String, region: String, description: String, size: String, price: Double, image: String, style: String) {
        self.name = name
        self.color = color
        self.sweetness = sweetness
        self.type = type
        self.grape = grape
        self.wineMaker = wineMaker
        self.country = country
        self.region = region
        self.description = description
        self.size = size
        self.price = price
        self.image = image
        self.style = style
    }
    
    
    func title() -> String {
        return "\(self.name)"
    }
    
}


