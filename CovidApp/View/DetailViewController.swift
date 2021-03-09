//
//  DetailViewController.swift
//  CovidApp
//
//  Created by Volodymyr Mendyk on 05.03.2021.
//

import UIKit

class DetailViewController: UIViewController {

    var ill: Covid!
    
    @IBOutlet weak var recovered: UILabel!
    @IBOutlet weak var todayRecovered: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
