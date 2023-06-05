//
//  SponsershipsViewController.swift
//  Tafakul
//
//  Created by VinodKatta on 06/05/22.
//

import UIKit

class SponsershipsViewController: UIViewController {
    
    @IBOutlet weak var orphanView: UIView!
    @IBOutlet weak var familyNeedView: UIView!
    @IBOutlet weak var specialNeed: UIView!
    @IBOutlet weak var studentView: UIView!
    
    @IBOutlet weak var housingprojectView: UIView!
    
    @IBOutlet weak var conditionsViewElectronics: UIView!
    
    
    @IBOutlet weak var houseMaintenance: UIView!
    
    @IBOutlet weak var economicEmpowerment: UIView!
    
    @IBOutlet weak var conditionsElectronics: UIView!
    
    @IBOutlet weak var userProfile: UIImageView!
    @IBOutlet weak var barBTN: UIBarButtonItem!{
        didSet{
            barBTN.target = self.revealViewController()
            barBTN.action = #selector(SWRevealViewController.revealToggle(_:))
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        self.orphanView.addGestureRecognizer(gesture)
        
        let gesture2 = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction2))
        self.familyNeedView.addGestureRecognizer(gesture2)
        
        let gesture3 = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction3))
        gesture.name = "75"
        self.specialNeed.addGestureRecognizer(gesture3)
        
        let gesture4 = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction4))
        gesture.name = "76"
        self.studentView.addGestureRecognizer(gesture4)
        
        let gesture5 = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction6))
        gesture.name = "77"
        self.housingprojectView.addGestureRecognizer(gesture5)
        
        let gesture6 = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction7))
        gesture.name = "78"
        self.houseMaintenance.addGestureRecognizer(gesture6)
        
        let gesture7 = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction8))
        gesture.name = "79"
        self.economicEmpowerment.addGestureRecognizer(gesture7)
        
        let gesture8 = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction9))
        gesture.name = "80"
        self.conditionsViewElectronics.addGestureRecognizer(gesture8)
        
        self.userProfile.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.UserProfile))
        self.userProfile.addGestureRecognizer(tap)
       
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
    @objc func fbButtonPressed() {

           print("Share to fb")
       }
    
    @objc func fbButtonPressed1() {

           print("Share to fb")
       }
   

    //Sponsership

    
    @objc func checkAction(sender : UITapGestureRecognizer) {
        donateNowSponserships(requestType: "Orphan", categoryId: 73)
    }
    
    @objc func checkAction2(sender : UITapGestureRecognizer) {
        donateNowSponserships(requestType: "Family in need", categoryId: 74)
    }

    
    @objc func checkAction3(sender : UITapGestureRecognizer) {
        donateNowSponserships(requestType: "Special needs", categoryId: 75)

    }

    @objc func checkAction4(sender : UITapGestureRecognizer) {
        donateNowSponserships(requestType: "Students", categoryId: 76)
    }
    
    
    func donateNowSponserships(requestType: String, categoryId: Int){
//        let vc = self.storyboard?.instantiateViewController(identifier: "SponserAnOrphanViewController") as! SponserAnOrphanViewController
//        vc.requestType = requestType
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: true, completion: nil)
//
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "SponserAnOrphanViewController")as! SponserAnOrphanViewController
        vc.categoryId =  categoryId
           vc.requestType = requestType
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    //contribute to project

    @objc func checkAction6(sender : UITapGestureRecognizer) {
        donateProjectNow(requestType: "Housing project", categoryId: 77)
    }


    @objc func checkAction7(sender : UITapGestureRecognizer) {
        donateProjectNow(requestType: "House maintenance", categoryId: 78)
    }
//
    @objc func checkAction8(sender : UITapGestureRecognizer) {
        donateProjectNow(requestType: "Economic empowerment", categoryId: 79)
    }
    @objc func checkAction9(sender : UITapGestureRecognizer) {
        donateProjectNow(requestType: "Conditions & Electronics" , categoryId: 80)
    }
    
    
    func donateProjectNow(requestType: String,categoryId:Int ){
//        let vc = self.storyboard?.instantiateViewController(identifier: "DailySadaqaValueViewController") as! DailySadaqaValueViewController
//        vc.modalPresentationStyle = .fullScreen
//        vc.requestType = requestType
//        self.present(vc, animated: true, completion: nil)
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "DailySadaqaValueViewController")as! DailySadaqaValueViewController
           vc.requestType = requestType
        vc.categoryId = categoryId
        self.navigationController?.pushViewController(vc, animated: true)
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
