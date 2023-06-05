//
//  SpecialNeedsSponsershipViewController.swift
//  Tafakul
//
//  Created by VinodKatta on 22/06/22.
//

import UIKit

class SpecialNeedsSponsershipViewController: UIViewController {
    @IBOutlet weak var sponsershipAmountc: UITextField!
    @IBOutlet weak var totalamountc: UIView!
    
    @IBOutlet weak var donatebtn: UIButton!
    
    @IBOutlet weak var addtobasketbtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sponsershipAmountc.myViewCornersTwo()
        totalamountc.myViewCornersTwo()
        donatebtn.myViewCornersTwo()
        addtobasketbtn.myViewCornersTwo()

        
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true,completion: nil)
    }
    
    

}
