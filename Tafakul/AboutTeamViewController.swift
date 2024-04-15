//
//  AboutTeamViewController.swift
//  Tafakul
//
//  Created by Yousuf A Almawli on 11/03/2024.
//

import UIKit

class AboutTeamViewController: UIViewController {

    @IBOutlet weak var donationDetailsLbl: UILabel!
    @IBOutlet weak var backBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            donationDetailsLbl.text = "تفاصيل التبرع"
            backBtn.setImage(UIImage.init(named: "ArabicBackIcon"), for: .normal)
            
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            donationDetailsLbl.text = "Donation Details"
            backBtn.setImage(UIImage.init(named: "BackButton"), for: .normal)
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backBtn(_ sender: Any) {

       /* let firstVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
        let rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SWRevealViewController")

        let navigationController = UINavigationController()
           navigationController.viewControllers = [firstVC]
         UIApplication.shared.keyWindow?.rootViewController = navigationController
         UIApplication.shared.keyWindow?.rootViewController = rootVC*/
        
        self.dismiss(animated: true)
    }
}
