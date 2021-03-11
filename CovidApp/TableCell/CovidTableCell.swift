//
//  CovidTableCell.swift
//  CovidApp
//
//  Created by Volodymyr Mendyk on 04.03.2021.
//

import UIKit
import SDWebImage

class CovidTableCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var cases: UILabel!
    @IBOutlet weak var deaths: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }    
}
