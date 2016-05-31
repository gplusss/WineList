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
        Wine(name: "Borsao", color: "red", type: "dry", grape: "Garnacha", wineMaker: "Bodegas Borsao", country: "Испания", region: "Aragon", description: "Цвет вина глубокий, темный с рубиновыми бликами по ободу. Букет вина изумляет своим тонким балансом атоматов. Вино открывается с ноток спелых ягод, которые смешиваютя с дымными ньюансами и оттенками специй. За месяцы в бутылке, ароматы становятся все более сложными, напоминающими об эволюции вина - кожа, табак. Вкус полный, округлый, мягкий, гладкий благодаря своему длительному пребыванию в бутылке.", size: "0,75", price: 100.00, image: "175317.jpg",style: "123"),
        Wine(name: "Miol Prosecco Treviso", color: "white", type: "dry", grape: "Просеко", wineMaker: "Bortolomiol", country: "Italy", region: "Veneto", description: "Оптимальный баланс сладости, деликатно-фруктовый аромат, идеальный аперитив. Отлично подойдет к овощным супам.", size: "0,75", price: 379.35, image: "189809.jpg",style: ""),
        Wine(name: "Sauvignon Blanc Vicar's Choice", color: "white", type: "dry", grape: "Совиньйон Блан", wineMaker: "Saint Clair", country: "Новая Зеландия ", region: "Мальборо", description: "Цвет бледной соломы с зелеными оттенками. Воодушевляющий аромат маракуйи, черной смородины, грейпфрута, крыжовника и крапивы с освежающей основой минеральных оттенков. Вкус легкотельный, свежий с тонами черной смородины и грейпфрута. Приятные минеральные оттенки приводят к длительному затяжному финалу.", size: "0,75", price: 299.0, image: "184049-2.jpg",style: ""),
        Wine(name: "La Solatia Pinot Grigio", color: "white", type: "dry", grape: "Пино Гриджо", wineMaker: "Ruffino", country: "Италия", region: "Тоскана", description: "Цвет глубокий соломенно-желтый со светло-золотыми оттенками. Букет обогащен приятными нотками печенья, тонами груш и маленьких зеленых слив. Во вкусе типичные особенности виноградных сортов выступают на передний план фруктовыми нотками груш. Вино представляет хорошую вкусовую гармонию, благодаря своей округлости, хорошо уравновешенной превосходной свежестью. Финал вкуса обширный и длительный с изящными минеральными оттенками. Послевкусие устойчивое, с ведущими оттенками миндаля.", size: "0,75", price: 269.00, image: "174220.jpg",style: ""),
        Wine(name: "La Vieille Ferme", color: "red", type: "dry", grape: "Кариньян (15), Сенсо (15), Сира (20), Гренаш (50)", wineMaker: "La Vieille Ferme", country: "Франция", region: "Долина Роны", description: "Цвет насыщенный вишневый. Богатый аромат спелых фруктов и специй. Во вкусе красные ягоды, черная смородина и ежевика, специи и свежее послевкусие.", size: "0,75", price: 199.00, image: "173642-2.jpg",style: ""),
        Wine(name: "Castillo San Simon Reserva", color: "red", type: "dry", grape: "Темпранильо (40), Монастрель (60)", wineMaker: "Castillo San Simon", country: "Испания", region: "Мурсия", description: "Вино интенсивного рубинового цвета. Вкус хорошо сбалансирован, аромат напоминает нотки фруктов. Имеет терпкое послевкусие.", size: "0,75", price: 149.00, image: "172896-2.jpg",style: ""),
        Wine(name: "Chateau de Lamarque, 2005", color: "red", type: "dry", grape: "", wineMaker: "Chateau de Lamarque", country: "Франция", region: "Бордо", description: "", size: "0,75", price: 650.00, image: "175225-2.jpg",style: ""),
        Wine(name: "Fonseca 10yo Tawny", color: "red", type: "sweet", grape: "", wineMaker: "Fonseca", country: "Португалия", region: "Доуро", description: "Портвейн янтарного цвета с малиновым оттенком и ароматом спелых фруктов, меда и специй. Мягкое, шелковистое вино с утонченными древесными нюансами, сбалансированными освежающей кислотностью и вяжущими танинами, которые переходят в длительное, элегантное послевкусие.", size: "0,75", price: 599.00, image: "172973-2.jpg",style: ""),
        Wine(name: "Chateau Citran, 2010", color: "red", type: "dry", grape: "Каберне Совиньйон (0), Мерло (0)", wineMaker: "Chateau Citran", country: "Франция", region: "Бордо", description: "", size: "0,75", price: 350.00, image: "197333.jpg",style: "")
        
    
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
