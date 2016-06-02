//
//  WinesViewController.swift
//  WineList
//
//  Created by Vladimir Saprykin on 18.05.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import UIKit
import Foundation
import Firebase

let baseURL = "https://winelistvillagio.firebaseio.com"


class WinesViewController: UITableViewController {
    
    
    let searchController = UISearchController(searchResultsController: nil)
    var filteredWines = [Wine]()
    
    
    var wines:[Wine] = [
        Wine(name: "Freixenet Roger D'anoia Brut", color: "white", sweetness: "dry", type: "игристое", grape: "макабео, паррельяда, щарельо", wineMaker: "Freixenet", country: "Spain", region: "Cava", description: "Первое брожение происходит при контролируемой температуре в емкостях из нержавеющей стали в течение 10-12 дней, после чего вино разливается и вторичное брожение происходит в бутылке.", size: "0,75", price: 427.00, image: "roger_danoia_cava__brut2.jpg",style: "цветочное"),
        Wine(name: "Lanson Ivory Label", color: "white", sweetness: "demi-sec", type: "игристое", grape: "пино нуар, шардоне, пино менье", wineMaker: "Lanson", country: "France", region: "Champagne", description: "Шампанское соломенно-желтого цвета с легкими золотыми отблесками. В букете шампанского ароматы зрелых фруктов, смешанных с нотками корицы и меда. В округлом и плотном, гармоничном вкусе шампанского доминируют нотки спелого персика и груши.", size: "0,75", price: 677.00, image: "___27935_big.jpg",style: "цветочное"),
        Wine(name: "Piper Heidsieck Brut", color: "white", sweetness: "dry", type: "игристое", grape: "пино нуар, пино менье, шардоне", wineMaker: "Piper-Heidsieck", country: "France", region: "Champagne", description: "Напиток отличается нежным золотистым цветом и удивительным союзом изысканности, типичной для сухого шампанского, и неудержимой жизнерадостности, характерной для стиля Пайпер Хайдсик. Созданное из ягод, собранных в 50 отборных виноградниках, и созревавшее долгие месяцы в меловых погребах, шампанское Пайпер Хайдсик Кюве Брют гармонично сочетает в своем букете ароматы весенних цветов, ноты спелых яблок и груш, освежающие цитрусовые тона.", size: "0,75", price: 1153.00, image: "4324.jpg",style: "орехово-сливочное"),
        Wine(name: "Zonin Prosecco", color: "white", sweetness: "dry", type: "игристое", grape: "просекко", wineMaker: "Zonin", country: "Italy", region: "Veneto", description: "Цвет бледно-желтый с зеленоватыми оттенками. Аромат яркий фруктовый аромат с нотами цветов глицинии. ВкусХорошо сбалансированный, свежий вкус яблочно-миндального пирога.", size: "0,2", price: 109.00, image: "zonin_0_2_liter_3831__67808_big.jpg",style: "цветочное"),
        Wine(name: "Zonin Prosecco", color: "white", sweetness: "dry", type: "игристое", grape: "просекко", wineMaker: "Zonin", country: "Italy", region: "Veneto", description: "Цвет бледно-желтый с зеленоватыми оттенками. Аромат яркий фруктовый аромат с нотами цветов глицинии. Вкус хорошо сбалансированный, свежий вкус яблочно-миндального пирога.", size: "0,75", price: 289.00, image: "prosecco_spumante_big_7ec78fcbfb407f46adadd828db0b46a5__21910_big.jpg",style: "цветочное"),
        Wine(name: "Dal Bello Prosecco Don Gallo Brut", color: "white", sweetness: "dry", type: "игристое", grape: "просекко", wineMaker: "Dal Bello", country: "Italy", region: "Veneto", description: "Цвет светло-соломенный цвет с зеленоватыми бликами со стойким муссом.Тонкий аромат зеленого яблока и белых цветов с намеком на цитрусы, Вкус питкий и свежий вкус с мягким перляжем.", size: "0,75", price: 549.00, image: "1461677900_49956.jpg",style: "цветочное"),
        Wine(name: "Filipetti Prosecco", color: "white", sweetness: "dry", type: "игристое", grape: "просекко", wineMaker: "Valsa Nuovo Perlino", country: "Italy", region: "Veneto", description: "Цвет желтый с зеленоватыми отблесками и деликатным и стойким перляжем. Аромат освежающий с приятными ароматными нотами. Вкус сбалансированный, мягкий и полный со стойким послевкусием", size: "0,75", price: 446.00, image: "1404388046_50712.jpg",style: "цветочное"),
        Wine(name: "Anjos Vinho Verde", color: "white", sweetness: "semi-dry", type: "шипучее", grape: "Лоурейро, Тражадура и Аринто", wineMaker: "ANJOS", country: "Portugal", region: "Vinho Verde", description: "Вино соломенного цвета с элегантным фруктовым ароматом и молодым свежим вкусом с легкой кислинкой. Рекомендуется подавать при температуре +8 - +10о С. Хорошо сочетается с рыбой, морепродуктами и мясными блюдами.", size: "0,75", price: 249.00, image: "anjos-de-portigal-vino-verde-330x550-884203808.jpg",style: "цветочное"),
        Wine(name: "Byass Sherry Elegante Fino", color: "white", sweetness: "dry", type: "крепленое", grape: "паломино", wineMaker: "Gonzalez Byass", country: "Spain", region: "Jerez de la Frontera", description: "", size: "0,75", price: 299.00, image: "gonzalez-byass-elegante-fino-sherry.jpg",style: ""),
        Wine(name: "Alvaro Domecq Manzanilla La Jaka", color: "white", sweetness: "dry", type: "крепленое", grape: "паломино", wineMaker: "Bodegas Alvaro Domecq", country: "Spain", region: "Andalusia", description: "Округлый и гладкий херес мансанилья красивого соломенно-золотого цвета с деликатным, мягким ароматом фруктов – яблок и абрикоса, сена, ромашки и выраженными тонами миндаля. Во вкусе довольно молодое и питкое, в атаке чрезвычайно фруктовое, напоминает тихое белое вино, становится суше, более характерным и напористым, с легкой травяной горчинкой и солеными нотами. Послевкусие довольно продолжительное с пикантными тонами.", size: "0,75", price: 399.0, image: "174507.jpg", style: "")
        
    
    ]
    
