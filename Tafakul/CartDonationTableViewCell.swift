//
//  CartDonationTableViewCell.swift
//  Tafakul
//
//  Created by apple on 19/01/23.
//

import UIKit

class CartDonationTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!{
        didSet{
            self.cardView.layer.cornerRadius = 10.0
            self.cardView.layer.masksToBounds = true
            
        }
    }
    
    @IBOutlet weak var imgVieww: UIImageView!
    
    @IBOutlet weak var amountLbl: UILabel!
    
    @IBOutlet weak var donateBtn: UIButton!{
        didSet{
            self.donateBtn.layer.cornerRadius = 10.0
            self.donateBtn.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
