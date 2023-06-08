//
//  SignUpViewController.swift
//  Tafakul
//
//  Created by VinodKatta on 21/04/22.
//

import UIKit
import Alamofire
import L10n_swift

class SignUpViewController: UIViewController {
//
    @IBOutlet weak var SignUpViewUpside: UIView!
    @IBOutlet weak var MainBackView: UIView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var userNameView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var phoneNumber: UIView!
    @IBOutlet weak var countryView: UIView!
    @IBOutlet weak var cityView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var confirmPasswordView: UIView!
    @IBOutlet weak var signUpWithMobile: UIView!

    @IBOutlet weak var NameTF: UITextField!
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var EmailTF: UITextField!
    @IBOutlet weak var phoneNumberTF: UITextField!
    @IBOutlet weak var CountryTF: UITextField!
    @IBOutlet weak var CityTF: UITextField!
    @IBOutlet weak var PasswordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    
    
    @IBOutlet weak var signupBtn: UIButton!
    
    var isRememberMe = false
    
    @IBOutlet weak var yourLbl: UILabel!
    @IBOutlet weak var hereLbl: UILabel!
    @IBOutlet weak var backImg: UIImageView!
    @IBOutlet weak var firstStepLbl: UILabel!
    @IBOutlet weak var withUsLbl: UILabel!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var confirmPasswordLbl: UILabel!
    @IBOutlet weak var passwordLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: userNameTF.layer.frame.height-1, width: userNameTF.frame.width, height: 1)
        bottomLine.backgroundColor = UIColor.init(hexString: "#3952A2").cgColor
        userNameTF.borderStyle = .none
        userNameTF.layer.addSublayer(bottomLine)
        
        let bottomLine1 = CALayer()
        bottomLine1.frame = CGRect(x: 0, y: PasswordTF.layer.frame.height-1, width: PasswordTF.frame.width, height: 1)
        bottomLine1.backgroundColor = UIColor.init(hexString: "#3952A2").cgColor
        PasswordTF.borderStyle = .none
        PasswordTF.layer.addSublayer(bottomLine1)
        
        let bottomLine2 = CALayer()
        bottomLine2.frame = CGRect(x: 0, y: confirmPasswordTF.layer.frame.height-1, width: confirmPasswordTF.frame.width, height: 1)
        bottomLine2.backgroundColor = UIColor.init(hexString: "#3952A2").cgColor
        confirmPasswordTF.borderStyle = .none
        confirmPasswordTF.layer.addSublayer(bottomLine2)
        
        backImg.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        backImg.addGestureRecognizer(tapGesture)
        
      }
    
    override func viewWillAppear(_ animated: Bool) {
        if LocalizationSystem.sharedInstance.getLanguage() == "ar"{
            self.userNameTF.textAlignment = .left
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            self.userNameTF.textAlignment = .left
            self.PasswordTF.textAlignment = .left
            self.confirmPasswordTF.textAlignment = .left
            usernameLbl.text = "Username"
            passwordLbl.text = "Password"
            confirmPasswordLbl.text = "Confirm Password"
            userNameTF.placeholder = "Enter Username"
            PasswordTF.placeholder = "Emter Password"
            confirmPasswordTF.placeholder = "Confirm Password"
            signupBtn.setTitle("Register", for: .normal)
            hereLbl.text = "Here's"
            firstStepLbl.text = "first Step"
            withUsLbl.text = "With us!"
            yourLbl.text = "Your"
        }else{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            self.userNameTF.textAlignment = .right
            self.PasswordTF.textAlignment = .right
            self.confirmPasswordTF.textAlignment = .right
            usernameLbl.text = "اسم المستخدم"
            passwordLbl.text = "كلمة المرور"
            confirmPasswordLbl.text = "تأكيد كلمة المرور"
            userNameTF.placeholder = "اسم المستخدم"
            PasswordTF.placeholder = "كلمة المرور"
            confirmPasswordTF.placeholder = "تأكيد كلمة المرور"
            signupBtn.setTitle("يسجل", for: .normal)
            hereLbl.text = "هنا"
            firstStepLbl.text = "الخطوة الأولى"
            withUsLbl.text = "معنا!"
            yourLbl.text = "لك"
        }
    }
    
    
    @IBAction func mobileNumberAct(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MobileNumberViewController") as! MobileNumberViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @objc func checkAction() {

        let vc = self.storyboard?.instantiateViewController(identifier: "PhoneSignUpViewController") as! PhoneSignUpViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)       }
    
