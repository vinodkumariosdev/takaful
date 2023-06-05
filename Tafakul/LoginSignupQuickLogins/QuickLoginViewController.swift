//
//  QuickLoginViewController.swift
//  Tafakul
//
//  Created by VinodKatta on 21/04/22.
//

import UIKit

class QuickLoginViewController: UIViewController {
    
    @IBOutlet weak var quickMainDonation: UIView!
    @IBOutlet weak var quickDonationView: UIView!
    
    @IBOutlet weak var usernameViewQuick: UIView!
    @IBOutlet weak var passwordViewQuick: UIView!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quickMainDonation.myViewCorners()
        quickDonationView.roundTop()
        
        usernameViewQuick.myViewCornersTwo()
        passwordViewQuick.myViewCornersTwo()
      //loginBtn.myViewCornersnoColor()
        self.hideKeyboardWhenTappedAround()

    }
    
    
    func QuickDonationResponse(){
        
        let Url = APIURL.register
            guard let serviceUrl = URL(string: Url) else { return }
                let paramtersArray =
                ["mobile_no":"\(usernameTF.text!)",
                 "amount":"\(passwordTF.text!)",
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
                            let alert = UIAlertController(title: "", message:"Registration Successful", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(_ action: UIAlertAction) -> Void in
                                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                let vc = storyboard.instantiateViewController(withIdentifier: "SWRevealViewController")
                                     vc.modalPresentationStyle = .fullScreen
                                     self.present(vc, animated: true, completion: nil)
                            }))
                            
                            self.present(alert, animated: true, completion: nil)
                        }
                        
                        else
                        
                        {
                            
                            let alert = UIAlertController(title: "", message:" Something went wrong", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(_ action: UIAlertAction) -> Void in
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
    
    
    
    
    @IBAction func QuickDonationBTN(_ sender: Any) {
        
    }
    @IBAction func backBtn(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated:true, completion:nil)
    }
    

    

}
