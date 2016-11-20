    //
//  WinesViewController.swift
//  WineList
//
//  Created by Vladimir Saprykin on 18.05.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import AlamofireObjectMapper

    let baseURL = "https://winelistvillagio.firebaseio.com"
    let headers = [
        "x-apikey": "46a3f3f3281c43ec988465cd460fbacd06c85",
        "Accept": "application/json"
    ]
    
    
    let URL = "https://villaggio-4e2e.restdb.io/rest/winelist"


class WinesViewController: UITableViewController {
    let updateIndicator = UIRefreshControl()
    
    let searchController = UISearchController(searchResultsController: nil)
    var filteredWines = [Wine]()
    
    let countries = ["ASIA", "EUROPE", "South America"]
    var wines:[Wine] = []
    
    func updateData() {
        Alamofire.request(URL, method: .get, headers: headers).responseArray { (response: DataResponse<[Wine]>) in
            guard let wines = response.result.value else { return }
            
            self.wines = wines
            self.tableView.reloadData()
        }
    }
    
    func didRefreshData() {
        updateIndicator.beginRefreshing()
        updateData()
        updateIndicator.endRefreshing()
    }
    
    func showSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Find by name, region etc"
        tableView.tableHeaderView = searchController.searchBar
        if searchController.isActive {
        searchController.searchBar.setShowsCancelButton(true, animated: true)
        }
    }
    
    func filterContentForSearchText(_ search: String, scope: String = "ALL") {
        filteredWines = wines.filter { wine in
            return wine.country.lowercased().contains(search.lowercased()) || wine.color.lowercased().contains(search.lowercased()) || wine.type.lowercased().contains(search.lowercased()) || wine.grape.lowercased().contains(search.lowercased()) || wine.wineMaker.lowercased().contains(search.lowercased()) || wine.name.lowercased().contains(search.lowercased()) || wine.region.lowercased().contains(search.lowercased()) || wine.style.lowercased().contains(search.lowercased()) || wine.sweetness.lowercased().contains(search.lowercased())
        }
            tableView.reloadData()
        }
    

    override func viewDidLoad() {

        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(WinesViewController.showSearchBar))

        tableView.addSubview(updateIndicator)
        updateIndicator.attributedTitle = NSAttributedString(string: "Идет обновление...")
        updateIndicator.addTarget(self, action: #selector(WinesViewController.didRefreshData), for: UIControlEvents.valueChanged)

        Alamofire.request(URL, method: .get, headers: headers).responseArray { (response: DataResponse<[Wine]>) in
            guard let wines = response.result.value else { return }
            
            self.wines = wines
            self.tableView.reloadData()
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredWines.count
        }
       
        return wines.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifer = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifer, for: indexPath) as! TableViewCell
        let wine: Wine
        
        if searchController.isActive && searchController.searchBar.text != "" {
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let destinationController = segue.destination as! DetailViewController
            if let indexPath = self.tableView.indexPathForSelectedRow {                
                destinationController.wine = wines[indexPath.row]
            }
        }
    }
}
        extension WinesViewController: UISearchResultsUpdating {
            func updateSearchResults(for searchController: UISearchController) {
                    filterContentForSearchText(searchController.searchBar.text!)
                }
             
            }

   



