//
//  DetailViewController.swift
//  CovidApp
//
//  Created by Volodymyr Mendyk on 05.03.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    var covid: Covid?
    
    @IBOutlet weak var recovered: UILabel!
    @IBOutlet weak var todayRecovered: UILabel!
    @IBOutlet weak var continent: UILabel!
    @IBOutlet weak var todayDeaths: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recovered.text = String((covid?.recovered)!)
        todayDeaths.text = String((covid?.todayDeaths)!)
        todayRecovered.text = String((covid?.todayRecovered)!)
        continent.text = String((covid?.continent)!)
        
        
    }
}
