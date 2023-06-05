//
//  ConditionsElectonicsViewController.swift
//  Tafakul
//
//  Created by VinodKatta on 22/06/22.
//

import UIKit

class ConditionsElectonicsViewController: UIViewController {
    @IBOutlet weak var otherAmountTF: UITextField!
    @IBOutlet weak var stockamountTF: UITextField!
    @IBOutlet weak var totalamountTF: UIView!
    
    @IBOutlet weak var addtobasketBtn: UIButton!
    @IBOutlet weak var donateBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        otherAmountTF.myViewCornersTwo()
        stockamountTF.myViewCornersTwo()
        totalamountTF.myViewCornersTwo()
        
        addtobasketBtn.myViewCornersTwo()
        donateBtn.myViewCornersTwo()
    }
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true,completion: nil)
    }
    

    

}
