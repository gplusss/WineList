//
//  Wines.swift
//  WineList
//
//  Created by Vladimir Saprykin on 18.05.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import Foundation
import ObjectMapper

class Wine: Mappable {
    var name: String = ""
    var color: String = ""
    var sweetness: String = ""
    var type:  String = ""
    var grape: String = ""
    var wineMaker: String = ""
    var country: String = ""
    var region: String = ""
    var description: String = ""
    var size: String = ""
    var price: Double = 0.0
    var image : [String]?
    var style: String = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name            <- map["name"]
        color           <- map["color"]
        sweetness       <- map["sweetness"]
        type            <- map["type"]
        grape           <- map["grape"]
        wineMaker       <- map["wine maker"]
        country         <- map["country"]
        region          <- map["region"]
        description     <- map["description"]
        size            <- map["size"]
        price           <- map["price"]
        image           <- map["image"]
        style           <- map["style"]
    }
    
    func title() -> String {
        return "\(self.name)"
    }
    
}


