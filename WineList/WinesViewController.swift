//
//  WinesViewController.swift
//  WineList
//
//  Created by Vladimir Saprykin on 18.05.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import UIKit
import Firebase

class WinesViewController: UITableViewController {
    
    var wines:[Wine] = [
        Wine(name: "Borsao", color: "red", type: "dry", grape: "Garnacha", wineMaker: "Bodegas Borsao", country: "Spain", region: "Aragon", description: "Цвет вина глубокий, темный с рубиновыми бликами по ободу. Букет вина изумляет своим тонким балансом атоматов. Вино открывается с ноток спелых ягод, которые смешиваютя с дымными ньюансами и оттенками специй. За месяцы в бутылке, ароматы становятся все более сложными, напоминающими об эволюции вина - кожа, табак. Вкус полный, округлый, мягкий, гладкий благодаря своему длительному пребыванию в бутылке.", size: "0,75", price: 100.00, image: "175317.jpg"),
        Wine(name: "Borsa", color: "white", type: "sweet", grape: "Garnacha", wineMaker: "Bodegas Borsao", country: "Spain", region: "Aragon", description: "Цвет вина глубокий, темный с рубиновыми бликами по ободу. Букет вина изумляет своим тонким балансом атоматов. Вино открывается с ноток спелых ягод, которые смешиваютя с дымными ньюансами и оттенками специй. За месяцы в бутылке, ароматы становятся все более сложными, напоминающими об эволюции вина - кожа, табак. Вкус полный, округлый, мягкий, гладкий благодаря своему длительному пребыванию в бутылке.", size: "0,75", price: 100.00, image: "175317.jpg"),
        Wine(name: "Borsaghjgjo", color: "red", type: "dry", grape: "Garnacha", wineMaker: "Bodegas Borsao", country: "Spain", region: "Aragon", description: "Цвет вина глубокий, темный с рубиновыми бликами по ободу. Букет вина изумляет своим тонким балансом атоматов. Вино открывается с ноток спелых ягод, которые смешиваютя с дымными ньюансами и оттенками специй. За месяцы в бутылке, ароматы становятся все более сложными, напоминающими об эволюции вина - кожа, табак. Вкус полный, округлый, мягкий, гладкий благодаря своему длительному пребыванию в бутылке.", size: "0,75", price: 100.00, image: "175317.jpg"),
        Wine(name: "Borsaodsd", color: "red", type: "dry", grape: "Garnacha", wineMaker: "Bodegas Borsao", country: "Spain", region: "Aragon", description: "Цвет вина глубокий, темный с рубиновыми бликами по ободу. Букет вина изумляет своим тонким балансом атоматов. Вино открывается с ноток спелых ягод, которые смешиваютя с дымными ньюансами и оттенками специй. За месяцы в бутылке, ароматы становятся все более сложными, напоминающими об эволюции вина - кожа, табак. Вкус полный, округлый, мягкий, гладкий благодаря своему длительному пребыванию в бутылке.", size: "0,75", price: 100.00, image: "175317.jpg"),
        Wine(name: "Borsaollll", color: "red", type: "dry", grape: "Garnacha", wineMaker: "Bodegas Borsao", country: "Spain", region: "Aragon", description: "Цвет вина глубокий, темный с рубиновыми бликами по ободу. Букет вина изумляет своим тонким балансом атоматов. Вино открывается с ноток спелых ягод, которые смешиваютя с дымными ньюансами и оттенками специй. За месяцы в бутылке, ароматы становятся все более сложными, напоминающими об эволюции вина - кожа, табак. Вкус полный, округлый, мягкий, гладкий благодаря своему длительному пребыванию в бутылке.", size: "0,75", price: 100.00, image: "175317.jpg"),
        Wine(name: "Borsaoawwa", color: "red", type: "dry", grape: "Garnacha", wineMaker: "Bodegas Borsao", country: "Spain", region: "Aragon", description: "Цвет вина глубокий, темный с рубиновыми бликами по ободу. Букет вина изумляет своим тонким балансом атоматов. Вино открывается с ноток спелых ягод, которые смешиваютя с дымными ньюансами и оттенками специй. За месяцы в бутылке, ароматы становятся все более сложными, напоминающими об эволюции вина - кожа, табак. Вкус полный, округлый, мягкий, гладкий благодаря своему длительному пребыванию в бутылке.", size: "0,75", price: 100.00, image: "175317.jpg"),
        Wine(name: "Borsaopoiu", color: "red", type: "dry", grape: "Garnacha", wineMaker: "Bodegas Borsao", country: "Spain", region: "Aragon", description: "Цвет вина глубокий, темный с рубиновыми бликами по ободу. Букет вина изумляет своим тонким балансом атоматов. Вино открывается с ноток спелых ягод, которые смешиваютя с дымными ньюансами и оттенками специй. За месяцы в бутылке, ароматы становятся все более сложными, напоминающими об эволюции вина - кожа, табак. Вкус полный, округлый, мягкий, гладкий благодаря своему длительному пребыванию в бутылке.", size: "0,75", price: 100.00, image: "175317.jpg"),
        Wine(name: "Borsaonbvb", color: "red", type: "dry", grape: "Garnacha", wineMaker: "Bodegas Borsao", country: "Spain", region: "Aragon", description: "Цвет вина глубокий, темный с рубиновыми бликами по ободу. Букет вина изумляет своим тонким балансом атоматов. Вино открывается с ноток спелых ягод, которые смешиваютя с дымными ньюансами и оттенками специй. За месяцы в бутылке, ароматы становятся все более сложными, напоминающими об эволюции вина - кожа, табак. Вкус полный, округлый, мягкий, гладкий благодаря своему длительному пребыванию в бутылке.", size: "0,75", price: 100.00, image: "175317.jpg"),
        Wine(name: "Borsaojjj", color: "red", type: "dry", grape: "Garnacha", wineMaker: "Bodegas Borsao", country: "Spain", region: "Aragon", description: "Цвет вина глубокий, темный с рубиновыми бликами по ободу. Букет вина изумляет своим тонким балансом атоматов. Вино открывается с ноток спелых ягод, которые смешиваютя с дымными ньюансами и оттенками специй. За месяцы в бутылке, ароматы становятся все более сложными, напоминающими об эволюции вина - кожа, табак. Вкус полный, округлый, мягкий, гладкий благодаря своему длительному пребыванию в бутылке.", size: "0,75", price: 100.00, image: "175317.jpg")
        
    
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wines.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifer = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(identifer, forIndexPath: indexPath) as! TableViewCell
        let wine = wines[indexPath.row]
        
        cell.nameLabel.text = wine.name
        cell.colorLabel.text = wine.color
        cell.priceLabel.text = String(wine.price) + " грн"
        cell.countryLabel.text = wine.country
        cell.typeLabel.text = wine.type
        cell.imageLabel.image = UIImage(named: wine.image)
        
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            let destinationController = segue.destinationViewController as! DetailViewController
            if let indexPath = self.tableView.indexPathForSelectedRow {                
                destinationController.wine = wines[indexPath.row]
            }
        }
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
