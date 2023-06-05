//
//  ExpiationforOathViewController.swift
//  Tafakul
//
//  Created by VinodKatta on 21/06/22.
//

import UIKit

class ExpiationforOathViewController: UIViewController {

    @IBOutlet weak var totaltf: UIView!
    @IBOutlet weak var otherAtf: UITextField!
    @IBOutlet weak var donatebtn: UIButton!
    @IBOutlet weak var addtobasket: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totaltf.myViewCornersTwo()
        otherAtf.myViewCornersTwo()
        donatebtn.myViewCornersTwo()
        addtobasket.myViewCornersTwo()

      
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backExpitation(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    

}
