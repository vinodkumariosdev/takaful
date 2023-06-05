//
//  FoodBasketViewController.swift
//  Tafakul
//
//  Created by VinodKatta on 21/06/22.
//

import UIKit

class FoodBasketViewController: UIViewController {

    @IBOutlet weak var otherTF: UITextField!
    @IBOutlet weak var tAmountTF: UIView!
    @IBOutlet weak var donateBtn: UIButton!
  //  @IBOutlet weak var addbBtn: UIButton!
    
    @IBOutlet weak var donation45: UIButton!
    @IBOutlet weak var donation250: UIButton!
    @IBOutlet weak var donationCash: UIButton!
    
    var requestType = ""
    var categoryId: Int? = 71

    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var totalAmount: UILabel!
    
    @IBOutlet weak var userProfile: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        otherTF.myViewCornersTwo()
        tAmountTF.myViewCornersTwo()
        donateBtn.myViewCornersTwo()
       // addbBtn.myViewCornersTwo()
        labelTitle.text = "\(requestType.l10n())"
        
        self.hideKeyboardWhenTappedAround()
        self.userProfile.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.UserProfile))
        self.userProfile.addGestureRecognizer(tap)
       
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        otherTF.addTarget(self, action: #selector(textFieldDidChange(_:)),
                                  for: .editingChanged)
        setUpNavigationBar()
        self.hideKeyboardWhenTappedAround()
        
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
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        totalAmount.text = (textField.text ?? "") + " \(Constant.paymentMethod)"

    }
    
    @IBAction func backdashFood(_ sender: Any) {
        //self.dismiss(animated: true)
        self.navigationController?.popToRootViewController(animated: true)

    }
    
    
    @IBAction func donateNow(_ sender: Any) {
        let defaults = UserDefaults.standard
     //   if defaults.isLoggedIn() {
            print("Working donation")
            let vc = PaymentWebView()
            vc.donationAmount = totalAmount.text ?? "1"
            vc.donationType = requestType
            vc.categoryId = categoryId
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
//        }else{
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = storyboard.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
//            vc.modalPresentationStyle = .fullScreen
//            self.present(vc, animated:true, completion:nil)
//        }
       
    }
    
    @IBAction func donatino45btn(_ sender: Any) {
        totalAmount.text = "45 \(Constant.paymentMethod)"
        donationSelect(selectd: 1)

    }
    
    @IBAction func donation250Btn(_ sender: Any) {
        totalAmount.text = "250 \(Constant.paymentMethod)"
        donationSelect(selectd: 2)

    }
    
    @IBAction func donationCashBtn(_ sender: Any) {
        
       // donationSelect(selectd: 3)
    }
    func donationSelect(selectd: Int){
        otherTF.text = ""
        donation45.setImage(UIImage(named: "donation_45_2"), for: .normal)
        donation250.setImage(UIImage(named: "donation_250"), for: .normal)
        donationCash.setImage(UIImage(named: "cash"), for: .normal)
        
        
        switch(selectd){
        case 1:
            donation45.setImage(UIImage(named: "donation_45"), for: .normal)
            break
        case 2:
            donation250.setImage(UIImage(named: "donation_250_2"), for: .normal)
            break
        case 3:
            donationCash.setImage(UIImage(named: "cash_1"), for: .normal)
            break
            
            
        default:
            donation45.setImage(UIImage(named: "donation_45_2"), for: .normal)
            donation250.setImage(UIImage(named: "donation_250"), for: .normal)
            donationCash.setImage(UIImage(named: "cash_1"), for: .normal)
            break
            
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
}
