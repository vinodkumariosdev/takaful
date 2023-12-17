//
//  DonateGiftDetailsViewController.swift
//  Tafakul
//
//  Created by apple on 24/05/23.
//

import UIKit

class DonateGiftDetailsViewController: UIViewController,UITextViewDelegate {

    @IBOutlet weak var textVieww: UITextView!
    
    var amount:String?
    var id:Int?
    var ischecked = false
    
    
    @IBOutlet weak var BackBtn: UIButton!
    
    @IBOutlet weak var completionDetailsLbl: UILabel!
    
    @IBOutlet weak var senderDetailsLbl: UILabel!
    
    @IBOutlet weak var receipentNameLbl: UILabel!
    
    @IBOutlet weak var receipentMobileLbl: UILabel!
    
    @IBOutlet weak var giftLbl: UILabel!
    
    @IBOutlet weak var messageLbl: UILabel!
    
    @IBOutlet weak var personalDetailsLbl: UILabel!
    
    @IBOutlet weak var receipentMobileTF: UITextField!{
        didSet{
            receipentMobileTF.layer.cornerRadius = 20.0
            receipentMobileTF.layer.masksToBounds = true
            receipentMobileTF.layer.borderColor = UIColor.lightGray.cgColor
            receipentMobileTF.layer.borderWidth = 1.0
        }
    }
    
    @IBOutlet weak var receipentNameTF: UITextField!{
        didSet{
            receipentNameTF.layer.cornerRadius = 20.0
            receipentNameTF.layer.masksToBounds = true
            receipentNameTF.layer.borderColor = UIColor.lightGray.cgColor
            receipentNameTF.layer.borderWidth = 1.0
        }
    }
    
    @IBOutlet weak var checkBoxBtn: UIButton!
    
    @IBOutlet weak var personalNameTF: UITextField!{
        didSet{
            personalNameTF.layer.cornerRadius = 20.0
            personalNameTF.layer.masksToBounds = true
            personalNameTF.layer.borderColor = UIColor.lightGray.cgColor
            personalNameTF.layer.borderWidth = 1.0
        }
    }
    
    @IBOutlet weak var personalNumebrTF: UITextField!{
        didSet{
            personalNumebrTF.layer.cornerRadius = 20.0
            personalNumebrTF.layer.masksToBounds = true
            personalNumebrTF.layer.borderColor = UIColor.lightGray.cgColor
            personalNumebrTF.layer.borderWidth = 1.0
        }
    }
    
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var phoneNumberLbl: UILabel!
    
    @IBOutlet weak var donateNowBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            BackBtn.setImage(UIImage.init(named: "ArabicBackIcon"), for: .normal)
            completionDetailsLbl.text = "اكمال بيانات"
            senderDetailsLbl.text = "تفاصيل المرسل"
            personalDetailsLbl.text = "تفاصيل شخصية"
            donateNowBtn.setTitle("تبرع الآن", for: .normal)
            receipentNameLbl.text = "اسم مستلم الهدية"
            receipentMobileLbl.text = "هاتف المستلم"
            nameLbl.text = "اسم"
            phoneNumberLbl.text = "رقم الهاتف:"
            let GiftValue = "إخفاء قيمة الهدايا";
            let chooseValue = "اختر ما إذا كنت لا تريد إظهار قيمة الهدية"
            giftLbl.text = "\(GiftValue) \(chooseValue)"
            receipentMobileTF.textAlignment = .right
            receipentNameTF.textAlignment = .right
            personalNameTF.textAlignment = .right
            personalNumebrTF.textAlignment = .right
            textVieww.textAlignment = .right
            textVieww.delegate = self
            textVieww.text = "او اكتب رسالة مكونة من 70 حرف أو أقل..."
            messageLbl.text = "اسم المهدى له. لان الحب عطاء ليس له حدود اسم المتبرع.. تبرع/ت عنك بصدقة يبقى اثرها"
            textVieww.textColor = UIColor.lightGray
            textVieww.layer.borderWidth = 1
            textVieww.layer.cornerRadius = 10
            textVieww.layer.borderColor = UIColor.lightGray.cgColor
            
            self.checkBoxBtn.addTarget(self, action: #selector(checkBoxselecting(_sender:)), for: .touchUpInside)
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            BackBtn.setImage(UIImage.init(named: "BackButton"), for: .normal)
            completionDetailsLbl.text = "Completion Details"
            senderDetailsLbl.text = "Sender's Details"
            personalDetailsLbl.text = "Personal Details"
            receipentNameLbl.text = "Gift receipent name"
            receipentMobileLbl.text = "receipent's mobile"
            nameLbl.text = "Name"
            messageLbl.text = "Because love is a gift that knows no bounds (Donor’s name) Donate on your behalf in a charity that will keep its impact"
            phoneNumberLbl.text = "Phone Number"
            giftLbl.text = "Hide gift's value Choose if you do not want to show the gift's value"
            donateNowBtn.setTitle("Donate Now", for: .normal)
            textVieww.delegate = self
            textVieww.text = "Or write here message no more 70 letters.."
            receipentMobileLbl.textAlignment = .left
            receipentNameTF.textAlignment = .left
            personalNameTF.textAlignment = .left
            personalNumebrTF.textAlignment = .left
            textVieww.textAlignment = .right
            textVieww.textColor = UIColor.lightGray
            textVieww.layer.borderWidth = 1
            textVieww.layer.cornerRadius = 10
            textVieww.layer.borderColor = UIColor.lightGray.cgColor
            self.checkBoxBtn.addTarget(self, action: #selector(checkBoxselecting(_sender:)), for: .touchUpInside)
        }
        
    }
    

