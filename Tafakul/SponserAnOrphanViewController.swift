//
//  SponserAnOrphanViewController.swift
//  Tafakul
//
//  Created by VinodKatta on 22/06/22.
//

import UIKit
import L10n_swift

class SponserAnOrphanViewController: UIViewController {

    @IBOutlet weak var sponserAmountC: UITextField!
    @IBOutlet weak var totalAmountC: UIView!
    @IBOutlet weak var donateNowC: UIButton!
    
    @IBOutlet weak var totalAmount: UILabel!{
        didSet{
            totalAmount.text = "25 \(Constant.paymentMethod)"
        }
    }
    var categoryId: Int? = 71

    var requestType: String = ""

    @IBOutlet weak var openYears: UITextField!
    
    @IBOutlet weak var sponserShipAmount: UITextField!
    
    var ammount: Int = 1
    var selectedAmount: Int = 25
    var years: Int = 1


    @IBOutlet weak var userProfile: UIImageView!
    
    @IBOutlet weak var donationBtn25: UIButton!
    
    @IBOutlet weak var donationBtn50: UIButton!
    
    @IBOutlet weak var donation75: UIButton!
    
    @IBOutlet weak var donation100: UIButton!
    
    
    @IBOutlet weak var btnAYear: UIButton!
    
    @IBOutlet weak var btn2Years: UIButton!
    
    @IBOutlet weak var btnOpen: UIButton!
    
    
    @IBOutlet weak var labelTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sponserAmountC.myViewCornersTwo()
        totalAmountC.myViewCornersTwo()
        donateNowC.myViewCornersTwo()
        openYears.myViewCorners()
        
        sponserShipAmount.addTarget(self, action: #selector(textFieldDidChange(_:)),
                                  for: .editingChanged)
        openYears.addTarget(self, action: #selector(textopenYearsFieldDidChange(_:)),
                                  for: .editingChanged)

        self.hideKeyboardWhenTappedAround()
        labelTitle.text = requestType.l10n()
        
        self.userProfile.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.UserProfile))
        self.userProfile.addGestureRecognizer(tap)
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
    @IBAction func donation(_ sender: Any) {
        let defaults = UserDefaults.standard
       // if defaults.isLoggedIn() {
            print("Working donation")
            let vc = PaymentWebView()
            vc.donationAmount = String(ammount)
            vc.categoryId = categoryId
            vc.donationType = requestType
            
            print("donation \(ammount)  \(requestType)")

            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
//        }else{
//            showAlertLogin(requestView: "SponserAnOrphanView", withMessage: "Do you want to login?")
        
       // }
    }
    
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        let amount = Int(sponserShipAmount.text ?? "0")
        selectedAmount = amount ?? 0
        ammount = selectedAmount * years
        totalAmount.text =  "\(ammount) \(Constant.paymentMethod)"
    }
    @objc func textopenYearsFieldDidChange(_ textField: UITextField) {

        let openYears = Int(openYears.text ?? "0")
        years = openYears ?? 0
        ammount = selectedAmount * years
        totalAmount.text =  "\(ammount) \(Constant.paymentMethod)"

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpNavigationBar()

    }
    
    @IBAction func baskBtn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func donation25(_ sender: Any) {
        selectedAmount = 25
        ammount = selectedAmount * years
        sponserShipAmount.text = ""
        totalAmount.text = "\(ammount) \(Constant.paymentMethod)"
        donationSelect(selectd: 1)
    }
    
    @IBAction func donatio50(_ sender: Any) {
        ammount = 50
        selectedAmount = 50
        ammount = selectedAmount * years
        totalAmount.text = "\(ammount) \(Constant.paymentMethod)"
        donationSelect(selectd: 2)
        sponserShipAmount.text = ""



    }
    
    @IBAction func donation75(_ sender: Any) {
        ammount = 75
        selectedAmount =  75
        ammount = selectedAmount * years
        totalAmount.text = "\(ammount) \(Constant.paymentMethod)"
        donationSelect(selectd: 3)
        sponserShipAmount.text = ""

    }
    @IBAction func donation100(_ sender: Any) {
        ammount = 100
        selectedAmount =  100
        ammount = selectedAmount * years
        totalAmount.text = "\(ammount) \(Constant.paymentMethod)"
        donationSelect(selectd: 4)
    }
    
    
    @IBAction func aYear(_ sender: Any) {
        openYears.isHidden = true
        years = 1
        openYears.text = ""
        ammount = selectedAmount * years
        totalAmount.text = "\(ammount) \(Constant.paymentMethod)"
        yearSelect(selectd: 1)
        self.view.layoutIfNeeded()

    }
    
    @IBAction func Year(_ sender: Any) {
        openYears.isHidden = true
        years = 2

        ammount =  selectedAmount * years
        openYears.text = ""
        totalAmount.text = "\(ammount) \(Constant.paymentMethod)"
        yearSelect(selectd: 2)
        self.view.layoutIfNeeded()


    }
    
    @IBAction func openYears(_ sender: Any) {
        openYears.isHidden = false
        let openYears = Int(openYears.text ?? "0")
        years = openYears ?? 0
        ammount =  selectedAmount * years

        totalAmount.text = "\(ammount) \(Constant.paymentMethod)"
        yearSelect(selectd: 3)
        self.view.layoutIfNeeded()


    }
    
    func donationSelect(selectd: Int){
        donationBtn25.setImage(UIImage(named: "donation_25"), for: .normal)
        donationBtn50.setImage(UIImage(named: "donation_50"), for: .normal)
        donation75.setImage(UIImage(named: "donation_75"), for: .normal)
        donation100.setImage(UIImage(named: "donation_100"), for: .normal)
        switch(selectd){
        case 1:
            donationBtn25.setImage(UIImage(named: "donation_25_2"), for: .normal)
            break
        case 2:
            donationBtn50.setImage(UIImage(named: "donation_50_2"), for: .normal)
            break
        case 3:
            donation75.setImage(UIImage(named: "donation_75_2"), for: .normal)
            break
        case 4:
            donation100.setImage(UIImage(named: "donation_100_2"), for: .normal)
            break
            
        default:
  
            break
            
        }
    }
    func yearSelect(selectd: Int){
        btnAYear.setImage(UIImage(named: "year_1"), for: .normal)
        btn2Years.setImage(UIImage(named: "2year"), for: .normal)
        btnOpen.setImage(UIImage(named: "open"), for: .normal)
        
        
        switch(selectd){
        case 1:
            btnAYear.setImage(UIImage(named: "year"), for: .normal)
            break
        case 2:
            btn2Years.setImage(UIImage(named: "2year_3x"), for: .normal)
            break
            
        case 3:
            btnOpen.setImage(UIImage(named: "open_1"), for: .normal)
            break
        default:
            btnAYear.setImage(UIImage(named: "year"), for: .normal)
            btn2Years.setImage(UIImage(named: "2year"), for: .normal)
            btnOpen.setImage(UIImage(named: "open"), for: .normal)
            
            break
            
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
