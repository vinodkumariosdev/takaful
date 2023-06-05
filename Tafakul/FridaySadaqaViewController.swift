//
//  FridaySadaqaViewController.swift
//  Tafakul
//
//  Created by VinodKatta on 06/05/22.
//

import UIKit

class FridaySadaqaViewController: UIViewController {

    @IBOutlet weak var addFridaybtn: UIButton!
    @IBOutlet weak var famount: UITextField!
    @IBOutlet weak var amountFridyView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addFridaybtn.myViewCornersTwo()
        famount.myViewCornersTwo()
        amountFridyView.myViewCornersTwo()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtn(_ sender: Any) {
//        let vc = self.storyboard?.instantiateViewController(identifier: "SWRevealViewController") as! SWRevealViewController
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: true, completion: nil)
     //   self.dismiss(animated: true,completion: nil)
        self.navigationController?.popToRootViewController(animated: true)

    }
    
    

}
