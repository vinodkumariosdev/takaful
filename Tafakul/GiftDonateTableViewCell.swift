//
//  GiftDonateTableViewCell.swift
//  Tafakul
//
//  Created by apple on 26/12/22.
//

import UIKit

class GiftDonateTableViewCell: UITableViewCell {

    @IBOutlet weak var donateImg: UIImageView!
    @IBOutlet weak var donationNameLbl: UILabel!
    @IBOutlet weak var cardVieww: UIView!{
        didSet{
            self.cardVieww.layer.cornerRadius = 40
            self.cardVieww.layer.masksToBounds = true
            self.cardVieww.layer.borderColor = UIColor.blue.cgColor
            self.cardVieww.layer.borderWidth = 1
        }
    }
    
    @IBOutlet weak var donateGiftLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
