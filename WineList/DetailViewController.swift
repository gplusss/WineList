//
//  DetailViewController.swift
//  WineList
//
//  Created by Vladimir Saprykin on 22.05.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import UIKit
import Kingfisher
import Popover
import PopoverSwift

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableview:UITableView!
    @IBOutlet weak var imageView: UIBarButtonItem!
    
    var wine:Wine!
    let imageForPopover = UIImage(named: "4324")
    let popover = Popover()

    
    lazy var bottleButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.addTarget(self, action: #selector(showPopover), for: .touchUpInside)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = button.frame.size.width / 2
        button.layer.masksToBounds = true
        return button
    }()
    
  
    func image() {
        let urlString = "https://villaggio-4e2e.restdb.io/media/" + (wine.image?[0])!
        let url = NSURL(string: urlString)
        let imgResource =  ImageResource(downloadURL: url as! URL)
        bottleButton.kf.setImage(with: imgResource, for: UIControlState.normal)
    }
    
    func showPopover() {
        let startPoint = CGPoint(x: self.view.frame.width - 60, y: 55)
        let aView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 350))
        
        popover.show(aView, point: startPoint)
        //popover.show(aView, fromView: bottleButton)
        let item = PopoverItem(title: "发起群聊", image: imageForPopover)
        let controller = PopoverController(items: [item], fromView: bottleButton, direction: .down, style: .withImage)
        //popover(controller)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = wine.title()
        image()
        self.tableview.rowHeight = UITableViewAutomaticDimension
        self.tableview.estimatedRowHeight = 36
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: bottleButton)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeAttributedFieldLabel(_ field: String) -> NSAttributedString {
        let fieldAttributes = [NSFontAttributeName: UIFont.preferredFont(forTextStyle: UIFontTextStyle.title3), NSForegroundColorAttributeName: UIColor.purple]
        
        let fieldString = NSMutableAttributedString(string: field, attributes: fieldAttributes)
        return fieldString
    }
    
    func makeAttributedValueLabel(_ value: String) -> NSAttributedString {
        let valueAttributes = [NSFontAttributeName: UIFont.preferredFont(forTextStyle: UIFontTextStyle.subheadline)]
        
        let valueString = NSMutableAttributedString(string: value, attributes: valueAttributes)
        return valueString
        
        
    }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 11
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! DetailViewCell

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
            cell.fieldLabel.attributedText = makeAttributedFieldLabel("SIZE")
            cell.valueLabel.attributedText = makeAttributedValueLabel(wine.size)
        case 8:
            cell.fieldLabel.attributedText = makeAttributedFieldLabel("PRICE")
            cell.valueLabel.attributedText = makeAttributedValueLabel(String(wine.price) + " грн")
        case 9:
            cell.fieldLabel.attributedText = makeAttributedFieldLabel("STYLE")
            cell.valueLabel.attributedText = makeAttributedValueLabel(wine.style)
        case 10:
            cell.fieldLabel.attributedText = makeAttributedFieldLabel("DESCRIPTION")
            cell.valueLabel.attributedText = makeAttributedValueLabel(wine.description)
            
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""

        }
            
        return cell
            
    }
}
