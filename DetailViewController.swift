//
//  DetailViewController.swift
//  WineList
//
//  Created by Vladimir Saprykin on 20.05.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
    
    var wine:Wine!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = self.wine.name
    }
    
    

}
