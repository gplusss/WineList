//
//  WinesResponse.swift
//  WineList
//
//  Created by Vladimir Saprykin on 10.06.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import Foundation
import ObjectMapper

class WinesResponse: Mappable {
    var wines: [Wine]?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        wines <- map
    }
}