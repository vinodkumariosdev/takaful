//
//  SearchTableViewCell.swift
//  Tafakul
//
//  Created by apple on 11/01/23.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    var accountObj: SearchList? {
        didSet {
            lbl.text = accountObj?.name ?? ""
            img.image = UIImage(named: accountObj?.image ?? "")
        }
    }


}