//    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    let vc = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
//         vc.modalPresentationStyle = .fullScreen
//         self.present(vc, animated: true, completion: nil)
//
    
    func ArabicSignUp(){
        loadinHubShowArabic()
        let Url = APIURL.register
            guard let serviceUrl = URL(string: Url) else { return }
                let paramtersArray =
                ["username":"\(userNameTF.text!)",
                 "password":"\(PasswordTF.text )",
                 "api_token":"WNi3oumvqu8ADhvWLqhPN18FhGplwwYgVYuWaHfrFInZcgI2J7o0obuWIIO5"] as! [String:Any]

           // let parameterDictionary = ["username" : "Test", "password" : "123456"]

            var request = URLRequest(url: serviceUrl)
            request.httpMethod = "POST"
            request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
            guard let httpBody = try? JSONSerialization.data(withJSONObject: paramtersArray, options: []) else {
                return
            }
            request.httpBody = httpBody

            let session = URLSession.shared
            session.dataTask(with: request) { (data, response, error) in
                if let response = response {
                    print(response)
                }
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        print(json)

                        let jsonArray = json as! [String:AnyObject]
                        let status = jsonArray["status"] as! String
                        DispatchQueue.main.async {
                        if status == "success"
                        {
                            self.loadinHubDismiss()
                            let alert = UIAlertController(title: "", message:"سجل بنجاح".l10n(), preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "نعم".l10n(), style: .default, handler: {(_ action: UIAlertAction) -> Void in
                                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                                     vc.modalPresentationStyle = .fullScreen
                                     self.present(vc, animated: true, completion: nil)
                            }))

                            self.present(alert, animated: true, completion: nil)
                        }

                        else

                        {

                            let alert = UIAlertController(title: "", message:"Something went wrong".l10n(), preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Ok".l10n(), style: .default, handler: {(_ action: UIAlertAction) -> Void in
                                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                let vc = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
                                     vc.modalPresentationStyle = .fullScreen
                                     self.present(vc, animated: true, completion: nil)
                            }))

                        }

                        }



                    } catch {
                        print(error)
                    }
                }
            }.resume()
    }
    
    func signUp(){
        loadinHubShow()
        let Url = APIURL.register
            guard let serviceUrl = URL(string: Url) else { return }
                let paramtersArray =
                ["username":"\(userNameTF.text!)",
                 "password":"\(PasswordTF.text )",
                 "api_token":"WNi3oumvqu8ADhvWLqhPN18FhGplwwYgVYuWaHfrFInZcgI2J7o0obuWIIO5"] as! [String:Any]

           // let parameterDictionary = ["username" : "Test", "password" : "123456"]

            var request = URLRequest(url: serviceUrl)
            request.httpMethod = "POST"
            request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
            guard let httpBody = try? JSONSerialization.data(withJSONObject: paramtersArray, options: []) else {
                return
            }
            request.httpBody = httpBody

            let session = URLSession.shared
            session.dataTask(with: request) { (data, response, error) in
                if let response = response {
                    print(response)
                }
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        print(json)

                        let jsonArray = json as! [String:AnyObject]
                        let status = jsonArray["status"] as! String
                        DispatchQueue.main.async {
                        if status == "success"
                        {
                            self.loadinHubDismiss()
                            let alert = UIAlertController(title: "", message:"Registration Successful".l10n(), preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Ok".l10n(), style: .default, handler: {(_ action: UIAlertAction) -> Void in
                                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                                     vc.modalPresentationStyle = .fullScreen
                                     self.present(vc, animated: true, completion: nil)
                            }))

                            self.present(alert, animated: true, completion: nil)
                        }

                        else

                        {

                            let alert = UIAlertController(title: "", message:"Something went wrong".l10n(), preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Ok".l10n(), style: .default, handler: {(_ action: UIAlertAction) -> Void in
                                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                let vc = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
                                     vc.modalPresentationStyle = .fullScreen
                                     self.present(vc, animated: true, completion: nil)
                            }))

                        }

                        }



                    } catch {
                        print(error)
                    }
                }
            }.resume()
    }


    @IBAction func signUpAction(_ sender: Any) {
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            if userNameTF.text == ""{
                let alert = UIAlertController(title: "".l10n(), message: "اسم المستخدم".l10n(), preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "نعم".l10n(), style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
               // UtilitiesAlert.showSimpleAlert(OnViewController: self, Message: "Enter MobileNumber")
            }else if PasswordTF.text == ""{
                let alert = UIAlertController(title: "".l10n(), message: "الرقم السري".l10n(), preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "نعم".l10n(), style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
               // UtilitiesAlert.showSimpleAlert(OnViewController: self, Message: "Enter Password")
            }
            else if confirmPasswordTF.text == ""{
                let alert = UIAlertController(title: "".l10n(), message: "تأكيد الرقم السري".l10n(), preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "نعم".l10n(), style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
               // UtilitiesAlert.showSimpleAlert(OnViewController: self, Message: "Enter Password")
            }
            else{
                if isRememberMe{
                    UserDefaults.standard.set(userNameTF.text ?? "", forKey: "mobile")
                    UserDefaults.standard.set(PasswordTF.text ?? "", forKey: "password")
                }else{
                    UserDefaults.standard.removeObject(forKey: "mobile")
                    UserDefaults.standard.removeObject(forKey: "password")

                }
                self.ArabicSignUp()
            }
            
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            if userNameTF.text == ""{
                let alert = UIAlertController(title: "Alert".l10n(), message: "Please Enter Username".l10n(), preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK".l10n(), style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
               // UtilitiesAlert.showSimpleAlert(OnViewController: self, Message: "Enter MobileNumber")
            }else if PasswordTF.text == ""{
                let alert = UIAlertController(title: "".l10n(), message: "Please Enter Password".l10n(), preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK".l10n(), style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
               // UtilitiesAlert.showSimpleAlert(OnViewController: self, Message: "Enter Password")
            }
            else if confirmPasswordTF.text == ""{
                let alert = UIAlertController(title: "Alert".l10n(), message: "Please Enter Confirm Password".l10n(), preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK".l10n(), style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
               // UtilitiesAlert.showSimpleAlert(OnViewController: self, Message: "Enter Password")
            }
            else{
                if isRememberMe{
                    UserDefaults.standard.set(userNameTF.text ?? "", forKey: "mobile")
                    UserDefaults.standard.set(PasswordTF.text ?? "", forKey: "password")
                }else{
                    UserDefaults.standard.removeObject(forKey: "mobile")
                    UserDefaults.standard.removeObject(forKey: "password")

                }
                self.signUp()
            }
        }
        
        

    }


    @objc func imageTapped() {
        self.dismiss(animated: true)
    }



}


