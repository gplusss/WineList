//
//  BottleImageProvider.swift
//  WineList
//
//  Created by Vladimir Saprykin on 31.05.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import Foundation
import ImageViewer

class BottleImageProvider: ImageProvider {
    var wines: [Wine]?
    
    func provideImage(completion: UIImage? -> Void) {
        if let wine = wines?.first {
            completion(UIImage(named: wine.image))
        }
    }
    
    func provideImage(atIndex index: Int, completion: UIImage? -> Void) {
        if let wine = wines?[index] {
            completion(UIImage(named: wine.image))
        }
    }
}