//
//  UILabel.swift
//  WineList
//
//  Created by Vladimir Saprykin on 31.05.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import UIKit
extension UILabel{
    
    func requiredHeight() -> CGFloat {
        
        let label:UILabel = UILabel(frame: CGRectMake(0, 0, self.frame.width, CGFloat.max))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.font = self.font
        label.text = self.text
        
        label.sizeToFit()
        
        return label.frame.height
    }
}