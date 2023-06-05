//
//  PublicSadaqatViewController.swift
//  Tafakul
//
//  Created by VinodKatta on 21/06/22.
//

import UIKit

class PublicSadaqatViewController: UIViewController {

    @IBOutlet weak var tAmountTF: UIView!
    @IBOutlet weak var otherTF: UITextField!
    @IBOutlet weak var donateBT: UIButton!
    @IBOutlet weak var addcrtBTN: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tAmountTF.myViewCornersTwo()
        otherTF.myViewCornersTwo()
        donateBT.myViewCornersTwo()
        addcrtBTN.myViewCornersTwo()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backDash(_ sender: Any) {
      //  self.dismiss(animated: true)
        self.navigationController?.popToRootViewController(animated: true)

    }
    
}