    @IBAction func dismissBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @objc func checkBoxselecting(_sender:UIButton){
         if ischecked == true{
             ischecked = false
             checkBoxBtn.setImage(UIImage(named:"unchecked"), for: .normal)
         }else{
             ischecked = true
             checkBoxBtn.setImage(UIImage(named:"checked"), for: .normal)
         }
    }
    
    @IBAction func donateNowBtn(_ sender: Any) {
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            if receipentNameTF.text == ""{
                let alert = UIAlertController(title: "", message:"أدخل اسم الإيصال", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "نعم", style: .default, handler: {(_ action: UIAlertAction) -> Void in
                }))
                self.present(alert, animated: true, completion: nil)
            }else if receipentMobileTF.text == ""{
                let alert = UIAlertController(title: "", message:"جوال المستلم", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "نعم", style: .default, handler: {(_ action: UIAlertAction) -> Void in
                }))
                self.present(alert, animated: true, completion: nil)
            }else{
                var message = ""
                if(["او اكتب رسالة مكونة من 70 حرف أو أقل...", "", "Or write here message no more 70 letters.."].contains(self.textVieww.text!) ) {
                    message = "\(self.receipentNameTF.text!):"
                    message = message + "لان الحب عطاء ليس له حدود, "
                    message = message + "\(self.personalNameTF.text!)"
                    message = message + "تبرع عنك بصدقة يبقى اثرها"
                    if !self.checkBoxBtn.isEnabled  {
                        message = message + "- قيمة التبرع: \(self.amount) ريال عماني"
                    }
                }else {
                    message = self.textVieww.text
                }
                
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
                vc.modalPresentationStyle = .fullScreen
                let numberStr = self.receipentMobileTF.text!
                let formatter: NumberFormatter = NumberFormatter()
                formatter.locale = NSLocale(localeIdentifier: "EN") as Locale?
                let finalPhoneNumber = formatter.number(from: numberStr)
//                let doubleNumber = Double(final!)

               
                vc.amount = "\(amount ?? "")"
                vc.cartID = id ?? 0
                vc.giftMessage = message
                vc.giftName = self.receipentNameTF.text!
                vc.giftPhone = "\(finalPhoneNumber!)"
                
                self.present(vc, animated: true)
            }
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            if receipentNameTF.text == ""{
                let alert = UIAlertController(title: "", message:"Please Enter Receipent Name", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(_ action: UIAlertAction) -> Void in
                }))
                self.present(alert, animated: true, completion: nil)
            }else if receipentMobileTF.text == ""{
                let alert = UIAlertController(title: "", message:"Please Enter Receipent Mobile", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(_ action: UIAlertAction) -> Void in
                }))
                self.present(alert, animated: true, completion: nil)
            }else{
                var message = ""
                if(["او اكتب رسالة مكونة من 70 حرف أو أقل...", "", "Or write here message no more 70 letters.."].contains(self.textVieww.text!) ) {
                    message = "\(self.receipentNameTF.text):"
                    message = message + "لان الحب عطاء ليس له حدود, "
                    message = message + "\(self.personalNameTF.text!)"
                    message = message + "تبرع عنك بصدقة يبقى اثرها"
                    if !self.checkBoxBtn.isEnabled  {
                        message = message + "- قيمة التبرع: \(self.amount) ريال عماني"
                    }
                }else {
                    message = self.textVieww.text
                }
                
                let numberStr = self.receipentMobileTF.text!
                let formatter: NumberFormatter = NumberFormatter()
                formatter.locale = NSLocale(localeIdentifier: "EN") as Locale?
                let finalPhoneNumber = formatter.number(from: numberStr)
//                let doubleNumber = Double(final!)

               
              
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
                vc.modalPresentationStyle = .fullScreen
                vc.amount = "\(amount ?? "")"
                vc.cartID = id ?? 0
                vc.giftMessage = message
                vc.giftName = self.receipentNameTF.text!
                vc.giftPhone = "\(finalPhoneNumber!)"

                self.present(vc, animated: true)
            }
        }
        
        
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    func textViewDidBeginEditing(_ textView: UITextView) {

        if textVieww.textColor == UIColor.lightGray {
            textVieww.text = ""
            textVieww.textColor = UIColor.black
            
        }
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textVieww.text == "" {
            textVieww.text = ""
            textVieww.textColor = UIColor.lightGray
        }
        
    }
}
