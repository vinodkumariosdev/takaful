
//
//  NewsDetailsVC.swift
//  Tafakul
//
//  Created by apple on 21/12/22.
//

import UIKit

class NewsDetailsVC: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    var namelbl:String!
    
    @IBOutlet weak var newsDetailsLbl: UILabel!
    
    var descriptionText:String!
    
    var imageUrl:String!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    
    @IBOutlet weak var nameTxt: UILabel!
    
    @IBOutlet weak var backBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            newsDetailsLbl.text = "أخبار"
            self.nameTxt.text = namelbl
            self.descriptionLbl.text = descriptionText
            backBtn.setImage(UIImage.init(named: "ArabicBackIcon"), for: .normal)
            
            let url = URL(string: imageUrl)
            self.imgView.kf.setImage(with: url)
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            newsDetailsLbl.text = "News"
            backBtn.setImage(UIImage.init(named: "BackButton"), for: .normal)
            self.nameTxt.text = namelbl
            self.descriptionLbl.text = descriptionText
            let url = URL(string: imageUrl)
            self.imgView.kf.setImage(with: url)
        }
    }
    

   
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
