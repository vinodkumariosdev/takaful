//
//  SliderCollectionViewCell.swift
//  Tafakul
//
//  Created by Tariqul on 27/9/22.
//

import Foundation
class SliderCollectionViewCell:UICollectionViewCell{
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var donateNow: UIButton!{
        didSet{
            donateNow.backgroundColor = .clear
            donateNow.layer.cornerRadius = 10
            donateNow.layer.borderWidth = 1
            donateNow.layer.borderColor = UIColor.red.cgColor
        }
    }

}
