//
//  MoreViewController.swift
//  Tafakul
//
//  Created by VinodKatta on 11/05/22.
//

import UIKit

class MoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func backAction(_ sender: Any) {
//        let vc = self.storyboard?.instantiateViewController(identifier: "SWRevealViewController") as! SWRevealViewController
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: true, completion: nil)
        self.dismiss(animated: true)
    }
    

}
