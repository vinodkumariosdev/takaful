//
//  SponserShipVC.swift
//  Tafakul
//
//  Created by apple on 22/12/22.
//

import UIKit

class SponserShipVC: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate {

    @IBOutlet weak var titelLbl: UILabel!
    
    @IBOutlet weak var donationLbl: UILabel!
    
    let thePicker = UIPickerView()
    
    @IBOutlet weak var sponsorShipLbl: UILabel!
    
    let myPickerData = ["1", "2", "3", "4", "5", "6","7", "8", "9", "10",
                        "11", "12", "13", "14", "15", "16","17", "18", "19", "20",
                        "21", "22", "23", "24", "25", "26","27", "28", "29", "30",
                        "31", "32", "33", "34", "35", "36","37", "38", "39", "40",
                        "41", "42", "43", "44", "45", "46","47", "48", "49", "50",
                        "51", "52", "53", "54", "55", "56","57", "58", "59", "60",
                        "61", "62", "63", "64", "65", "66","67", "68", "69", "70",
                        "71", "72", "73", "74", "75", "76","77", "78", "79", "80",
                        "81", "82", "83", "84", "85", "86","87", "88", "89", "90",
                        "91", "92", "93", "94", "95", "96","97", "98", "99", "100"]
    
   
    
    @IBOutlet weak var yearBtn: UIButton!
    
    @IBOutlet weak var twoYearsBnt: UIButton!
    
    @IBOutlet weak var openYearBtn: UIButton!
    
    @IBOutlet weak var plusBtn: UIButton!
    
    @IBOutlet weak var fourntyBtn: UIButton!
    
    @IBOutlet weak var thirtyFiveBtn: UIButton!
    
    @IBOutlet weak var thirtyBtn: UIButton!
    
    @IBOutlet weak var twentyFiveBtn: UIButton!
    
    var result:Int?
    
