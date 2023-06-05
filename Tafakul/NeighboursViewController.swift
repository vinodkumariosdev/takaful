//
//  NeighboursViewController.swift
//  Tafakul
//
//  Created by VinodKatta on 06/05/22.
//

import UIKit

class NeighboursViewController: UIViewController {

    @IBOutlet weak var neighboursBtn: UIButton!
    @IBOutlet weak var neighboursTft: UITextField!
    @IBOutlet weak var neighview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        neighview.myViewCornersTwo()
        neighboursBtn.myViewCornersTwo()
        neighboursTft.myViewCornersTwo()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtn(_ sender: Any) {
//        let vc = self.storyboard?.instantiateViewController(identifier: "SWRevealViewController") as! SWRevealViewController
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: true, completion: nil)
        self.dismiss(animated: true,completion: nil)
    }
    
    

}
