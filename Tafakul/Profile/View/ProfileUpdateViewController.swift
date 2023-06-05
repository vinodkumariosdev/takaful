//
//  ProfileUpdateViewController.swift
//  Tafakul
//
//  Created by Tariqul on 21/10/22.
//

import Foundation
import L10n_swift

class ProfileUpdateViewController: UIViewController {

    var userProfile = [UserProfileData]()

    
    @IBOutlet weak var tfName: UITextField!
    
    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var tfPhoneNumber: UITextField!
    
    @IBOutlet weak var tfCountry: UITextField!
    
    @IBOutlet weak var tfCity: UITextField!
   
    @IBOutlet weak var profileTitle: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpNavigationBar()
        
        tfName.layer.borderWidth = 1.0
        tfEmail.layer.borderWidth = 1.0
        tfPhoneNumber.layer.borderWidth = 1.0
        tfCountry.layer.borderWidth = 1.0
        tfCity.layer.borderWidth = 1.0
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        useProfileData()
        { response in
            
            self.profileTitle.text = (response.first?.name ?? "") + " "+"Profile".l10n()
            print("Returned String Data is: \(response.count)")
            self.tfName.text = response.first?.name
            self.tfEmail.text = response.first?.email
            self.tfPhoneNumber.text = response.first?.phone
            self.tfCountry.text = response.first?.country
            self.tfCity.text = response.first?.city
            
          }
        
        self.hideKeyboardWhenTappedAround()

    }
    
    
    @IBAction func updateProfile(_ sender: Any) {
        useProfileUpdate(name:  self.tfName.text ?? "", email:  self.tfEmail.text ?? "", phone:  self.tfPhoneNumber.text ?? "", city:  self.tfCity.text ?? "", country:  self.tfCountry.text ?? "") { responce in
            self.showToast(message: "Successfully update".l10n(), font: .systemFont(ofSize: 13))
        }
    }
    
    
    @IBAction func donationData(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "DonationDetailsViewController")as! DonationDetailsViewController
        self.navigationController?.pushViewController(vc, animated: true)

    
    }
    @IBAction func backBtn(_ sender: Any) {
        ///self.dismiss(animated: true,completion: nil)
        self.navigationController?.popToRootViewController(animated: true)

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
