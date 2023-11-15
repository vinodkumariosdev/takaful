//
//  LoginViewController.swift
//  Tafakul
//
//  Created by VinodKatta on 21/04/22.
//

import UIKit
import Alamofire
import L10n_swift

class LoginViewController: UIViewController {
    
    

    @IBOutlet weak var backButnn: UIButton!
    @IBOutlet weak var newUserLbl: UILabel!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var AccountLbl: UILabel!
    @IBOutlet weak var haveAnLbl: UILabel!
    @IBOutlet weak var AlreadyLbl: UILabel!
    @IBOutlet weak var loginMainView: UIView!
@IBOutlet weak var loginView:     UIView!
@IBOutlet weak var usernameView:  UIView!
@IBOutlet weak var passwordView:  UIView!
    
@IBOutlet weak var loginBtn:      UIButton!
@IBOutlet weak var newAccountBtn: UIButton!
@IBOutlet weak var quickBtn:      UIButton!
    
//    @IBOutlet weak var registerBtnImg: UIImageView!
    
    
    
    
    
    @IBOutlet weak var UsernameTF: UITextField!{
        didSet{
            
        }
    }
    
    @IBOutlet weak var passwordTF: UITextField!{
        didSet{
            
        }
    }
    
    var isRememberMe = false
    
    var requestView: String? = ""
    

    @IBOutlet weak var loginMobileNumberBtn: UIButton!
    
    override func viewDidLoad()
    
    {
        super.viewDidLoad()
         let bottomLine = CALayer()
         bottomLine.frame = CGRect(x: 0, y: UsernameTF.layer.frame.height-1, width: UsernameTF.frame.width, height: 1)
        bottomLine.backgroundColor = UIColor.init(hexString: "#3952A2").cgColor
        UsernameTF.borderStyle = .none
        UsernameTF.layer.addSublayer(bottomLine)
        
        let bottomLine1 = CALayer()
        bottomLine1.frame = CGRect(x: 0, y: passwordTF.layer.frame.height-1, width: passwordTF.frame.width, height: 1)
        bottomLine1.backgroundColor = UIColor.init(hexString: "#3952A2").cgColor
        passwordTF.borderStyle = .none
        passwordTF.layer.addSublayer(bottomLine1)
        
//        registerBtnImg.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
//        registerBtnImg.addGestureRecognizer(tapGesture)
        loginMobileNumberBtn.addTarget(self, action: #selector(loginBtnNumber), for: .touchUpInside)
//        registerBtnImg.isHidden = true
        loginMobileNumberBtn.isUserInteractionEnabled = true
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        newUserLbl.isUserInteractionEnabled = true
//        registerText.addGestureRecognizer(tapGesture)
        newUserLbl.addGestureRecognizer(tapGesture2)
    }
    
    @objc
    func moveToRegisterPage(sender:UITapGestureRecognizer){
        print("I am the label")
    }
    @objc func loginBtnNumber(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PhoneSignUpViewController") as! PhoneSignUpViewController
        vc.modalPresentationStyle = .fullScreen
//        vc.isfromLogin = "IsLogIn"
        self.present(vc, animated: true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        print(LocalizationSystem.sharedInstance.getLanguage())
        if LocalizationSystem.sharedInstance.getLanguage() == "ar"{
            
            
            self.UsernameTF.textAlignment = .left
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            self.passwordTF.textAlignment = .left
            emailLbl.text = "Email"
            passwordLbl.text = "Password"
            UsernameTF.placeholder = "Enter Username"
            passwordTF.placeholder = "Emter Password"
            loginBtn.setTitle("Login", for: .normal)
            AlreadyLbl.text = "Already"
            haveAnLbl.text = "Have An"
            AccountLbl.text = "Account ?"
            newUserLbl.text = "New User? Create An Account"
        }else{
            backButnn.setImage(UIImage.init(named: "ArabicBackIcon"), for: .normal)
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            self.UsernameTF.textAlignment = .right
            self.passwordTF.textAlignment = .right
            emailLbl.text = "البريد الإلكتروني"
            passwordLbl.text = "كلمة المرور"
            loginBtn.setTitle("تسجيل الدخول", for: .normal)
            UsernameTF.placeholder = "الرجاء إدخال اسم المستخدم"
            passwordTF.placeholder = "الرجاء إدخال كلمة المرور"
            AlreadyLbl.text = "لديك"
            haveAnLbl.text = "مسبقا"
            AccountLbl.text = "حساب ؟"
            newUserLbl.text = "مستخدم جديد؟ إنشاء حساب";
        }
    }
   
    
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true,completion: nil)
    }
    
