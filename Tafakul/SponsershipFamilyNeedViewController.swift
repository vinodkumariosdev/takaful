//
//  SponsershipFamilyNeedViewController.swift
//  Tafakul
//
//  Created by VinodKatta on 22/06/22.
//

import UIKit

class SponsershipFamilyNeedViewController: UIViewController
{

    @IBOutlet weak var sponsershipAmountBT: UITextField!
    @IBOutlet weak var totalamounttf: UIView!
    @IBOutlet weak var donateBT: UIButton!
    @IBOutlet weak var addtobasketbt: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        sponsershipAmountBT.myViewCornersTwo()
        totalamounttf.myViewCornersTwo()
        donateBT.myViewCornersTwo()
        addtobasketbt.myViewCornersTwo()
        
    }
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
