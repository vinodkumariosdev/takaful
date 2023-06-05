//
//  CompletionDetailsViewController.swift
//  Tafakul
//
//  Created by VinodKatta on 22/06/22.
//

import UIKit

class CompletionDetailsViewController: UIViewController, SWRevealViewControllerDelegate {

    
    @IBOutlet weak var GiftRecipiantName: UITextField!
    

    @IBOutlet weak var recipiantAmount: UITextField!
    @IBOutlet weak var recipiantPhone: UITextField!
    
    @IBOutlet weak var isChecked: UIButton!
    
    @IBOutlet weak var userProfile: UIImageView!
    
    @IBOutlet weak var menuBtn: UIButton!
    
    var requestType: String = ""
    var categoryId: Int? = 71

    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  self.revealViewController().delegate = self

        // Do any additional setup after loading the view.
        
        self.userProfile.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.UserProfile))
        self.userProfile.addGestureRecognizer(tap)
    }
    override func viewWillAppear(_ animated: Bool) {
       
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
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
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)

      //  self.dismiss(animated: true,completion: nil)
    }
    
    @IBAction func isChecked(_ sender: Any) {
        if(isChecked.isSelected){
            isChecked.isSelected = false
            isChecked.setImage(UIImage(named: "checked"), for: .normal)
        }else{
            isChecked.isSelected = true
            isChecked.setImage(UIImage(named: "unchecked"), for: .normal)
        }
        
    }
    
    @IBAction func btnMenu(_ sender: Any) {
          self.revealViewController().revealToggle(self)
//                let vc = self.storyboard?.instantiateViewController(identifier: "SWRevealViewController") as! SWRevealViewController
//                vc.modalPresentationStyle = .fullScreen
//                self.present(vc, animated: true, completion: nil)
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
      //  buttonLeft2.addTarget(self, action: #selector(fbButtonPressed1), for: .touchUpInside)
        let barButtonItemLeft2 = UIBarButtonItem(customView: buttonLeft2)
        
        
        self.navigationItem.leftBarButtonItems = [barButtonItemLeft, barButtonItemLeft2]

        
  

        let button2 = UIButton(type: .custom)
        button2.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        button2.setImage(UIImage (named: "search"), for: .normal)
     //   button2.addTarget(self, action: #selector(fbButtonPressed1), for: .touchUpInside)
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
    
    
    @IBAction func donateNow(_ sender: Any) {
        
        //GiftRecipiantName.
        //recipiantPhone.setError("Error message", show: true)
        if((GiftRecipiantName.text?.isEmpty) != nil && GiftRecipiantName.text == ""){
            showToast(message: "Recipient name is required".l10n())
            return

        }
        if((recipiantPhone.text?.isEmpty) != nil && recipiantPhone.text == ""){
            showToast(message: "Recipient mobile number is required".l10n())
            return
        }
        if((recipiantAmount.text?.isEmpty) != nil && recipiantAmount.text == ""){
            showToast(message: "Recipient amount is required".l10n())
            return
        }
        
            //let defaults = UserDefaults.standard
            print("Working donation")
            let vc = PaymentWebView()
            vc.donationAmount = recipiantAmount.text ?? "1"
            vc.donationType = requestType
            vc.categoryId = categoryId
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
    }
    
    func showToast(message : String) {

          // add label
            let toastLabel = UILabel(frame: CGRect(x: 30, y: self.view.frame.size.height/2, width: self.view.frame.size.width-20, height: 35))
            toastLabel.text = message
            toastLabel.textColor = .red
            toastLabel.textAlignment = .center
            toastLabel.alpha = 1.0
            toastLabel.layer.cornerRadius = 10;
            toastLabel.clipsToBounds  =  true
            toastLabel.backgroundColor = .lightGray


            //add button
            let button = UIButton.init(type: .custom)
            button.frame = CGRect.init(x: toastLabel.frame.width - 50, y: toastLabel.frame.origin.y + 20, width: 40, height: 40)
            self.view.addSubview(toastLabel)
            //self.view.addSubview(button)
            UIView.animate(withDuration: 4.0, delay: 1.0, options: .curveEaseOut, animations: {
                toastLabel.alpha = 0.0
            }, completion: {(isCompleted) in
                toastLabel.removeFromSuperview()
            })
        }
}
