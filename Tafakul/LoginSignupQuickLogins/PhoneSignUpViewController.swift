//
//  PhoneSignUpViewController.swift
//  Tafakul
//
//  Created by Tariqul on 10/10/22.
//


import UIKit
import Alamofire

class PhoneSignUpViewController: UIViewController {
//
    @IBOutlet weak var SignUpViewUpside: UIView!
    @IBOutlet weak var MainBackView: UIView!
    @IBOutlet weak var nameView: UIView!

    @IBOutlet weak var signUpTitle: UILabel!
    
    @IBOutlet weak var mobileNumber: UITextField!
    @IBOutlet weak var signupBtn: UIButton!
    var activityView: UIActivityIndicatorView?

    var number : String = ""
    var otp : String = ""
    var isClick :Bool = false

    var isRememberMe = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SignUpViewUpside.roundTop()
        MainBackView.myViewCorners()
        nameView.myViewCorners()
        signupBtn.myViewCorners()
        
        self.hideKeyboardWhenTappedAround()
        
     /*   if(Constant.isQuickDonation){
            signupBtn.setTitle("Login".l10n(), for: .normal)
            signUpTitle.text = "Login with mobile".l10n()
        }else{
            signupBtn.setTitle("Signup".l10n(), for: .normal)
            signUpTitle.text = "Signup with mobile".l10n()
        }*/

      }
    
    override func viewWillDisappear(_ animated: Bool) {
        Constant.isQuickDonation = false

    }
    @IBAction func signUpWithMobile(_ sender: Any) {
        if isClick {
   
            otp = mobileNumber.text ?? ""
            
            if(otp.isEmpty){
                let alert = UIAlertController(title: "", message:"Please type otp".l10n(), preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok".l10n(), style: .default, handler: {(_ action: UIAlertAction) -> Void in
                    alert.dismiss(animated: true)
                }))

                self.present(alert, animated: true, completion: nil)
            }else{
                signUp()
            }
        }else{
            number = mobileNumber.text ?? ""
            
          
            if(number.count > 6){
                sendOTP()
               
            }else{
                let alert = UIAlertController(title: "", message:"Please type correct number".l10n(), preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok".l10n(), style: .default, handler: {(_ action: UIAlertAction) -> Void in
                    alert.dismiss(animated: true)
                }))

                self.present(alert, animated: true, completion: nil)
            }
        }
        
       
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true,completion: nil)
    }
    
    func signUp(){
        self.showActivityIndicator()
        let Url = APIURL.phoneLogin
            guard let serviceUrl = URL(string: Url) else { return }
                let paramtersArray =
                ["phone_no": number,
                 "otp": otp,
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
                self.hideActivityIndicator()
                if let response = response {
                    print(response)
                }
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        print(json)

                        let jsonArray = json as! [String:AnyObject]
                        let status = jsonArray["status"] as! String
                        let message = jsonArray["message"] as! String

                        DispatchQueue.main.async {
                        if status == "success"
                        {
                            if ( Constant.isQuickDonation){

                                UserDefaults.standard.setLoggedIn(value: true)
                                
                                let alert = UIAlertController(title: "", message:"Login Successful".l10n(), preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "Ok".l10n(), style: .default, handler: {(_ action: UIAlertAction) -> Void in
                                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                    let vc = storyboard.instantiateViewController(withIdentifier: "SWRevealViewController")
                                         vc.modalPresentationStyle = .fullScreen
                                         self.present(vc, animated: true, completion: nil)
                                }))
                                self.present(alert, animated: true, completion: nil)
                            }else{
                             
                                    UserDefaults.standard.setLoggedIn(value: true)
                            
                                let alert = UIAlertController(title: "", message:"Registration Successful".l10n(), preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "Ok".l10n(), style: .default, handler: {(_ action: UIAlertAction) -> Void in
                                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                    let vc = storyboard.instantiateViewController(withIdentifier: "SWRevealViewController")
                                         vc.modalPresentationStyle = .fullScreen
                                         self.present(vc, animated: true, completion: nil)
                                }))
                                self.present(alert, animated: true, completion: nil)
                                
                            }
                           
                           
                            
                         

                          
                        }

                        else

                        {

                            let alert = UIAlertController(title: "", message:message, preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Ok".l10n(), style: .default, handler: {(_ action: UIAlertAction) -> Void in
                                alert.dismiss(animated: true)
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


    func sendOTP(){
        self.showActivityIndicator()
        let Url = APIURL.sendOTPphone
            guard let serviceUrl = URL(string: Url) else { return }
                let paramtersArray =
                ["phone_no": number,
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
                
                self.hideActivityIndicator()
                if let response = response {
                    print(response)
                }
                if let data = data {
                    do {
                        
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        print(json)

                        let jsonArray = json as! [String:AnyObject]
                        let status = jsonArray["status"] as! String
                        let message = jsonArray["message"] as! String
                        let otp = jsonArray["otp"] as! Int

                        DispatchQueue.main.async {
                        if status == "success"
                        {
                            self.signupBtn.setTitle("Verify".l10n(), for: .normal)
                            self.mobileNumber.placeholder = "Enter OTP".l10n()
                            self.signUpTitle.text = "OTP Verification".l10n()
                            self.mobileNumber.text = ""
                            self.isClick = true

                            if (Constant.isQuickDonation){
                                let userId = jsonArray["userId"] as! Int
                                    UserDefaults.standard.setUserID(value: userId)
                                
                            }else{
                                let user_id = jsonArray["user_id"] as! Int
                                UserDefaults.standard.setUserID(value: user_id)
                                
                            }
                            let alert = UIAlertController(title: "", message: "OTP send to your number, please check".l10n(), preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(_ action: UIAlertAction) -> Void in
                                alert.dismiss(animated: true)
                            }))
                            self.present(alert, animated: true, completion: nil)
                            
                        }
                        else
                        {
                            self.isClick = false
                           
                            let alert = UIAlertController(title: "", message:message, preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(_ action: UIAlertAction) -> Void in
                                alert.dismiss(animated: true)
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
    
    func showActivityIndicator() {
        activityView = UIActivityIndicatorView(style: .large)
        activityView?.center = self.view.center
        self.view.addSubview(activityView!)
        activityView?.startAnimating()
    }

    func hideActivityIndicator(){
        if (activityView != nil){
            DispatchQueue.main.async {
                self.activityView?.stopAnimating()
            }
           
        }
    }
}


