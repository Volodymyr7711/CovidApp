//
//  NewsDetailsViewController.swift
//  CovidApp
//
//  Created by Volodymyr Mendyk on 11.03.2021.
//

import UIKit

class NewsDetailsViewController: UIViewController {

    var news: Article!
    
//    @IBOutlet weak var imgDetails: UIImageView!
    @IBOutlet weak var contentDetails: UILabel!
    @IBOutlet weak var urlDetails: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
