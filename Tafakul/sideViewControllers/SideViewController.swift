//
//  SideViewController.swift
//  Tafakul
//
//  Created by VinodKatta on 22/04/22.
//

import UIKit
import L10n_swift

class SideViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    

    @IBOutlet weak var sideMenuTableview: UITableView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if Constant.isLoginView {
            if Constant.isLoginButton {
                Constant.isLoginButton = false
                let vc = self.storyboard?.instantiateViewController(identifier: "SWRevealViewController") as! SWRevealViewController
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: false, completion: nil)
            }
        }
        
    }
    var items = ["Home".l10n(), "Sponserships".l10n(), "Initiative".l10n(), "About Takaful".l10n(),"Donation Details".l10n(), UserDefaults.standard.isLoggedIn() ? "Logout".l10n():"Login".l10n()]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! sideMenuTableCell
        cell.sideMenuLbl.text = items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if indexPath.row == 0{
            let vc = self.storyboard?.instantiateViewController(identifier: "SWRevealViewController") as! SWRevealViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        if indexPath.row == 1{
            self.performSegue(withIdentifier: "Sponserships", sender: self)
            self.revealViewController().revealToggle(self)
        }
        if indexPath.row == 2{
            self.performSegue(withIdentifier: "InitiativeViewController", sender: self)
            self.revealViewController().revealToggle(self)
        }
        if indexPath.row == 3{
            self.performSegue(withIdentifier: "aboutSeque", sender: self)
            self.revealViewController().revealToggle(self)
        }
        if indexPath.row == 4{
            if UserDefaults.standard.isLoggedIn() {
                self.performSegue(withIdentifier: "DonationDetailsViewController", sender: self)
            }else{
                 Constant.isDonationDetailsView = true
                 showAlertLogin(requestView: "DonationDetails", withMessage: "You need to login to view donation details"){ _ in}
             }
            self.revealViewController().revealToggle(self)

        }
        if indexPath.row == 5{
            if UserDefaults.standard.isLoggedIn() {
                self.revealViewController().revealToggle(self)
                UserDefaults.standard.setLoggedIn(value: false)
                UserDefaults.standard.setUserID(value: 0)
                let vc = self.storyboard?.instantiateViewController(identifier: "SWRevealViewController") as! SWRevealViewController
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            
            }else{
                Constant.isLoginButton = true
               // self.performSegue(withIdentifier: "LoginViewController", sender: self)
                showAlertLogin(requestView: "SponserAnOrphanView", withMessage: "Do you want to login?"){ _ in}
                
            }
            
//            let vc = self.storyboard?.instantiateViewController(identifier: "SWRevealViewController") as! SWRevealViewController
//            vc.modalPresentationStyle = .fullScreen
//            self.present(vc, animated: true, completion: nil)
        }
    }

    

    @IBAction func closeBTN(_ sender: Any) {
        self.revealViewController().revealToggle(self)

    }
    

}
class sideMenuTableCell: UITableViewCell {
    
    @IBOutlet weak var sideMenuLbl: UILabel!
    
}


