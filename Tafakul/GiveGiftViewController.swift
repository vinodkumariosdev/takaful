//
//  GiveGiftViewController.swift
//  Tafakul
//
//  Created by VinodKatta on 22/06/22.
//

import UIKit

class GiveGiftViewController: UIViewController {

    @IBOutlet weak var D1giftView: UIView!
    @IBOutlet weak var D2giftView: UIView!
    @IBOutlet weak var D3giftView: UIView!
    @IBOutlet weak var D4giftView: UIView!
    
    @IBOutlet weak var userProfile: UIImageView!
    private static var requectType  = ""
    private static var categoryId  = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        D1giftView.myViewCornersTwo()
        D2giftView.myViewCornersTwo()
        D3giftView.myViewCornersTwo()
        D4giftView.myViewCornersTwo()
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction1))
        self.D1giftView.addGestureRecognizer(gesture)
        
        let gesture1 = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction2))
        self.D2giftView.addGestureRecognizer(gesture1)
        
        let gesture2 = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction3))
        self.D3giftView.addGestureRecognizer(gesture2)
        
        let gesture3 = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction4))
        self.D4giftView.addGestureRecognizer(gesture3)
        
        self.userProfile.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.UserProfile))
        self.userProfile.addGestureRecognizer(tap)
       
        
    }
    
    
    
    @IBAction func backbtn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
                                             
@objc func checkAction1(sender : UITapGestureRecognizer) {
    donateNow(requestType: "Public Sadaqat", categoryId: 69)
 }
    @objc func checkAction2(sender : UITapGestureRecognizer) {
        donateNow(requestType: "Clothing a poor", categoryId: 71)
     }
    @objc func checkAction3(sender : UITapGestureRecognizer) {
        donateNow(requestType: "Ecpiation for a broken Oath", categoryId: 72)
     }
    @objc func checkAction4(sender : UITapGestureRecognizer) {
        donateNow(requestType: "Daily sadaqa", categoryId: 88)
     }
    
    func donateNow(requestType: String, categoryId: Int){
        
    
        if(UserDefaults.standard.isLoggedIn()){
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "CompletionDetailsViewController")as! CompletionDetailsViewController
            vc.requestType = requestType
            vc.categoryId = categoryId
            self.navigationController?.pushViewController(vc, animated: true)
            
        }else{
            Constant.isGiftView = true
            GiveGiftViewController.requectType = requestType
            GiveGiftViewController.categoryId = categoryId
            showAlertLogin(requestView: "GiveGiftViewController", withMessage: "You need to login to complete payment", completionHandler: {_ in
                
            })
        }

    }
                                             
    @objc func UserProfile()
    {
        if(UserDefaults.standard.isLoggedIn()){
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "ProfileViewController")as! ProfileViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            Constant.isProfileView = true
            showAlertLogin(requestView: "GiveGiftViewController", withMessage: "You need to login to view profile", completionHandler: {_ in
                
            })
        }
    
        
     }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         setUpNavigationBar()
      
        if Constant.isLoginView {
            if(Constant.isProfileView){
                Constant.isLoginView = false
                Constant.isProfileView = false
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "ProfileViewController")as! ProfileViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
            if(Constant.isGiftView){
                Constant.isLoginView = false
                Constant.isGiftView = false
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "CompletionDetailsViewController")as! CompletionDetailsViewController
                vc.requestType = GiveGiftViewController.requectType
                vc.categoryId = GiveGiftViewController.categoryId

                self.navigationController?.pushViewController(vc, animated: true)
            }
            
        }
    }
  
    func setUpNavigationBar(){
        

        UINavigationBar.appearance().backgroundColor = hexColor.navigationBarColor // backgorund color with gradient
        // or
        UINavigationBar.appearance().barTintColor =  hexColor.navigationBarColor  // solid color
            
        UIBarButtonItem.appearance().tintColor = hexColor.navigationBarColor
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.red]
        UITabBar.appearance().barTintColor = .red
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor =  hexColor.navigationBarColor
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
        self.navigationController?.navigationBar.barTintColor = hexColor.navigationBarColor

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
        buttonLeft2.addTarget(self, action: #selector(menuClick), for: .touchUpInside)
        let barButtonItemLeft2 = UIBarButtonItem(customView: buttonLeft2)
        
        
        self.navigationItem.leftBarButtonItems = [barButtonItemLeft, barButtonItemLeft2]

        
  

        let button2 = UIButton(type: .custom)
        button2.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        button2.setImage(UIImage (named: "search"), for: .normal)
        button2.addTarget(self, action: #selector(menuClick), for: .touchUpInside)
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

    
    
}
