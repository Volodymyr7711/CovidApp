//
//  NewsDetailsViewController.swift
//  CovidApp
//
//  Created by Volodymyr Mendyk on 11.03.2021.
//

import UIKit
import SDWebImage

class NewsDetailsViewController: UIViewController {
    
    var news: Article?
    
    @IBOutlet weak var detailContent: UILabel!
    @IBOutlet weak var titleNews: UILabel!
    @IBOutlet weak var feedImg: UIImageView!
    @IBOutlet weak var detailNews: UILabel!
    @IBOutlet weak var name: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        feedImg.layer.cornerRadius = 10
        feedImg.layer.masksToBounds = true
        feedImg.layer.borderWidth = 2
        feedImg.layer.borderColor = UIColor.red.cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let Img = news?.urlToImage
        detailNews?.text = news?.description
        feedImg?.sd_setImage(with: URL(string: Img!), completed: nil)
        detailContent?.text = news?.content
        titleNews?.text = news?.title
        name?.text = news?.source.name
        
    }
    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true)
    }
}