    @IBOutlet weak var donateBtn: UIButton!{
        didSet{
            self.donateBtn.layer.cornerRadius = 20
            self.donateBtn.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var yearsTF: UITextField!{
        didSet{
            self.yearsTF.layer.cornerRadius = 10
            self.yearsTF.layer.masksToBounds = true
            self.yearsTF.layer.borderColor = UIColor.blue.cgColor
            self.yearsTF.layer.borderWidth = 1
        }
    }
    @IBOutlet weak var lineTF: UITextField!{
        didSet
        {
           /* self.lineTF.layer.cornerRadius = 10
            self.lineTF.layer.masksToBounds = true
            self.lineTF.layer.borderColor = UIColor.blue.cgColor
            self.lineTF.layer.borderWidth = 1*/
        }
    }
    @IBOutlet weak var amountLbl: UILabel!
    
    @IBOutlet weak var amountTF: UITextField!{
        didSet{
            self.amountTF.layer.cornerRadius = 10
            self.amountTF.layer.masksToBounds = true
            self.amountTF.layer.borderColor = UIColor.blue.cgColor
            self.amountTF.layer.borderWidth = 1
        }
    }
    
    @IBOutlet weak var numberYearsTF: UITextField!{
        didSet{
            self.numberYearsTF.layer.cornerRadius = 10
            self.numberYearsTF.layer.masksToBounds = true
            self.numberYearsTF.layer.borderColor = UIColor.blue.cgColor
            self.numberYearsTF.layer.borderWidth = 1
        }
    }
    
    @IBOutlet weak var openYearConst: NSLayoutConstraint!
    
    var titleText:String!
    
    var id:Int!
    
    var amount:String!
    
    var userid:String!
    
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            numberYearsTF.delegate = self
            yearsTF.delegate = self
            thePicker.delegate = self
            thePicker.dataSource = self
            lineTF.delegate = self
            self.lineTextFields()
            lineTF.inputView = thePicker
            self.lineTF.setupLeftImage(imageName: "down-arrow")
            self.openYearConst.constant = 0
            userid = UserDefaults.standard.string(forKey: "id")
            amount = "25"
            let totalAmounts = "المبالغ الإجمالية"
            amountLbl.text = "\(totalAmounts) \(amount ?? "") ر.عر.ع"
            donateBtn.setTitle("تبرع الآن", for: .normal)
            sponsorShipLbl.text = "فترة الكفالة"
            donationLbl.text = "اختر مبلغ التبرع"
            self.titelLbl.text = titleText
            numberYearsTF.placeholder = "مبالغ أخرى"
            numberYearsTF.textAlignment = .right
            yearsTF.textAlignment = .right
            yearsTF.placeholder = "أدخل عدد السنوات"
            lineTF.textAlignment = .center
            lineTF.placeholder = "أدخل عدد السنوات"
            self.fourntyBtn.isHidden = true
            self.thirtyBtn.isHidden = true
            self.thirtyFiveBtn.isHidden = true
            self.twentyFiveBtn.addTarget(self, action: #selector(twentyFiveAction), for: .touchUpInside)
            self.thirtyBtn.addTarget(self, action: #selector(thirtyBtnAction), for: .touchUpInside)
            self.thirtyFiveBtn.addTarget(self, action: #selector(thirtyFiveBtnAction), for: .touchUpInside)
            self.fourntyBtn.addTarget(self, action: #selector(FourtyBtnAction), for: .touchUpInside)
            self.plusBtn.addTarget(self, action: #selector(plusActionBtn), for: .touchUpInside)
            openYearBtn.addTarget(self, action: #selector(OpenYearBtn), for: .touchUpInside)
            twoYearsBnt.addTarget(self, action: #selector(TwentyYearBtn), for: .touchUpInside)
            yearBtn.addTarget(self, action: #selector(oneYearBtn), for: .touchUpInside)
            donateBtn.addTarget(self, action: #selector(donateBntAction), for: .touchUpInside)
            self.amountTF.isUserInteractionEnabled = false
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            numberYearsTF.delegate = self
            yearsTF.delegate = self
            thePicker.delegate = self
            thePicker.dataSource = self
            numberYearsTF.textAlignment = .left
            lineTF.textAlignment = .center
            yearsTF.textAlignment = .left
            yearsTF.placeholder = "Enter Number Of Years"
            numberYearsTF.placeholder = "Other Amount"
            lineTF.delegate = self
            lineTF.placeholder = "Number of Years"
            self.lineTextFields()
            lineTF.inputView = thePicker
            self.lineTF.setupLeftImage(imageName: "down-arrow")
            self.openYearConst.constant = 0
            donateBtn.setTitle("Donate Now", for: .normal)
            donationLbl.text = "Choose Monthly Donation Amount"
            userid = UserDefaults.standard.string(forKey: "id")
            amountLbl.text = "Total amounts 25 OMR"
            amount = "25"
            self.titelLbl.text = titleText
            self.fourntyBtn.isHidden = true
            self.thirtyBtn.isHidden = true
            self.thirtyFiveBtn.isHidden = true
            self.twentyFiveBtn.addTarget(self, action: #selector(twentyFiveAction), for: .touchUpInside)
            self.thirtyBtn.addTarget(self, action: #selector(thirtyBtnAction), for: .touchUpInside)
            self.thirtyFiveBtn.addTarget(self, action: #selector(thirtyFiveBtnAction), for: .touchUpInside)
            self.fourntyBtn.addTarget(self, action: #selector(FourtyBtnAction), for: .touchUpInside)
            self.plusBtn.addTarget(self, action: #selector(plusActionBtn), for: .touchUpInside)
            openYearBtn.addTarget(self, action: #selector(OpenYearBtn), for: .touchUpInside)
            twoYearsBnt.addTarget(self, action: #selector(TwentyYearBtn), for: .touchUpInside)
            yearBtn.addTarget(self, action: #selector(oneYearBtn), for: .touchUpInside)
            donateBtn.addTarget(self, action: #selector(donateBntAction), for: .touchUpInside)
            self.amountTF.isUserInteractionEnabled = false
        }
        
    }
    
    @objc func plusActionBtn(){
        counter += 1
        switch counter {
        case 1:
            self.thirtyBtn.isHidden = false
            break
        case 2:
            self.thirtyFiveBtn.isHidden = false
            break
        case 3:
            self.fourntyBtn.isHidden = false
            counter = 0
            break
        default:
            break
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            if textField == numberYearsTF{
                thirtyBtn.setImage(UIImage(named: "donation_30_1"), for: UIControl.State.normal)
                thirtyFiveBtn.setImage(UIImage(named: "donation_35_1"), for: UIControl.State.normal)
                fourntyBtn.setImage(UIImage(named: "donation_40_1"), for: UIControl.State.normal)
                twentyFiveBtn.setImage(UIImage(named: "donation_25"), for: UIControl.State.normal)
                amount = numberYearsTF.text
                let totalAmounts = "المبالغ الإجمالية"
                amountLbl.text = "\(totalAmounts) \(amount ?? "")  ر.عر.ع"
            }
            if textField == yearsTF{
                thirtyBtn.setImage(UIImage(named: "donation_30_1"), for: UIControl.State.normal)
                thirtyFiveBtn.setImage(UIImage(named: "donation_35_1"), for: UIControl.State.normal)
                fourntyBtn.setImage(UIImage(named: "donation_40_1"), for: UIControl.State.normal)
                twentyFiveBtn.setImage(UIImage(named: "donation_25"), for: UIControl.State.normal)
                var amountFiled = yearsTF.text!
                result = Int(amount)! * Int(amountFiled)!
                let totalAmounts = "المبالغ الإجمالية"
                amountLbl.text = "\(totalAmounts) \(result ?? 0) ر.عر.ع"
            }
            
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            if textField == numberYearsTF{
                thirtyBtn.setImage(UIImage(named: "donation_30_1"), for: UIControl.State.normal)
                thirtyFiveBtn.setImage(UIImage(named: "donation_35_1"), for: UIControl.State.normal)
                fourntyBtn.setImage(UIImage(named: "donation_40_1"), for: UIControl.State.normal)
                twentyFiveBtn.setImage(UIImage(named: "donation_25"), for: UIControl.State.normal)
                amount = numberYearsTF.text
                amountLbl.text = "Total amounts \(amount ?? "") OMR"
            }
            if textField == yearsTF{
                thirtyBtn.setImage(UIImage(named: "donation_30_1"), for: UIControl.State.normal)
                thirtyFiveBtn.setImage(UIImage(named: "donation_35_1"), for: UIControl.State.normal)
                fourntyBtn.setImage(UIImage(named: "donation_40_1"), for: UIControl.State.normal)
                twentyFiveBtn.setImage(UIImage(named: "donation_25"), for: UIControl.State.normal)
                var amountFiled = yearsTF.text!
                result = Int(amount)! * Int(amountFiled)!
                amountLbl.text = "Total amounts \(result ?? 0) OMR"
            }
        }
        
    }
    
    @objc func twentyFiveAction(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            thirtyBtn.setImage(UIImage(named: "donation_30_1"), for: UIControl.State.normal)
            thirtyFiveBtn.setImage(UIImage(named: "donation_35_1"), for: UIControl.State.normal)
            fourntyBtn.setImage(UIImage(named: "donation_40_1"), for: UIControl.State.normal)
            twentyFiveBtn.setImage(UIImage(named: "donation_25_2"), for: UIControl.State.normal)
            yearBtn.setImage(UIImage(named: "year"), for: UIControl.State.normal)
            twoYearsBnt.setImage(UIImage(named: "2year"), for: UIControl.State.normal)
            let totalAmounts = "المبالغ الإجمالية"
            amountLbl.text = "\(totalAmounts) 25 ر.عر.ع"
            amount = "25"
            
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            thirtyBtn.setImage(UIImage(named: "donation_30_1"), for: UIControl.State.normal)
            thirtyFiveBtn.setImage(UIImage(named: "donation_35_1"), for: UIControl.State.normal)
            fourntyBtn.setImage(UIImage(named: "donation_40_1"), for: UIControl.State.normal)
            twentyFiveBtn.setImage(UIImage(named: "donation_25_2"), for: UIControl.State.normal)
            yearBtn.setImage(UIImage(named: "year"), for: UIControl.State.normal)
            twoYearsBnt.setImage(UIImage(named: "2year"), for: UIControl.State.normal)
            amountLbl.text = "Total amounts 25 OMR"
            amount = "25"
        }
        
       
    }
    
    @objc func thirtyBtnAction(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            thirtyBtn.setImage(UIImage(named: "donation_30"), for: UIControl.State.normal)
            thirtyFiveBtn.setImage(UIImage(named: "donation_35_1"), for: UIControl.State.normal)
            fourntyBtn.setImage(UIImage(named: "donation_40_1"), for: UIControl.State.normal)
            twentyFiveBtn.setImage(UIImage(named: "donation_25"), for: UIControl.State.normal)
            yearBtn.setImage(UIImage(named: "year"), for: UIControl.State.normal)
            twoYearsBnt.setImage(UIImage(named: "2year"), for: UIControl.State.normal)
            let totalAmounts = "المبالغ الإجمالية"
            amountLbl.text = "\(totalAmounts) 30 ر.عر.ع"
            amount = "30"
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            thirtyBtn.setImage(UIImage(named: "donation_30"), for: UIControl.State.normal)
            thirtyFiveBtn.setImage(UIImage(named: "donation_35_1"), for: UIControl.State.normal)
            fourntyBtn.setImage(UIImage(named: "donation_40_1"), for: UIControl.State.normal)
            twentyFiveBtn.setImage(UIImage(named: "donation_25"), for: UIControl.State.normal)
            yearBtn.setImage(UIImage(named: "year"), for: UIControl.State.normal)
            twoYearsBnt.setImage(UIImage(named: "2year"), for: UIControl.State.normal)
            amountLbl.text = "Total amounts 30 OMR"
            amount = "30"
        }
        
        
    }
    
    @objc func thirtyFiveBtnAction(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            thirtyBtn.setImage(UIImage(named: "donation_30_1"), for: UIControl.State.normal)
            thirtyFiveBtn.setImage(UIImage(named: "donation_35"), for: UIControl.State.normal)
            fourntyBtn.setImage(UIImage(named: "donation_40_1"), for: UIControl.State.normal)
            twentyFiveBtn.setImage(UIImage(named: "donation_25"), for: UIControl.State.normal)
            yearBtn.setImage(UIImage(named: "year"), for: UIControl.State.normal)
            twoYearsBnt.setImage(UIImage(named: "2year"), for: UIControl.State.normal)
            let totalAmounts = "المبالغ الإجمالية"
            amountLbl.text = "\(totalAmounts) 35 ر.عر.ع"
            amount = "35"
            
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            thirtyBtn.setImage(UIImage(named: "donation_30_1"), for: UIControl.State.normal)
            thirtyFiveBtn.setImage(UIImage(named: "donation_35"), for: UIControl.State.normal)
            fourntyBtn.setImage(UIImage(named: "donation_40_1"), for: UIControl.State.normal)
            twentyFiveBtn.setImage(UIImage(named: "donation_25"), for: UIControl.State.normal)
            yearBtn.setImage(UIImage(named: "year"), for: UIControl.State.normal)
            twoYearsBnt.setImage(UIImage(named: "2year"), for: UIControl.State.normal)
            amountLbl.text = "Total amounts 35 OMR"
            amount = "35"
        }
        
        
    }
    
    @objc func FourtyBtnAction(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            thirtyBtn.setImage(UIImage(named: "donation_30_1"), for: UIControl.State.normal)
            thirtyFiveBtn.setImage(UIImage(named: "donation_35_1"), for: UIControl.State.normal)
            fourntyBtn.setImage(UIImage(named: "donation_40"), for: UIControl.State.normal)
            twentyFiveBtn.setImage(UIImage(named: "donation_25"), for: UIControl.State.normal)
            yearBtn.setImage(UIImage(named: "year"), for: UIControl.State.normal)
            twoYearsBnt.setImage(UIImage(named: "2year"), for: UIControl.State.normal)
            let totalAmounts = "المبالغ الإجمالية"
            amountLbl.text = "\(totalAmounts) 40 ر.عر.ع"
            amount = "40"
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            thirtyBtn.setImage(UIImage(named: "donation_30_1"), for: UIControl.State.normal)
            thirtyFiveBtn.setImage(UIImage(named: "donation_35_1"), for: UIControl.State.normal)
            fourntyBtn.setImage(UIImage(named: "donation_40"), for: UIControl.State.normal)
            twentyFiveBtn.setImage(UIImage(named: "donation_25"), for: UIControl.State.normal)
            yearBtn.setImage(UIImage(named: "year"), for: UIControl.State.normal)
            twoYearsBnt.setImage(UIImage(named: "2year"), for: UIControl.State.normal)
            amountLbl.text = "Total amounts 40 OMR"
            amount = "40"
        }
        
        
    }
    
    @objc func oneYearBtn(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            yearBtn.setImage(UIImage(named: "year"), for: UIControl.State.normal)
            twoYearsBnt.setImage(UIImage(named: "2year"), for: UIControl.State.normal)
            openYearBtn.setImage(UIImage(named: "open"), for: UIControl.State.normal)
            self.openYearConst.constant = 0
            result = Int(amount)! * 1
            let totalAmounts = "المبالغ الإجمالية"
            amountLbl.text = "\(totalAmounts) \(result ?? 0) ر.عر.ع"
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            yearBtn.setImage(UIImage(named: "year"), for: UIControl.State.normal)
            twoYearsBnt.setImage(UIImage(named: "2year"), for: UIControl.State.normal)
            openYearBtn.setImage(UIImage(named: "open"), for: UIControl.State.normal)
            self.openYearConst.constant = 0
            result = Int(amount)! * 1
            amountLbl.text = "Total amounts \(result ?? 0) OMR"
        }
        
    }
    
    @objc func TwentyYearBtn(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            yearBtn.setImage(UIImage(named: "year_1"), for: UIControl.State.normal)
            twoYearsBnt.setImage(UIImage(named: "2year_3x"), for: UIControl.State.normal)
            openYearBtn.setImage(UIImage(named: "open"), for: UIControl.State.normal)
            self.openYearConst.constant = 0
            if numberYearsTF.text == ""{
                result = Int(amount)! * 2
                let totalAmounts = "المبالغ الإجمالية"
                amountLbl.text = "\(totalAmounts) \(result ?? 0) ر.عر.ع"
            }else if numberYearsTF.text == nil{
                result = Int(amount)! * 2
                let totalAmounts = "المبالغ الإجمالية"
                amountLbl.text = "\(totalAmounts) \(result ?? 0) ر.عر.ع"
            }else{
                amount = numberYearsTF.text!
                result = Int(amount)! * 2
                let totalAmounts = "المبالغ الإجمالية"
                amountLbl.text = "\(totalAmounts) \(result ?? 0) ر.عر.ع"
            }
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            yearBtn.setImage(UIImage(named: "year_1"), for: UIControl.State.normal)
            twoYearsBnt.setImage(UIImage(named: "2year_3x"), for: UIControl.State.normal)
            openYearBtn.setImage(UIImage(named: "open"), for: UIControl.State.normal)
            self.openYearConst.constant = 0
            if numberYearsTF.text == ""{
                result = Int(amount)! * 2
                amountLbl.text = "Total amounts \(result ?? 0) OMR"
            }else if numberYearsTF.text == nil{
                result = Int(amount)! * 2
                amountLbl.text = "Total amounts \(result ?? 0) OMR"
            }else{
                amount = numberYearsTF.text!
                result = Int(amount)! * 2
                amountLbl.text = "Total amounts \(result ?? 0) OMR"
            }
        }
        
    }
    
    @objc func OpenYearBtn(){
        yearBtn.setImage(UIImage(named: "year_1"), for: UIControl.State.normal)
        twoYearsBnt.setImage(UIImage(named: "2year"), for: UIControl.State.normal)
        openYearBtn.setImage(UIImage(named: "open_1"), for: UIControl.State.normal)
        self.openYearConst.constant = 40
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true,completion: nil)
    }
    
    func lineTextFields(){
        let bottomLayer = CALayer()
        bottomLayer.frame = CGRect(x: 0, y: lineTF.frame.height - 2, width: lineTF.frame.width, height: 2)
        bottomLayer.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        lineTF.borderStyle = .none
        lineTF.layer.addSublayer(bottomLayer)
    }
    
    @objc func donateBntAction(){
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
            if numberYearsTF.text == nil{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
                vc.cartID = id
                vc.amount = "\(result ?? 0)"
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }else if numberYearsTF.text == ""{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
                vc.cartID = id
                vc.amount = "\(result ?? 0)"
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }else{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
                vc.cartID = id
                vc.amount = "\(result ?? 0)"
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }
        }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView( _ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        myPickerData.count
    }

    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return myPickerData[row]
    }

    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lineTF.text = myPickerData[row]
        var amountFiled = lineTF.text!
        result = Int(amount)! * Int(amountFiled)!
        amountLbl.text = "Total amounts \(result ?? 0) OMR"
    }
   
}

extension UITextField {

    //MARK:- Set Image on the right of text fields

  func setupRightImage1(imageName:String){
    let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
    imageView.image = UIImage(named: imageName)
    let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 40))
    imageContainerView.addSubview(imageView)
    rightView = imageContainerView
    rightViewMode = .always
    self.tintColor = .lightGray
}

 //MARK:- Set Image on left of text fields

    func setupLeftImage(imageName:String){
       let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
       imageView.image = UIImage(named: imageName)
       let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 40))
       imageContainerView.addSubview(imageView)
       leftView = imageContainerView
       leftViewMode = .always
       self.tintColor = .lightGray
     }
    
    func setLeftPaddingPoints(_ amount:CGFloat){
           let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
           self.leftView = paddingView
           self.leftViewMode = .always
       }
    
       func setRightPaddingPoints(_ amount:CGFloat) {
           let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
           self.rightView = paddingView
           self.rightViewMode = .always
       }

  }
