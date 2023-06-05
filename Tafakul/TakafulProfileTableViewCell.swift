//
//  TakafulProfileTableViewCell.swift
//  Tafakul
//
//  Created by apple on 16/05/23.
//

import UIKit

class TakafulProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var imgVieww: UIImageView!
    
    @IBOutlet weak var donationLbl: UILabel!
    
    @IBOutlet weak var ArrowImg: UIImageView!
    
    var accountObj: profileList? {
        didSet {
            donationLbl.text = accountObj?.name ?? ""
            imgVieww.image = UIImage(named: accountObj?.image ?? "")
        }
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
