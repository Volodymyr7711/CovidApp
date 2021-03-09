//
//  ViewController.swift
//  CovidApp
//
//  Created by Volodymyr Mendyk on 04.03.2021.
//

import UIKit
import SDWebImage

class ViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchController: UISearchBar!
    @IBOutlet var table: UITableView!
    var model = [Covid]()
    var filteredCountries: [Covid] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchController.delegate = self
        table.delegate = self
        table.dataSource = self
        parse {
            self.table.reloadData()
        }

    }
    
    var isSearchBarEmpty: Bool {
        return searchController.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String,
                                    category: Covid? = nil) {
      filteredCountries = model.filter { (candy: Covid) -> Bool in
        return candy.country.lowercased().contains(searchText.lowercased())
      }
      
      tableView.reloadData()
    }
    
    var isFiltering: Bool {
        return (searchController != nil) && !isSearchBarEmpty
    }
    
    func parse(completed: @escaping () -> ()) {
        let url = URL(string: "https://disease.sh/v3/covid-19/countries")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do {
                    self.model = try JSONDecoder().decode([Covid].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isFiltering {
            return filteredCountries.count
        }
            return model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)  as! CovidTableCell
        let covid: Covid
        if isFiltering {
            covid  = filteredCountries[indexPath.row]
        } else {
            covid = model[indexPath.row]
        }
        cell.country.text = covid.country
        cell.cases.text = String(covid.cases)
        cell.deaths.text = String(covid.deaths!)
        let imgUrl = model[indexPath.row].countryInfo.flag
        cell.img.sd_setImage(with: URL(string: imgUrl), completed: nil)
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let detailvc = storyboard.instantiateViewController(withIdentifier: "detailvc") as! DetailViewController
        self.present(detailvc, animated: true, completion: nil)
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
  }
