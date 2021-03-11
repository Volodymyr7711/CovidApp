//
//  NewsTableCell.swift
//  CovidApp
//
//  Created by Volodymyr Mendyk on 11.03.2021.
//

import UIKit

class NewsTableCell: UITableViewCell {

    @IBOutlet weak var newsImg: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
