//
//  ViewController.swift
//  CovidApp
//
//  Created by Volodymyr Mendyk on 04.03.2021.
//

import UIKit
import SDWebImage

class CountryViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var table: UITableView!
    
    var model = [Covid]()
    var filteredCountries: [Covid] = []
    let searchController = UISearchController(searchResultsController: nil)
    private var url = "https://disease.sh/v3/covid-19/countries"
    
    override func viewWillAppear(_ animated: Bool) {
        fill()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        parse {
            self.table.reloadData()
        }
    }
    
    private func parse(completed: @escaping () -> ()) {
        let url = URL(string: url)
        
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
    
    private func setupTableView() {
        definesPresentationContext = true
        table.delegate = self
        table.dataSource = self
        table.showsVerticalScrollIndicator = false
        table.showsHorizontalScrollIndicator = false
    }
}

extension CountryViewController: UISearchResultsUpdating, UITableViewDelegate, UITableViewDataSource {
    
    
    private func setupSearchBar() {
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Country"
    }
    
    private func fill() {
        setupSearchBar()
        self.topView.addSubview(self.searchController.searchBar)
        self.searchController.searchBar.sizeToFit()
        self.searchController.searchBar.frame.size.width = self.view.frame.size.width
        navigationItem.searchController = searchController
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
    func filterContentForSearchText(_ searchText: String,
                                    category: Covid? = nil) {
        filteredCountries = model.filter { (country: Covid) -> Bool in
            return country.country.lowercased().contains(searchText.lowercased())
        }
        table.reloadData()
    }
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredCountries.count
        }
        return model.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)  as! CovidTableCell
        cell.selectionStyle = .none
        let corona: Covid
        if isFiltering {
            corona = filteredCountries[indexPath.row]
        } else {
            corona = model[indexPath.row]
        }
        cell.country.text = corona.country
        cell.cases.text = String(corona.cases)
        cell.deaths.text = String(corona.deaths!)
        let imgUrl = corona.countryInfo.flag
        cell.img.sd_setImage(with: URL(string: imgUrl), completed: nil)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let corona: Covid
        let detailsvc = storyboard?.instantiateViewController(withIdentifier: "detailvc") as! DetailViewController
        if isFiltering {
            corona = filteredCountries[indexPath.row]
            detailsvc.covid = corona
        } else {
            corona = model[indexPath.row]
            detailsvc.covid = corona
        }
        self.present(detailsvc, animated: true, completion: nil)
    }
}
