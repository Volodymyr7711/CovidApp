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
        self.layoutIfNeeded()
        newsImg.layer.cornerRadius = 10
        newsImg.layer.masksToBounds = true
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
