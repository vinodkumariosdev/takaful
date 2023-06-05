//
//  NewsTVCell.swift
//  Tafakul
//
//  Created by apple on 21/12/22.
//

import UIKit

class NewsTVCell: UITableViewCell {

    @IBOutlet weak var descriptionLbl: UILabel!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var newsImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
