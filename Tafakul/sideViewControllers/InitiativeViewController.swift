//
//  InitiativeViewController.swift
//  Tafakul
//
//  Created by VinodKatta on 06/05/22.
//

import UIKit

class InitiativeViewController: UIViewController {

    
    @IBOutlet weak var giftView: UIView!
    @IBOutlet weak var Donation2: UIView!
    @IBOutlet weak var Donation3: UIView!
   // @IBOutlet weak var donation4: UIView!
    @IBOutlet weak var Secrifice: UIView!
    @IBOutlet weak var Vow: UIView!
    @IBOutlet weak var Aqiqah: UIView!
    
    
    @IBOutlet weak var userProfile: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let gesture1 = UITapGestureRecognizer(target: self, action:  #selector(self.giftViewClick))
        self.giftView.addGestureRecognizer(gesture1)
        
        let gesture2 = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction2))
        self.Donation2.addGestureRecognizer(gesture2)
        
        let gesture3 = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction3))
        self.Donation3.addGestureRecognizer(gesture3)
        
      //  let gesture4 = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction4))
       // self.donation4.addGestureRecognizer(gesture4)

        let gesture5 = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction5))
        self.Vow.addGestureRecognizer(gesture5)

        let gesture6 = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction6))
        self.Aqiqah.addGestureRecognizer(gesture6)
        
        let gesture7 = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction7))
        self.Secrifice.addGestureRecognizer(gesture7)
        
        
        self.userProfile.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.UserProfile))
        self.userProfile.addGestureRecognizer(tap)
       
    }

    @objc func giftViewClick(sender : UITapGestureRecognizer) {
//        let vc = self.storyboard?.instantiateViewController(identifier: "GiveGiftViewController") as! GiveGiftViewController
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: true, completion: nil)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "GiveGiftViewController")as! GiveGiftViewController
          // vc.requestType = requestType
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func checkAction2(sender : UITapGestureRecognizer) {
        donateInitiativeNow(requestType: "Donation 2", categoryId: 86)
    }
    @objc func checkAction3(sender : UITapGestureRecognizer) {
        donateInitiativeNow(requestType: "Donation 3", categoryId: 86)
    }
    @objc func checkAction4(sender : UITapGestureRecognizer) {
        donateInitiativeNow(requestType: "Donation 4", categoryId: 86)
    }
    @objc func checkAction5(sender : UITapGestureRecognizer) {
        donateInitiativeNow(requestType: "Vow", categoryId: 87)
    }
    @objc func checkAction7(sender : UITapGestureRecognizer) {
        donateInitiativeNow(requestType: "Secrifice", categoryId: 88)
    }
    @objc func checkAction6(sender : UITapGestureRecognizer) {
        donateInitiativeNow(requestType: "Aqiqah", categoryId: 89)
    }
    func donateInitiativeNow(requestType: String, categoryId : Int){
//        let vc = self.storyboard?.instantiateViewController(identifier: "FoodBasketViewController") as! FoodBasketViewController
//        vc.modalPresentationStyle = .fullScreen
//        vc.requestType = requestType
//        self.present(vc, animated: true, completion: nil)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "FoodBasketViewController")as! FoodBasketViewController
         vc.requestType = requestType
         vc.categoryId = categoryId
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    @objc func fbButtonPressed()
    {

           print("to web")
    }
    
    @objc func fbButtonPressed1()
    {

           print("to search")
    }
    
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpNavigationBar()
        if Constant.isProfileView {
            if(Constant.isLoginView){
                Constant.isLoginView = false
                Constant.isProfileView = false
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "ProfileViewController")as! ProfileViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    func setUpNavigationBar(){
        UINavigationBar.appearance().backgroundColor = hexColor.navigationBarColor // backgorund color with gradient
        // or
        UINavigationBar.appearance().barTintColor =  hexColor.navigationBarColor  // solid color
            
        UIBarButtonItem.appearance().tintColor = hexColor.navigationBarColor
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        UITabBar.appearance().barTintColor = .white
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor =  hexColor.navigationBarColor
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
        
        navigationBtn()
    }
    
    func navigationBtn(){
        let buttonLeft = UIButton(type: .custom)
        buttonLeft.setImage(UIImage (named: "menu"), for: .normal)
        buttonLeft.frame = CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0)
        buttonLeft.addTarget(self, action: #selector(menuClick), for: .touchUpInside)

        let barButtonItemLeft = UIBarButtonItem(customView: buttonLeft)
       
        
    
        if revealViewController() != nil {
            self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
            barButtonItemLeft.target = self
            barButtonItemLeft.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
        //view.addGestureRecognizer(revealViewController().panGestureRecognizer())
       // view.addGestureRecognizer(revealViewController().tapGestureRecognizer())

        let buttonLeft2 = UIButton(type: .custom)
        buttonLeft2.setImage(UIImage (named: "top_logo"), for: .normal)
        buttonLeft2.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        buttonLeft2.addTarget(self, action: #selector(fbButtonPressed1), for: .touchUpInside)
        let barButtonItemLeft2 = UIBarButtonItem(customView: buttonLeft2)
        
        
        self.navigationItem.leftBarButtonItems = [barButtonItemLeft, barButtonItemLeft2]

        
  

        let button2 = UIButton(type: .custom)
        button2.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        button2.setImage(UIImage (named: "search"), for: .normal)
        button2.addTarget(self, action: #selector(fbButtonPressed1), for: .touchUpInside)
        let barButtonItem2 = UIBarButtonItem(customView: button2)
        
        let button3 = UIButton(type: .custom)
        button3.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        button3.setImage(UIImage (named: (LocalizationSystem.sharedInstance.getLanguage() == "ar") ? "name":"en"), for: .normal)
     //   button3.addTarget(self, action: #selector(fbButtonPressed2), for: .touchUpInside)
        let barButtonItem3 = UIBarButtonItem(customView: button3)
        
        self.navigationItem.rightBarButtonItems = [barButtonItem3,barButtonItem2]
        
        
    }
    
    @objc func menuClick()
    {
        self.revealViewController().revealToggle(self)
    }
    
    @objc func UserProfile()
    {
        if(UserDefaults.standard.isLoggedIn()){
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "ProfileViewController")as! ProfileViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            Constant.isProfileView = true
            showAlertLogin(requestView: "DashboardViewController", withMessage: "You need to login to view profile", completionHandler: {_ in
                
            })
        }
    
        
     }

}
