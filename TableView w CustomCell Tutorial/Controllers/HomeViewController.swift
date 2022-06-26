//
//  ViewController.swift
//  TableView w CustomCell Tutorial
//
//  Created by Ömer Faruk Kılıçaslan on 26.06.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var table: UITableView!
    
    
    var results = [Result]()
    let urlString = "https://rickandmortyapi.com/api/character"
    let searchController = UISearchController(searchResultsController: nil)
    
    var filteredCharacters: [String] = []
    var isSearching = false
    


    

    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        searchBar.delegate = self
        
        getAllData(url: urlString) { result in
            self.results = result
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        }
        

    }


    
    
    


}


extension HomeViewController: UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    //datasource method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.label.text = results[indexPath.row].name
        cell.iconImageView.downloaded(from: results[indexPath.row].image!)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected character : \(results[indexPath.row].name)")
    }
    
    //delegate method
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String, indexPath: IndexPath) {
        
       
    }
    
}




