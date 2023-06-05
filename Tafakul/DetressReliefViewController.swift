//
//  DetressReliefViewController.swift
//  Tafakul
//
//  Created by VinodKatta on 06/05/22.
//

import UIKit

class DetressReliefViewController: UIViewController {
    @IBOutlet weak var detressView: UIView!
    
    @IBOutlet weak var detressText: UITextField!
    @IBOutlet weak var detressBTN: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        detressBTN.myViewCornersTwo()
        detressText.myViewCornersTwo()
        detressView.myViewCornersTwo()

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
