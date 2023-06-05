//
//  InitiativeVC.swift
//  Tafakul
//
//  Created by apple on 22/12/22.
//

import UIKit

class InitiativeVC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var amountTF: UITextField!
    
    @IBOutlet weak var fiveBtn: UIButton!
    
    @IBOutlet weak var tenBtn: UIButton!
    
    @IBOutlet weak var oneBtn: UIButton!
    
    @IBOutlet weak var twentyBtn: UIButton!
    
    var titleText:String!
    
    @IBOutlet weak var selectDonationAmtLbl: UILabel!
    
    @IBOutlet weak var totalAmtTF: UITextField!
    
    var id:Int!
    
    var amount:String!
    
    var userid:String!
    
    var foodAmtlbl:String!
    
    @IBOutlet weak var donateNowBtn: UIButton!
    
    @IBOutlet weak var amountLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            amountTF.delegate = self
            userid = UserDefaults.standard.string(forKey: "id")
            amount = "1"
            let totalAmounts = "المبلغ الإجمالي"
            self.amountLbl.text = "\(totalAmounts) 1 ر.ع"
            foodAmtlbl = "1"
            self.titleLbl.text = titleText
            oneBtn.addTarget(self, action: #selector(RupeeAction), for: .touchUpInside)
            tenBtn.addTarget(self, action: #selector(tenAction), for: .touchUpInside)
            fiveBtn.addTarget(self, action: #selector(fiveAction), for: .touchUpInside)
            twentyBtn.addTarget(self, action: #selector(TwentyAction), for: .touchUpInside)
            self.donateNowBtn.setTitle("تبرع الآن", for: .normal)
            selectDonationAmtLbl.text = "اختر مبلغ التبرع"
            self.totalAmtTF.isUserInteractionEnabled = false
            amountTF.textAlignment = .right
            totalAmtTF.textAlignment = .right
            amountTF.placeholder = "الرجاء إدخال المبلغ"
            totalAmtTF.placeholder = ""
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            amountTF.delegate = self
            amountTF.textAlignment = .left
            totalAmtTF.textAlignment = .left
            amountTF.placeholder = ""
            totalAmtTF.placeholder = ""
            donateNowBtn.setTitle("Donate Now", for: .normal)
            userid = UserDefaults.standard.string(forKey: "id")
            amount = "1"
            self.amountLbl.text = "Total amounts 1 OMR"
            foodAmtlbl = "1"
            amountTF.placeholder = "Please Enter Amount"
            self.titleLbl.text = titleText
            oneBtn.addTarget(self, action: #selector(RupeeAction), for: .touchUpInside)
            tenBtn.addTarget(self, action: #selector(tenAction), for: .touchUpInside)
            fiveBtn.addTarget(self, action: #selector(fiveAction), for: .touchUpInside)
            twentyBtn.addTarget(self, action: #selector(TwentyAction), for: .touchUpInside)
            self.totalAmtTF.isUserInteractionEnabled = false
            selectDonationAmtLbl.text = "Select Donation Amount"
        }
        
    }
    
    @objc func RupeeAction(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            amountTF.text = ""
            let totalAmounts = "المبلغ الإجمالي"
            self.amount = "1"
            oneBtn.setImage(UIImage(named: "donation_1"), for: UIControl.State.normal)
            fiveBtn.setImage(UIImage(named: "donation_5"), for: UIControl.State.normal)
            tenBtn.setImage(UIImage(named: "donation_10"), for: UIControl.State.normal)
            twentyBtn.setImage(UIImage(named: "donation_20"), for: UIControl.State.normal)
            self.amountLbl.text = "\(totalAmounts) 1 ر.ع"
            foodAmtlbl = "1"
        }else{
            amountTF.text = ""
            self.amount = "1"
            oneBtn.setImage(UIImage(named: "donation_1"), for: UIControl.State.normal)
            fiveBtn.setImage(UIImage(named: "donation_5"), for: UIControl.State.normal)
            tenBtn.setImage(UIImage(named: "donation_10"), for: UIControl.State.normal)
            twentyBtn.setImage(UIImage(named: "donation_20"), for: UIControl.State.normal)
            self.amountLbl.text = "Total amounts 1 OMR"
            foodAmtlbl = "1"
        }
        
    }

    @objc func fiveAction(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            let totalAmounts = "المبلغ الإجمالي"
            amountTF.text = ""
            self.amount = "5"
            oneBtn.setImage(UIImage(named: "donation_1_1"), for: UIControl.State.normal)
            fiveBtn.setImage(UIImage(named: "donation_5_1"), for: UIControl.State.normal)
            tenBtn.setImage(UIImage(named: "donation_10"), for: UIControl.State.normal)
            twentyBtn.setImage(UIImage(named: "donation_20"), for: UIControl.State.normal)
            self.amountLbl.text = "\(totalAmounts) 5 ر.ع"
            foodAmtlbl = "5"
        }else{
            amountTF.text = ""
            self.amount = "5"
            oneBtn.setImage(UIImage(named: "donation_1_1"), for: UIControl.State.normal)
            fiveBtn.setImage(UIImage(named: "donation_5_1"), for: UIControl.State.normal)
            tenBtn.setImage(UIImage(named: "donation_10"), for: UIControl.State.normal)
            twentyBtn.setImage(UIImage(named: "donation_20"), for: UIControl.State.normal)
            self.amountLbl.text = "Total amounts 5 OMR"
            foodAmtlbl = "5"
        }
        
    }
    
    @objc func tenAction(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            let totalAmounts = "المبلغ الإجمالي"
            amountTF.text = ""
            self.amount = "10"
            oneBtn.setImage(UIImage(named: "donation_1_1"), for: UIControl.State.normal)
            fiveBtn.setImage(UIImage(named: "donation_5"), for: UIControl.State.normal)
            tenBtn.setImage(UIImage(named: "donation_10_2"), for: UIControl.State.normal)
            twentyBtn.setImage(UIImage(named: "donation_20"), for: UIControl.State.normal)
            self.amountLbl.text = "\(totalAmounts) 10 ر.ع"
            foodAmtlbl = "10"
        }else{
            amountTF.text = ""
            self.amount = "10"
            oneBtn.setImage(UIImage(named: "donation_1_1"), for: UIControl.State.normal)
            fiveBtn.setImage(UIImage(named: "donation_5"), for: UIControl.State.normal)
            tenBtn.setImage(UIImage(named: "donation_10_2"), for: UIControl.State.normal)
            twentyBtn.setImage(UIImage(named: "donation_20"), for: UIControl.State.normal)
            self.amountLbl.text = "Total amounts 10 OMR"
            foodAmtlbl = "10"
        }
        
    }
    
    @objc func TwentyAction(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            amountTF.text = ""
            let totalAmounts = "المبلغ الإجمالي"
            self.amount = "20"
            oneBtn.setImage(UIImage(named: "donation_1_1"), for: UIControl.State.normal)
            fiveBtn.setImage(UIImage(named: "donation_5"), for: UIControl.State.normal)
            tenBtn.setImage(UIImage(named: "donation_10"), for: UIControl.State.normal)
            twentyBtn.setImage(UIImage(named: "donation_20_2"), for: UIControl.State.normal)
            self.amountLbl.text = "\(totalAmounts) 20 ر.ع"
            foodAmtlbl = "20"
        }else{
            amountTF.text = ""
            self.amount = "20"
            oneBtn.setImage(UIImage(named: "donation_1_1"), for: UIControl.State.normal)
            fiveBtn.setImage(UIImage(named: "donation_5"), for: UIControl.State.normal)
            tenBtn.setImage(UIImage(named: "donation_10"), for: UIControl.State.normal)
            twentyBtn.setImage(UIImage(named: "donation_20_2"), for: UIControl.State.normal)
            self.amountLbl.text = "Total amounts 20 OMR"
            foodAmtlbl = "20"
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            if textField == self.amountTF{
                let amount = self.amountTF.text
                let totalAmounts = "المبلغ الإجمالي"
                 self.amountLbl.text = "\(totalAmounts) \(amount ?? "") ر.ع"
                foodAmtlbl = amount
            }
        }else{
            if textField == self.amountTF{
                let amount = self.amountTF.text
                 self.amountLbl.text = "Total amounts \(amount ?? "") OMR"
                foodAmtlbl = amount
            }
        }
        
    }
    
    @IBAction func donateNowBtn(_ sender: Any) {
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
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }else if amountTF.text == ""{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
                vc.cartID = id
                vc.amount = amount
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }else{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
                vc.cartID = id
                vc.amount = amountTF.text!
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }
        }
        
    }
    
    
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true,completion: nil)
    }
    
}
