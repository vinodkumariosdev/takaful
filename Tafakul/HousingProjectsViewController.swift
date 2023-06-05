//
//  HousingProjectsViewController.swift
//  Tafakul
//
//  Created by VinodKatta on 22/06/22.
//

import UIKit

class HousingProjectsViewController: UIViewController {
    @IBOutlet weak var otherAmountTF: UITextField!
    @IBOutlet weak var stocksAmountTF: UITextField!
    @IBOutlet weak var totalamountTF: UIView!
    @IBOutlet weak var addtoBasketBtn: UIButton!
    
    @IBOutlet weak var donateBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        otherAmountTF.myViewCornersTwo()
        stocksAmountTF.myViewCornersTwo()
        totalamountTF.myViewCornersTwo()
        addtoBasketBtn.myViewCornersTwo()
        
    }
    

   
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true,completion: nil)
    }
    
}
