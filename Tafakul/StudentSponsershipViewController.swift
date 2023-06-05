//
//  StudentSponsershipViewController.swift
//  Tafakul
//
//  Created by VinodKatta on 22/06/22.
//

import UIKit

class StudentSponsershipViewController: UIViewController {
    
    @IBOutlet weak var sponcershipamountTF: UITextField!
    @IBOutlet weak var totalamountTF: UIView!
    
    @IBOutlet weak var donateBtn: UIButton!
    
    @IBOutlet weak var addtobasketBTN: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sponcershipamountTF.myViewCornersTwo()
        totalamountTF.myViewCornersTwo()
        donateBtn.myViewCornersTwo()
        addtobasketBTN.myViewCornersTwo()
        
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true,completion: nil)
    }
    
    

}