    @objc func imageTapped() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController
        vc?.modalPresentationStyle = .fullScreen
        self.present(vc!, animated: true)
    }
    
    func ArabicSignUp(){
        loadinHubShowArabic()
        let Url = APIURL.login
            guard let serviceUrl = URL(string: Url) else { return }
        var paramtersArray = ["username": "\(UsernameTF.text!)", "password": "\(passwordTF.text!)","api_token":"WNi3oumvqu8ADhvWLqhPN18FhGplwwYgVYuWaHfrFInZcgI2J7o0obuWIIO5"] as! [String:Any]
        print("API RESPONSE")
        print(paramtersArray)
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
                            
                            let id = jsonArray["userId"] as! Int
                            print(id)
                            UserDefaults.standard.set(id, forKey: "id")
                            UserDefaults.standard.setLoggedIn(value: true)
                            UserDefaults.standard.setUserID(value: id)
                            self.loadinHubDismiss()
                            let alert = UIAlertController(title: "تم تسجيل الدخول بنجاح!", message:"".l10n(), preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "نعم".l10n(), style: .default, handler: {(_ action: UIAlertAction) -> Void in
                                Constant.isLoginView = true
                                let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                                vc.modalPresentationStyle = .fullScreen
                                self.present(vc, animated: true)
                            }))
                            
                            self.present(alert, animated: true, completion: nil)
                        }
                        
                        else
                        
                        {
                            self.loadinHubDismiss()
                            let alert = UIAlertController(title: "", message:"Password Not Matching", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Ok".l10n(), style: .default, handler: {(_ action: UIAlertAction) -> Void in
                            }))
                            
                            self.present(alert, animated: true, completion: nil)
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
        let Url = APIURL.login
            guard let serviceUrl = URL(string: Url) else { return }
        var paramtersArray = ["username": "\(UsernameTF.text!)", "password": "\(passwordTF.text!)","api_token":"WNi3oumvqu8ADhvWLqhPN18FhGplwwYgVYuWaHfrFInZcgI2J7o0obuWIIO5"] as! [String:Any]
            var request = URLRequest(url: serviceUrl)
            print("I am the real login")
            print(paramtersArray)
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
                            
                            let id = jsonArray["userId"] as! Int
                            print(id)
                            UserDefaults.standard.set(id, forKey: "id")
                            UserDefaults.standard.setLoggedIn(value: true)
                            UserDefaults.standard.setUserID(value: id)
                            self.loadinHubDismiss()
                            let alert = UIAlertController(title: "", message:"Login Successful".l10n(), preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Ok".l10n(), style: .default, handler: {(_ action: UIAlertAction) -> Void in
                                Constant.isLoginView = true
                                let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                                vc.modalPresentationStyle = .fullScreen
                                self.present(vc, animated: true)
                            }))
                            
                            self.present(alert, animated: true, completion: nil)
                        }
                        
                        else
                        
                        {
                            self.loadinHubDismiss()
                            let alert = UIAlertController(title: "", message:"Password Not Matching", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Ok".l10n(), style: .default, handler: {(_ action: UIAlertAction) -> Void in
                            }))
                            
                            self.present(alert, animated: true, completion: nil)
                        }
                    
                        }
                        
                         
                        
                    } catch {
                        print(error)
                    }
                }
            }.resume()
    }
    
    
   func LoginResponce(){
        
   //  Helper.showLoadingIndicator(view)
         var paramtersArray = ["username": "\(UsernameTF.text!)", "password": "\(passwordTF.text!)","api_token":"WNi3oumvqu8ADhvWLqhPN18FhGplwwYgVYuWaHfrFInZcgI2J7o0obuWIIO5"] as! [String:Any]
         let urlString  = APIURL.login
        print("API RESPONSE")
         print(paramtersArray)
         guard let url = URL(string: urlString) else {return}
         var request        = URLRequest(url: url)
         request.httpMethod = "POST"
         request.setValue("application/json", forHTTPHeaderField: "Content-Type")
         do {
             request.httpBody   = try JSONSerialization.data(withJSONObject: paramtersArray)
         } catch let error {
             print("Error : \(error.localizedDescription)")
         }
        AF.request(urlString
                   , method: .post, parameters:paramtersArray, encoding: URLEncoding.default, headers: nil).responseJSON { [self] (response:AFDataResponse<Any>) in
            switch(response.result) {
            case .success(_):
                do{
                    let model = try JSONDecoder().decode(JsonLogin.self, from: response.data!)
                    DispatchQueue.main.async {
                        var message = model.message
                        
                        let id = model.userId
                        print(id)

                        if message == "Login Successful"{
                            UserDefaults.standard.setLoggedIn(value: true)
                            UserDefaults.standard.setUserID(value: id ?? 0)
                            print(message)
                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                            let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
                            vc.modalPresentationStyle = .fullScreen
                            self.present(vc, animated: true, completion: nil)
                            self.dismiss(animated: true,completion: nil)

                    }else{
                        
                            let alert = UIAlertController(title: "", message:" Something went wrong", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(_ action: UIAlertAction) -> Void in
                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                            let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
                                 vc.modalPresentationStyle = .fullScreen
                                 self.present(vc, animated: true, completion: nil)
                        }))
                            
                         }
                     }
                    
                  }catch{
                      
                  }
                  break
              case .failure(_):
                
//                 let alertController = UIAlertController(title: "Patient Applicaion", message: "No Internet", preferredStyle: .alert)
//                 alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//                 alertController.presentInOwnWindow(animated: true, completion: {
//                 })
                  break
                  
              }
  }
       
       
     }
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func loginBtnAction(_ sender: Any)
    
    {
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            if UsernameTF.text == ""{
                let alert = UIAlertController(title: "", message: "ادخل اسم المستخدم!", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "نعم", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
               // UtilitiesAlert.showSimpleAlert(OnViewController: self, Message: "Enter MobileNumber")
            }else if passwordTF.text == ""{
                let alert = UIAlertController(title: "", message: "الرقم السري", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "نعم", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
               // UtilitiesAlert.showSimpleAlert(OnViewController: self, Message: "Enter Password")
            }else{
//                if isRememberMe{
                UserDefaults.standard.set(UsernameTF.text ?? "", forKey: "mobile")
                UserDefaults.standard.set(passwordTF.text ?? "", forKey: "password")
//                }else{
//                    UserDefaults.standard.removeObject(forKey: "mobile")
//                    UserDefaults.standard.removeObject(forKey: "password")
//
//                }
                self.ArabicSignUp()
            }

        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            if UsernameTF.text == ""{
                let alert = UIAlertController(title: "Alert", message: "Please Enter Usename", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
               // UtilitiesAlert.showSimpleAlert(OnViewController: self, Message: "Enter MobileNumber")
            }else if passwordTF.text == ""{
                let alert = UIAlertController(title: "Alert", message: "Please Enter Password", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
               // UtilitiesAlert.showSimpleAlert(OnViewController: self, Message: "Enter Password")
            }else{
                if isRememberMe{
                    UserDefaults.standard.set(UsernameTF.text ?? "", forKey: "mobile")
                    UserDefaults.standard.set(passwordTF.text ?? "", forKey: "password")
                }else{
                    UserDefaults.standard.removeObject(forKey: "mobile")
                    UserDefaults.standard.removeObject(forKey: "password")
                    
                }
                self.signUp()
            }

        }
        
    }
    
    @IBAction func newaccountBtn(_ sender: Any)
    
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
        self.present(vc, animated:true, completion:nil)
        //self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func quickdonationAction(_ sender: Any)
    
    {
     
        Constant.isQuickDonation = true
        
        let vc = self.storyboard?.instantiateViewController(identifier: "PhoneSignUpViewController") as! PhoneSignUpViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    

}
