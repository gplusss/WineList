//
//  DetailViewController.swift
//  WineList
//
//  Created by Vladimir Saprykin on 22.05.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
     @IBOutlet var tableview:UITableView!
    
    var wine:Wine!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        title = wine.title()
        
        self.imageView.image = UIImage(named: wine.image)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
        }
        
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("detailCell", forIndexPath: indexPath) as! DetailViewCell
        
        
        
        func makeAttributedFieldLabel(field: String) -> NSAttributedString {
            let fieldAttributes = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline), NSForegroundColorAttributeName: UIColor.purpleColor()]
            
            let fieldString = NSMutableAttributedString(string: field, attributes: fieldAttributes)

            
            return fieldString
    }
        
        func makeAttributedValueLabel(value: String) -> NSAttributedString {
            let valueAttributes = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)]
            
            let valueString = NSMutableAttributedString(string: value, attributes: valueAttributes)
            return valueString
            
            
        }
       
        //MARK: свитч
        
        
        switch indexPath.row {
        case 0:
            cell.fieldLabel.attributedText = makeAttributedFieldLabel("NAME")
            cell.valueLabel.attributedText = makeAttributedValueLabel(wine.name)
            
        case 1:
            cell.fieldLabel.attributedText = makeAttributedFieldLabel("COLOR")
            cell.valueLabel.attributedText = makeAttributedValueLabel(wine.color)
        case 2:
            cell.fieldLabel.attributedText = makeAttributedFieldLabel("TYPE")
            cell.valueLabel.attributedText = makeAttributedValueLabel(wine.type)
        case 3:
            cell.fieldLabel.attributedText = makeAttributedFieldLabel("GRAPE")
            cell.valueLabel.attributedText = makeAttributedValueLabel(wine.grape)
        case 4:
            cell.fieldLabel.attributedText = makeAttributedFieldLabel("WINEMAKER")
            cell.valueLabel.attributedText = makeAttributedValueLabel(wine.wineMaker)
        case 5:
            cell.fieldLabel.attributedText = makeAttributedFieldLabel("COUNTRY")
            cell.valueLabel.attributedText = makeAttributedValueLabel(wine.country)
        case 6:
            cell.fieldLabel.attributedText = makeAttributedFieldLabel("REGION")
            cell.valueLabel.attributedText = makeAttributedValueLabel(wine.region)
        case 7:
            cell.fieldLabel.attributedText = makeAttributedFieldLabel("DESCRIPTION")
            cell.valueLabel.attributedText = makeAttributedValueLabel(wine.description)
            cell.valueLabel.sizeToFit()
        case 8:
            cell.fieldLabel.attributedText = makeAttributedFieldLabel("SIZE")
            cell.valueLabel.attributedText = makeAttributedValueLabel(wine.size)
        case 9:
            cell.fieldLabel.attributedText = makeAttributedFieldLabel("PRICE")
            cell.valueLabel.attributedText = makeAttributedValueLabel(String(wine.price) + " грн")

        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        
       
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