    func filterContentForSearchText(search: String, scope: String = "ALL") {
        filteredWines = wines.filter { wine in
            return wine.country.lowercaseString.containsString(search.lowercaseString) || wine.color.lowercaseString.containsString(search.lowercaseString) || wine.type.lowercaseString.containsString(search.lowercaseString) || wine.grape.lowercaseString.containsString(search.lowercaseString) || wine.wineMaker.lowercaseString.containsString(search.lowercaseString) || wine.name.lowercaseString.containsString(search.lowercaseString) || wine.region.lowercaseString.containsString(search.lowercaseString) || wine.style.lowercaseString.containsString(search.lowercaseString) || wine.sweetness.lowercaseString.containsString(search.lowercaseString)
        }
            tableView.reloadData()
        }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        

        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.active && searchController.searchBar.text != "" {
            return filteredWines.count
        }
       
        return wines.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifer = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(identifer, forIndexPath: indexPath) as! TableViewCell
        let wine: Wine
        
        if searchController.active && searchController.searchBar.text != "" {
            wine = filteredWines[indexPath.row]
        }
            else {
                wine = self.wines[indexPath.row]
            }
        
        
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
    

}

    extension WinesViewController: UISearchResultsUpdating {
        func updateSearchResultsForSearchController(searchController: UISearchController) {
            filterContentForSearchText(searchController.searchBar.text!)
        }
        
    }





