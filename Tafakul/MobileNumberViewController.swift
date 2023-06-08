//
//  MobileNumberViewController.swift
//  Tafakul
//
//  Created by apple on 07/06/23.
//

import UIKit

class MobileNumberViewController: UIViewController {
    
    var isfromLogin:String!

    @IBOutlet weak var mobileNumberLbl: UILabel!
    
    @IBOutlet weak var mobileNumberTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if isfromLogin == ""{
            self.mobileNumberLbl.text = "Sign In \n Mobile Number"
        }else{
            self.mobileNumberLbl.text = "Sign Up \n Mobile Number"
        }
        
        self.mobileNumberTF.addBottomBorderLineWithColor(color: .lightGray, width: 1.0)
    }
    

    @IBAction func dismissBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func signInBtnAction(_ sender: Any) {
        if mobileNumberTF.text == ""{
            let alert = UIAlertController(title: "", message:"Please Enter Mobile Number", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(_ action: UIAlertAction) -> Void in
                
            }))
            self.present(alert, animated: true, completion: nil)
        }else{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "OtpVerificationViewController") as! OtpVerificationViewController
            vc.modalPresentationStyle = .fullScreen
            vc.MobileNumber = mobileNumberTF.text!
            self.present(vc, animated: true)
        }
        
    }
}


extension UIView{
    func addBottomBorderLineWithColor(color:UIColor, width:CGFloat){
        let bottomOrderline = CALayer()
        bottomOrderline.backgroundColor = color.cgColor
        bottomOrderline.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        self.layer.addSublayer(bottomOrderline)
    }
}
