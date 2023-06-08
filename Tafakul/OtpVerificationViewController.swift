//
//  OtpVerificationViewController.swift
//  Tafakul
//
//  Created by apple on 07/06/23.
//

import UIKit
import Alamofire

class OtpVerificationViewController: UIViewController {

    @IBOutlet weak var verificationOtpLbl: UILabel!{
        didSet{
            verificationOtpLbl.text = "OTP \n  Verification"
        }
    }
    
    var MobileNumber:String!
    var otpNumber:Int!
    
    @IBOutlet weak var OTPTF: UITextField!{
        didSet{
            OTPTF.layer.cornerRadius = 10.0
            OTPTF.layer.masksToBounds = true
            OTPTF.layer.borderColor = UIColor.blue.cgColor
            OTPTF.layer.borderWidth = 1.0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.otpVerify()
    }
    
    func otpVerify(){
        if Reachability.isConnectedToNetwork(){
            let parameters = ["phone_no": "\(MobileNumber ?? "")", "api_token":"WNi3oumvqu8ADhvWLqhPN18FhGplwwYgVYuWaHfrFInZcgI2J7o0obuWIIO5"]
            print(parameters)
            AF.request("https://takafulsuhar.om/api/otp-login", method: .post, parameters: parameters, encoding: JSONEncoding.default)
                .responseJSON { [self] response in
                        switch response.result {
                        case .success(let json):
                            let response = json as! NSDictionary
                            print(response)
                            DispatchQueue.main.async {
                                let message = response["message"] as? String ?? ""
                                if message == "User added & OTP sent"{
                                    self.otpNumber = response["otp"] as? Int ?? 0
                                    print(self.otpNumber)
                                    let id = response["userId"] as? Int ?? 0
                                    print(id)
                                    UserDefaults.standard.set(id, forKey: "id")
                                    UserDefaults.standard.setUserID(value: id)
                                }else{
                                    self.otpNumber = response["otp"] as? Int ?? 0
                                    print(self.otpNumber)
                                    let id = response["userId"] as? Int ?? 0
                                    print(id)
                                    UserDefaults.standard.set(id, forKey: "id")
                                    UserDefaults.standard.setUserID(value: id)
                                }
                                
                            }
                             
                        case .failure(let error):
                            print(error)
                            let alert = UIAlertController(title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "", comment: ""), message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "Unable To Connect Server", comment: ""), preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "Ok", comment: ""), style: UIAlertAction.Style.default, handler: { action in
                                
                            }))
                            self.present(alert, animated: true, completion: nil)
                        }
                }
        }else{
            let alert = UIAlertController(title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "", comment: ""), message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "Ok", comment: "Please Check Internet Connection"), preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "Ok", comment: ""), style: UIAlertAction.Style.default, handler: { action in
            }))
            self.present(alert, animated: true, completion: nil)
        }

    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func verifyOtpbtn(_ sender: Any) {
        let otpField = String(otpNumber)
        if OTPTF.text == otpField{
            let alert = UIAlertController(title: "", message:"Otp verification Sent", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(_ action: UIAlertAction) -> Void in
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "", message:"otp and password don't match", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(_ action: UIAlertAction) -> Void in
                
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
