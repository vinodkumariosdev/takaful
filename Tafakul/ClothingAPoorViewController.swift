//
//  ClothingAPoorViewController.swift
//  Tafakul
//
//  Created by VinodKatta on 21/06/22.
//

import UIKit

class ClothingAPoorViewController: UIViewController {
    @IBOutlet weak var otherTF: UITextField!
    @IBOutlet weak var numberTf: UITextField!
    @IBOutlet weak var totalAmounttf: UIView!
    @IBOutlet weak var donateBT: UIButton!
    @IBOutlet weak var addBasketBTN: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        otherTF.myViewCornersTwo()
        numberTf.myViewCornersTwo()
        totalAmounttf.myViewCornersTwo()
        donateBT.myViewCornersTwo()
        addBasketBTN.myViewCornersTwo()

       
    }
    
    @IBAction func backClothing(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
   

}
