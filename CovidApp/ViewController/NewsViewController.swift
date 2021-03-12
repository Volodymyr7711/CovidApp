//
//  NewsViewController.swift
//  CovidApp
//
//  Created by Volodymyr Mendyk on 11.03.2021.
//

import UIKit
import SDWebImage

class NewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var newsFeed = [Article]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        definesPresentationContext = true
        parse {
            self.tableView.reloadData()
            self.tableView.layoutIfNeeded()
        }
        
    }
    func parse(completed: @escaping () -> ()) {
        let url = URL(string: "http://newsapi.org/v2/everything?q=covid&language=en&apiKey=c4a5aefd474b42069c588527578ffa4a")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do {
                    let root = try JSONDecoder().decode(NewsFeed.self, from: data!)
                    self.newsFeed = root.articles
                    DispatchQueue.main.async {
                        completed()
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}


extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsFeed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "News", for: indexPath) as! NewsTableCell
        let feed = newsFeed[indexPath.row]
        let imgToUrl = feed.urlToImage
        cell.desc.text = feed.description
        cell.name.text = feed.author
        cell.title.text = feed.title
        cell.newsImg.sd_setImage(with:URL(string: imgToUrl!), completed: nil)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsVC = storyboard?.instantiateViewController(withIdentifier: "newsVC") as! NewsDetailsViewController
        let news = newsFeed[indexPath.row]
        newsVC.news = news
        self.present(newsVC, animated: true, completion: nil)
        
    }
}
