//
//  DetailViewCell.swift
//  WineList
//
//  Created by Vladimir Saprykin on 25.05.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import Foundation
import UIKit

class DetailViewCell: UITableViewCell {
        @IBOutlet weak var fieldLabel: UILabel!
        @IBOutlet weak var valueLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
