//
//  DailySadaqaValueViewController.swift
//  Tafakul
//
//  Created by VinodKatta on 06/05/22.
//

import UIKit
import L10n_swift

class DailySadaqaValueViewController: UIViewController {
  //  @IBOutlet weak var addbasketBtn: UIButton!
    @IBOutlet weak var otherAmount: UITextField!
    
    @IBOutlet weak var AmountView: UIView!
    
    @IBOutlet weak var HeaderTitle: UILabel!
    
    var requestType: String = ""
    var categoryId: Int? = 71

    @IBOutlet weak var profileView: UIImageView!
    @IBOutlet weak var totalAmount: UILabel!{
        didSet{
            totalAmount.text = "1 \(Constant.paymentMethod)"
        }
    }
    
    @IBOutlet weak var btnDonate1: UIButton!
    
    @IBOutlet weak var btnDonate5: UIButton!
    
    @IBOutlet weak var btnDonate10: UIButton!
    
    @IBOutlet weak var btnDonate20: UIButton!
    
    override func viewDidLoad()
    
    {
        super.viewDidLoad()

        otherAmount.myViewCornersTwo()
        AmountView.myViewCornersTwo()
        HeaderTitle.text = requestType.l10n()
        
        self.hideKeyboardWhenTappedAround()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.UserProfile))
        self.profileView.addGestureRecognizer(tap)
        self.profileView.isUserInteractionEnabled = true

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         setUpNavigationBar()
       // self.navigationController?.setNavigationBarHidden(false, animated: animated)

        otherAmount.addTarget(self, action: #selector(textFieldDidChange(_:)),
                                  for: .editingChanged)
        

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

    @objc func done() { // remove @objc for Swift 3
        print("click back button")
        //self.dismiss(animated: true,completion: nil)
        //self.navigationController?.popViewController(animated: true)
        navigationController?.popToRootViewController(animated: true)


    }
   
    @IBAction func donation(_ sender: Any) {
        let defaults = UserDefaults.standard
       // if defaults.isLoggedIn() {
            print("Working donation")
            let vc = PaymentWebView()
            vc.donationAmount = totalAmount.text ?? "1"
            vc.donationType = requestType
            vc.categoryId = categoryId
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
//        }else{
//            showAlertLogin(requestView: "DailySadaqaValueViewController", withMessage: "You need to login fast to complete donation"){_ in }
//
//        }
    }
    
//    @IBAction func menuClick(_ sender: Any) {
//
//    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
   //     self.dismiss(animated: false, completion: nil)
    }
    
    
    @IBAction func donate1(_ sender: Any) {
        totalAmount.text = "1 \(Constant.paymentMethod)"
        donationSelect(selectd: 1)
    }
    
    @IBAction func donate5(_ sender: Any) {
        totalAmount.text = "5 \(Constant.paymentMethod)"
        donationSelect(selectd: 2)

    }
    
    @IBAction func donate10(_ sender: Any) {
        totalAmount.text = "10 \(Constant.paymentMethod)"
        donationSelect(selectd: 3)

    }
    

    @IBAction func donate20(_ sender: Any) {
        totalAmount.text = "20 \(Constant.paymentMethod)"
        donationSelect(selectd: 4)

    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        totalAmount.text = (textField.text ?? "") + " \(Constant.paymentMethod)"

    }
    
    func donationSelect(selectd: Int){
        otherAmount.text = ""
        btnDonate1.setImage(UIImage(named: "donation_1_1"), for: .normal)
        btnDonate5.setImage(UIImage(named: "donation_5"), for: .normal)
        btnDonate10.setImage(UIImage(named: "donation_10"), for: .normal)
        btnDonate20.setImage(UIImage(named: "donation_20"), for: .normal)

        switch(selectd){
        case 1:
            btnDonate1.setImage(UIImage(named: "donation_1"), for: .normal)
            break
        case 2:
            btnDonate5.setImage(UIImage(named: "donation_5_1"), for: .normal)
            break
        case 3:
            btnDonate10.setImage(UIImage(named: "donation_10_2"), for: .normal)
            break
        case 4:
            btnDonate20.setImage(UIImage(named: "donation_20_2"), for: .normal)
            break

        default:
            btnDonate1.setImage(UIImage(named: "donation_1_1"), for: .normal)
            btnDonate5.setImage(UIImage(named: "donation_5"), for: .normal)
            btnDonate10.setImage(UIImage(named: "donation_10"), for: .normal)
            btnDonate20.setImage(UIImage(named: "donation_20"), for: .normal)
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
 
}
