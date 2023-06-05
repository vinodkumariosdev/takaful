//
//  ContributeVC.swift
//  Tafakul
//
//  Created by apple on 22/12/22.
//

import UIKit

class ContributeVC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var titleLbl: UILabel!
    
    var titleText:String!
    
    @IBOutlet weak var RupeeBtn: UIButton!
    
    @IBOutlet weak var fiveRupeeBtn: UIButton!
    
    @IBOutlet weak var tenRupeeBtn: UIButton!
    
    @IBOutlet weak var twentyRupeeBtn: UIButton!
    
    @IBOutlet weak var amountTF: UITextField!
    
    @IBOutlet weak var DonateNowBtn: UIButton!
    
    var amountValue:String?
    
    @IBOutlet weak var totalAmtTF: UITextField!{
        didSet{
            totalAmtTF.isUserInteractionEnabled = false
        }
    }
    
    var id:Int!
    
    @IBOutlet weak var amountlbl: UILabel!
    
    var amount:String!
    
    var userid:String!
    
    @IBOutlet weak var donationAmtlbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            userid = UserDefaults.standard.string(forKey: "id")
            amountTF.delegate = self
            amount = "1"
            let totalAmounts = "المبالغ الإجمالية"
            amountlbl.text = "\(totalAmounts) \(amount ?? "") ر.عر.ع"
            donationAmtlbl.text = "اختر مبلغ التبرع"
            self.titleLbl.text = titleText
            self.DonateNowBtn.setTitle("تبرع الآن", for: .normal)
            RupeeBtn.addTarget(self, action: #selector(RupeeAction), for: .touchUpInside)
            tenRupeeBtn.addTarget(self, action: #selector(tenAction), for: .touchUpInside)
            fiveRupeeBtn.addTarget(self, action: #selector(fiveAction), for: .touchUpInside)
            twentyRupeeBtn.addTarget(self, action: #selector(TwentyAction), for: .touchUpInside)
            self.DonateNowBtn.addTarget(self, action: #selector(donateNowBtn), for: .touchUpInside)
            amountTF.textAlignment = .right
            totalAmtTF.textAlignment = .right
            amountTF.placeholder = "الرجاء إدخال المبلغ"
            totalAmtTF.placeholder = ""
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            userid = UserDefaults.standard.string(forKey: "id")
            amountTF.delegate = self
            donationAmtlbl.text = "Select Donation Amount"
            DonateNowBtn.setTitle("Donate Now", for: .normal)
            amount = "1"
            amountlbl.text = "Total Amount 1 OMR"
            amountTF.textAlignment = .left
            totalAmtTF.textAlignment = .left
            amountTF.placeholder = "Please Enter Amount"
            totalAmtTF.placeholder = ""
            self.titleLbl.text = titleText
            RupeeBtn.addTarget(self, action: #selector(RupeeAction), for: .touchUpInside)
            tenRupeeBtn.addTarget(self, action: #selector(tenAction), for: .touchUpInside)
            fiveRupeeBtn.addTarget(self, action: #selector(fiveAction), for: .touchUpInside)
            twentyRupeeBtn.addTarget(self, action: #selector(TwentyAction), for: .touchUpInside)
            self.DonateNowBtn.addTarget(self, action: #selector(donateNowBtn), for: .touchUpInside)
        }
        
    }
    
    @objc func RupeeAction(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            amountTF.text = ""
            self.amount = "1"
            let totalAmounts = "المبالغ الإجمالية"
            amountlbl.text = "\(totalAmounts) \(amount ?? "") ر.عر.ع"
            RupeeBtn.setImage(UIImage(named: "donation_1"), for: UIControl.State.normal)
            fiveRupeeBtn.setImage(UIImage(named: "donation_5"), for: UIControl.State.normal)
            tenRupeeBtn.setImage(UIImage(named: "donation_10"), for: UIControl.State.normal)
            twentyRupeeBtn.setImage(UIImage(named: "donation_20"), for: UIControl.State.normal)
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            amountTF.text = ""
            self.amount = "1"
            amountlbl.text = "Total Amount 1 OMR"
            RupeeBtn.setImage(UIImage(named: "donation_1"), for: UIControl.State.normal)
            fiveRupeeBtn.setImage(UIImage(named: "donation_5"), for: UIControl.State.normal)
            tenRupeeBtn.setImage(UIImage(named: "donation_10"), for: UIControl.State.normal)
            twentyRupeeBtn.setImage(UIImage(named: "donation_20"), for: UIControl.State.normal)
        }
        
    }

    @objc func fiveAction(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            amountTF.text = ""
            self.amount = "5"
            let totalAmounts = "المبالغ الإجمالية"
            amountlbl.text = "\(totalAmounts) \(amount ?? "") ر.عر.ع"
            RupeeBtn.setImage(UIImage(named: "donation_1_1"), for: UIControl.State.normal)
            fiveRupeeBtn.setImage(UIImage(named: "donation_5_1"), for: UIControl.State.normal)
            tenRupeeBtn.setImage(UIImage(named: "donation_10"), for: UIControl.State.normal)
            twentyRupeeBtn.setImage(UIImage(named: "donation_20"), for: UIControl.State.normal)
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            amountTF.text = ""
            self.amount = "5"
            amountlbl.text = "Total Amount 5 OMR"
            RupeeBtn.setImage(UIImage(named: "donation_1_1"), for: UIControl.State.normal)
            fiveRupeeBtn.setImage(UIImage(named: "donation_5_1"), for: UIControl.State.normal)
            tenRupeeBtn.setImage(UIImage(named: "donation_10"), for: UIControl.State.normal)
            twentyRupeeBtn.setImage(UIImage(named: "donation_20"), for: UIControl.State.normal)
        }
        
    }
    
    @objc func tenAction(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            amountTF.text = ""
            self.amount = "10"
            let totalAmounts = "المبالغ الإجمالية"
            amountlbl.text = "\(totalAmounts) \(amount ?? "") ر.عر.ع"
            RupeeBtn.setImage(UIImage(named: "donation_1_1"), for: UIControl.State.normal)
            fiveRupeeBtn.setImage(UIImage(named: "donation_5"), for: UIControl.State.normal)
            tenRupeeBtn.setImage(UIImage(named: "donation_10_2"), for: UIControl.State.normal)
            twentyRupeeBtn.setImage(UIImage(named: "donation_20"), for: UIControl.State.normal)
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            amountTF.text = ""
            self.amount = "10"
            amountlbl.text = "Total Amount 10 OMR"
            RupeeBtn.setImage(UIImage(named: "donation_1_1"), for: UIControl.State.normal)
            fiveRupeeBtn.setImage(UIImage(named: "donation_5"), for: UIControl.State.normal)
            tenRupeeBtn.setImage(UIImage(named: "donation_10_2"), for: UIControl.State.normal)
            twentyRupeeBtn.setImage(UIImage(named: "donation_20"), for: UIControl.State.normal)
        }
        
    }
    
    @objc func TwentyAction(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            amountTF.text = ""
            self.amount = "20"
            let totalAmounts = "المبالغ الإجمالية"
            amountlbl.text = "\(totalAmounts) \(amount ?? "") ر.عر.ع"
            RupeeBtn.setImage(UIImage(named: "donation_1_1"), for: UIControl.State.normal)
            fiveRupeeBtn.setImage(UIImage(named: "donation_5"), for: UIControl.State.normal)
            tenRupeeBtn.setImage(UIImage(named: "donation_10"), for: UIControl.State.normal)
            twentyRupeeBtn.setImage(UIImage(named: "donation_20_2"), for: UIControl.State.normal)
            
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            amountTF.text = ""
            self.amount = "20"
            amountlbl.text = "Total Amount 20 OMR"
            RupeeBtn.setImage(UIImage(named: "donation_1_1"), for: UIControl.State.normal)
            fiveRupeeBtn.setImage(UIImage(named: "donation_5"), for: UIControl.State.normal)
            tenRupeeBtn.setImage(UIImage(named: "donation_10"), for: UIControl.State.normal)
            twentyRupeeBtn.setImage(UIImage(named: "donation_20_2"), for: UIControl.State.normal)
        }
        
    }
    
     @IBAction func backBtn(_ sender: Any) {
         dismiss(animated: true,completion: nil)
     }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            if textField == self.amountTF{
                RupeeBtn.setImage(UIImage(named: "donation_1_1"), for: UIControl.State.normal)
                fiveRupeeBtn.setImage(UIImage(named: "donation_5"), for: UIControl.State.normal)
                tenRupeeBtn.setImage(UIImage(named: "donation_10"), for: UIControl.State.normal)
                twentyRupeeBtn.setImage(UIImage(named: "donation_20"), for: UIControl.State.normal)
                amountValue = amountTF.text!
                let totalAmounts = "المبالغ الإجمالية"
                amountlbl.text = "\(totalAmounts) \(amountValue ?? "") ر.عر.ع"
            }
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            if textField == self.amountTF{
                RupeeBtn.setImage(UIImage(named: "donation_1_1"), for: UIControl.State.normal)
                fiveRupeeBtn.setImage(UIImage(named: "donation_5"), for: UIControl.State.normal)
                tenRupeeBtn.setImage(UIImage(named: "donation_10"), for: UIControl.State.normal)
                twentyRupeeBtn.setImage(UIImage(named: "donation_20"), for: UIControl.State.normal)
                amountValue = amountTF.text!
                amountlbl.text = "Total amount \(amountValue ?? "") OMR"
            }
        }
        
    }
    
    @objc func donateNowBtn(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            if userid == nil{
                let alert = UIAlertController(title: "", message:"تحتاج إلى تسجيل الدخول لعرض تفاصيل التبرع.".l10n(), preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "نعم".l10n(), style: .default, handler: {(_ action: UIAlertAction) -> Void in
                    Constant.isLoginView = true
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }))
                
                self.present(alert, animated: true, completion: nil)
            }else{
                if amountTF.text == nil{
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
                    vc.cartID = id
                    vc.amount = amount
                    print(amount)
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }else if amountTF.text == ""{
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
                    vc.cartID = id
                    vc.amount = amount
                    print(amount)
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }else{
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
                    vc.cartID = id
                    vc.amount = amountValue ?? ""
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }
            }
            
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            if userid == nil{
                let alert = UIAlertController(title: "", message:"Please Login For Accessing Donate".l10n(), preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok".l10n(), style: .default, handler: {(_ action: UIAlertAction) -> Void in
                    Constant.isLoginView = true
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }))
                
                self.present(alert, animated: true, completion: nil)
            }else{
                if amountTF.text == nil{
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
                    vc.cartID = id
                    vc.amount = amount
                    print(amount)
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }else if amountTF.text == ""{
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
                    vc.cartID = id
                    vc.amount = amount
                    print(amount)
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }else{
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
                    vc.cartID = id
                    vc.amount = amountValue ?? ""
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }
            }
        }
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.amountTF.text = ""
    }

}
