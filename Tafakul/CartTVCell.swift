//
//  CartTVCell.swift
//  Tafakul
//
//  Created by apple on 20/12/22.
//

import UIKit

class CartTVCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var donateIdLbl: UILabel!
    
    @IBOutlet weak var donateTypeLbl: UILabel!
    
    @IBOutlet weak var donateDateLbl: UILabel!
    
    @IBOutlet weak var DonateAmountLbl: UILabel!
    
    @IBOutlet weak var invoiceLbl: UILabel!
    
    @IBOutlet weak var DonationStatusLbl: UILabel!
    
    @IBOutlet weak var donationIDQuestionLbl: UILabel!
    
    @IBOutlet weak var donationTypeQuestionlbl: UILabel!
    
    @IBOutlet weak var donationDateQuestionLbl: UILabel!
    
    @IBOutlet weak var DonationamountQuestionLbl: UILabel!
    
    @IBOutlet weak var invoiceQuestionLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
