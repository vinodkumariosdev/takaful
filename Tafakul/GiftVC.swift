//
//  GiftVC.swift
//  Tafakul
//
//  Created by apple on 22/12/22.
//

import UIKit
import Alamofire

class GiftVC: UIViewController,UITextViewDelegate,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var giftTblVieww: UITableView!
    
    @IBOutlet weak var giftDetailsVieww: UIView!
    
    @IBOutlet weak var giftBackBtn: UIButton!
    
    @IBOutlet weak var donatecharityLbl: UILabel!
    
    @IBOutlet weak var checkBoxBtn: UIButton!
    
    @IBOutlet weak var giftDonateLbl: UILabel!
    
    @IBOutlet weak var GiftLbl: UILabel!
    
    @IBOutlet weak var receipentNameTF: UITextField!{
        didSet{
            self.receipentNameTF.layer.cornerRadius = 15.0
            self.receipentNameTF.layer.masksToBounds = true
            self.receipentNameTF.layer.borderWidth = 1
            self.receipentNameTF.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
    @IBOutlet weak var receipientMobileTF: UITextField!{
        didSet{
            self.receipientMobileTF.layer.cornerRadius = 15.0
            self.receipientMobileTF.layer.masksToBounds = true
            self.receipientMobileTF.layer.borderWidth = 1
            self.receipientMobileTF.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
    @IBOutlet weak var giftDonateNowBtn: UIButton!{
        didSet{
            self.giftDonateNowBtn.layer.cornerRadius = 10.0
            self.giftDonateNowBtn.layer.masksToBounds = true
        }
    }
    
    var ischecked = false
    
    @IBOutlet weak var phoneNumberTF: UITextField!{
        didSet{
            self.phoneNumberTF.layer.cornerRadius = 15.0
            self.phoneNumberTF.layer.masksToBounds = true
            self.phoneNumberTF.layer.borderWidth = 1
            self.phoneNumberTF.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
    @IBOutlet weak var giftCheckBtn: UIButton!
    
    @IBOutlet weak var mainCardVieww: UIView!
    
    @IBOutlet weak var personNameTF: UILabel!
    
    @IBOutlet weak var nameTF: UITextField!{
        didSet{
            self.nameTF.layer.cornerRadius = 15.0
            self.nameTF.layer.masksToBounds = true
            self.nameTF.layer.borderWidth = 1
            self.nameTF.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
    @IBOutlet weak var donateAmountTF: UITextField!{
        didSet{
            self.donateAmountTF.layer.cornerRadius = 15.0
            self.donateAmountTF.layer.masksToBounds = true
            self.donateAmountTF.layer.borderWidth = 1
            self.donateAmountTF.layer.borderColor = UIColor.blue.cgColor
        }
    }
    
    @IBOutlet weak var backDonateDetailsBtn: UIButton!
    
    @IBOutlet weak var donateDetailVieww: UIView!
    
    @IBOutlet weak var donateDetailBtn: UIButton!{
        didSet{
            self.donateDetailBtn.layer.cornerRadius = 15.0
            self.donateDetailBtn.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var imgCardVieww: UIView!{
        didSet{
            self.imgCardVieww.layer.cornerRadius = 15.0
            self.imgCardVieww.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var twentyDonateBtn: UIButton!
    
    @IBOutlet weak var TenDonateBtn: UIButton!
    
    @IBOutlet weak var fiveDonateBtn: UIButton!
    
    @IBOutlet weak var bottomVieww: UIView!{
        didSet{
            self.bottomVieww.layer.cornerRadius = 15.0
            self.bottomVieww.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var DonateViews: UIView!{
        didSet{
            
        }
    }
    
    @IBOutlet weak var firstNameTF: UITextField!{
        didSet{
            self.firstNameTF.layer.cornerRadius = 15.0
            self.firstNameTF.layer.masksToBounds = true
            self.firstNameTF.layer.borderColor = UIColor.lightGray.cgColor
            self.firstNameTF.layer.borderWidth = 1.0
        }
    }
    
    @IBOutlet weak var tblVieww: UITableView!
    
    @IBOutlet weak var messageCheckBoxBtn: UIButton!
    
    @IBOutlet weak var lastNameTF: UITextField!{
        didSet{
            self.lastNameTF.layer.cornerRadius = 15.0
            self.lastNameTF.layer.masksToBounds = true
            self.lastNameTF.layer.borderColor = UIColor.lightGray.cgColor
            self.lastNameTF.layer.borderWidth = 1.0
        }
    }
    
    @IBOutlet weak var textVieww: UITextView!{
        didSet{
            
        }
    }
    
    @IBOutlet weak var giftBackButton: UIButton!{
        didSet{
            
        }
    }
    
    @IBOutlet weak var giftBtn: UIButton!{
        didSet{
            self.giftBtn.layer.cornerRadius = 15.0
            self.giftBtn.layer.masksToBounds = true
            self.giftBtn.layer.borderColor = UIColor.lightGray.cgColor
            self.giftBtn.layer.borderWidth = 1.0
        }
    }
    
    var donateTitelArray = ["Stop arrow","Public Charity","Clothing a Poor For One Year","Clothing a Family For One Year","Housing Projects"]

    
    var charityPaysImages = ["gift_1","gift_2","gift_3","gift_4","house"]
    
    var userid:String!
    var amount:String!
    var titleLbl:String!
    var id:Int!
    var amountValue:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            backBtn.setImage(UIImage.init(named: "ArabicBackIcon"), for: .normal)
            giftDonateLbl.text = "هدية"
            giftTblVieww.delegate = self
            giftTblVieww.dataSource = self
            giftTblVieww.reloadData()
            GiftLbl.text = "اختر أحد الحقول للتبرع كهدية"
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            backBtn.setImage(UIImage.init(named: "BackButton"), for: .normal)
            giftDonateLbl.text = "Gift Donate"
            giftTblVieww.delegate = self
            giftTblVieww.dataSource = self
            giftTblVieww.reloadData()
            GiftLbl.text = "Choose one of the fields to donate as a gift"
        }
       /* self.amountValue = "5"
        userid = UserDefaults.standard.string(forKey: "id")
        self.textVieww.delegate = self
        textVieww.text = "70 Characters"
        textVieww.textColor = UIColor.lightGray
        textVieww.layer.borderWidth = 1
        textVieww.layer.cornerRadius = 5
        textVieww.layer.borderColor = UIColor.systemGray2.cgColor
        self.checkBoxBtn.addTarget(self, action: #selector(checkBoxselecting(_sender:)), for: .touchUpInside)
        self.messageCheckBoxBtn.addTarget(self, action: #selector(checkBoxMessaging(_sender:)), for: .touchUpInside)
        self.giftBtn.addTarget(self, action: #selector(sendGiftBtn), for: .touchUpInside)
        self.mainCardVieww.isHidden = false
        self.DonateViews.isHidden = true
        self.giftBackButton.addTarget(self, action: #selector(dismissBack), for: .touchUpInside)
        self.tblVieww.delegate = self
        self.tblVieww.dataSource = self
        self.backDonateDetailsBtn.addTarget(self, action: #selector(dismissBack), for: .touchUpInside)
        self.fiveDonateBtn.addTarget(self, action: #selector(fivebtn), for: .touchUpInside)
        self.TenDonateBtn.addTarget(self, action: #selector(tenbtn), for: .touchUpInside)
        self.twentyDonateBtn.addTarget(self, action: #selector(twentybtn), for: .touchUpInside)
        self.donateDetailVieww.isHidden = true
        self.giftDetailsVieww.isHidden = true
        self.donateDetailBtn.addTarget(self, action: #selector(giftViews), for: .touchUpInside)
        self.giftCheckBtn.addTarget(self, action: #selector(giftChecboxSelecting(_sender:)), for: .touchUpInside)
        self.giftDonateNowBtn.addTarget(self, action: #selector(donatePayment), for: .touchUpInside)
        self.giftBackBtn.addTarget(self, action: #selector(dismissBack), for: .touchUpInside)*/
    }
    
    @IBAction func CloseAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    @objc func donatePayment(){
        if receipentNameTF.text == ""{
            let alert = UIAlertController(title: "", message:"Please Enter Receipent Name.".l10n(), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok".l10n(), style: .default, handler: {(_ action: UIAlertAction) -> Void in
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
        if receipientMobileTF.text == ""{
            let alert = UIAlertController(title: "", message:"Please Enter Receipent MobileNumber.".l10n(), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok".l10n(), style: .default, handler: {(_ action: UIAlertAction) -> Void in
            }))
            
            self.present(alert, animated: true, completion: nil)
        }else{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.modalPresentationStyle = .fullScreen
            vc.amount = amountValue
            vc.cartID = id
            print(donateAmountTF.text!)
            print(id!)
            self.present(vc, animated: true)
        }
        
    }
    
    @objc func giftViews(){
        if userid == nil{
            let alert = UIAlertController(title: "", message:"Please Login For Accessing Donate".l10n(), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok".l10n(), style: .default, handler: {(_ action: UIAlertAction) -> Void in
                Constant.isLoginView = true
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "PhoneSignUpViewController") as! PhoneSignUpViewController
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }))
            
            self.present(alert, animated: true, completion: nil)
        }else{
            if donateAmountTF.text == nil{
                self.getProfile()
                self.donateDetailVieww.isHidden = true
                self.giftDetailsVieww.isHidden = false
            }else if donateAmountTF.text == ""{
                self.getProfile()
                self.donateDetailVieww.isHidden = true
                self.giftDetailsVieww.isHidden = false
            }else{
                self.getProfile()
                self.donateDetailVieww.isHidden = true
                self.giftDetailsVieww.isHidden = false
            }
        }

        
    }
    
    @objc func fivebtn(){
        self.donateAmountTF.text = "5 Total Amounts"
        self.amountValue = "5"
        fiveDonateBtn.setImage(UIImage(named: "donation_5_1"), for: UIControl.State.normal)
        TenDonateBtn.setImage(UIImage(named: "donation_10"), for: UIControl.State.normal)
        twentyDonateBtn.setImage(UIImage(named: "donation_20"), for: UIControl.State.normal)
    }
    
    @objc func tenbtn(){
        self.donateAmountTF.text = "10 Total Amounts"
        self.amountValue = "10"
        fiveDonateBtn.setImage(UIImage(named: "donation_5"), for: UIControl.State.normal)
        TenDonateBtn.setImage(UIImage(named: "donation_10_2"), for: UIControl.State.normal)
        twentyDonateBtn.setImage(UIImage(named: "donation_20"), for: UIControl.State.normal)
    }
    
    @objc func twentybtn(){
        self.donateAmountTF.text = "20 Total Amounts"
        self.amountValue = "20"
        fiveDonateBtn.setImage(UIImage(named: "donation_5"), for: UIControl.State.normal)
        TenDonateBtn.setImage(UIImage(named: "donation_10"), for: UIControl.State.normal)
        twentyDonateBtn.setImage(UIImage(named: "donation_20_2"), for: UIControl.State.normal)
    }
    
    @objc func dismissBack(){
        self.dismiss(animated: true)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {

        if textVieww.textColor == UIColor.lightGray {
            textVieww.text = ""
            textVieww.textColor = UIColor.black
            
        }
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textVieww.text == "" {
            textVieww.text = "70 Characters"
            textVieww.textColor = UIColor.lightGray
        }
        
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
    
    @objc func giftChecboxSelecting(_sender:UIButton){
         if ischecked == true{
             ischecked = false
             giftCheckBtn.setImage(UIImage(named:"unchecked"), for: .normal)
         }else{
             ischecked = true
             giftCheckBtn.setImage(UIImage(named:"checked"), for: .normal)
         }
    }
    
    
    @objc func checkBoxMessaging(_sender:UIButton){
         if ischecked == true{
             ischecked = false
             messageCheckBoxBtn.setImage(UIImage(named:"unchecked"), for: .normal)
         }else{
             ischecked = true
             messageCheckBoxBtn.setImage(UIImage(named:"checked"), for: .normal)
         }
    }
     
    @objc func sendGiftBtn(){
        if firstNameTF.text == ""{
            let alert = UIAlertController(title: "", message: "Enter Donor Name", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "Ok", comment: ""), style: UIAlertAction.Style.default, handler: { action in
            }))
            self.present(alert, animated: true, completion: nil)
        }else if lastNameTF.text == ""{
            let alert = UIAlertController(title: "", message: "Enter Person Name", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "Ok", comment: ""), style: UIAlertAction.Style.default, handler: { action in
            }))
            self.present(alert, animated: true, completion: nil)
        }else{
            self.DonateViews.isHidden = false
            self.mainCardVieww.isHidden = true
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            return 5
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            return donateTitelArray.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            let cell = giftTblVieww.dequeueReusableCell(withIdentifier: "cell") as! GiftDonateTableViewCell
            if indexPath.row == 0{
                cell.donationNameLbl.text = "سهم وقف"
                cell.donateGiftLbl.text = "تبرع كهدية"
                cell.donateImg.image = UIImage.init(named: "gift_1")
            }else if indexPath.row == 1{
                cell.donationNameLbl.text = "صدقة عامة"
                cell.donateGiftLbl.text = "تبرع كهدية"
                cell.donateImg.image = UIImage.init(named: "gift_2")
            }else if indexPath.row == 2{
                cell.donationNameLbl.text = "كفالة يتيم لمدة سنة"
                cell.donateGiftLbl.text = "تبرع كهدية"
                cell.donateImg.image = UIImage.init(named: "gift_3")
            }else if indexPath.row == 3{
                cell.donationNameLbl.text = "كفالة أسر معسرة"
                cell.donateGiftLbl.text = "تبرع كهدية"
                cell.donateImg.image = UIImage.init(named: "gift_4")
            }else{
                cell.donationNameLbl.text = "المشاريع الإسكانية"
                cell.donateGiftLbl.text = "تبرع كهدية"
                cell.donateImg.image = UIImage.init(named: "house")
            }
            cell.selectionStyle = .none
            return cell
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            let cell = giftTblVieww.dequeueReusableCell(withIdentifier: "cell") as! GiftDonateTableViewCell
            cell.donationNameLbl.text = donateTitelArray[indexPath.row]
            cell.donateImg.image = UIImage(named: charityPaysImages[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            if indexPath.row == 0{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "GiftDonateViewController") as! GiftDonateViewController
                vc.modalTransitionStyle = .coverVertical
                self.definesPresentationContext = true
                vc.modalPresentationStyle = .overCurrentContext
                vc.headTextlbl = "سهم وقف"
                vc.isOtherCharity = ""
                vc.id = 69
                self.present(vc, animated: true, completion: nil)
            }
            if indexPath.row == 1{
                /*self.donateDetailVieww.isHidden = false
                self.id = 69
                self.titleLbl = "Public Charity"
                self.donatecharityLbl.text = titleLbl*/
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "GiftDonateViewController") as! GiftDonateViewController
                vc.modalTransitionStyle = .coverVertical
                self.definesPresentationContext = true
                vc.modalPresentationStyle = .overCurrentContext
                vc.headTextlbl = "صدقة عامة"
                vc.isOtherCharity = ""
                vc.id = 69
                self.present(vc, animated: true, completion: nil)
            }
            if indexPath.row == 2{
                /*self.donateDetailVieww.isHidden = false
                self.id = 71
                self.titleLbl = "Clothing A Poor For One Year"
                self.donatecharityLbl.text = titleLbl*/
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "GiftDonateViewController") as! GiftDonateViewController
                vc.modalTransitionStyle = .coverVertical
                self.definesPresentationContext = true
                vc.modalPresentationStyle = .overCurrentContext
                vc.headTextlbl = "كفالة يتيم لمدة سنة"
                vc.isOtherCharity = "OtherCharity"
                vc.id = 71
                self.present(vc, animated: true, completion: nil)
            }
            if indexPath.row == 3{
                /*self.donateDetailVieww.isHidden = false
                self.id = 92
                self.titleLbl = "Clothing a Family For One Year"
                self.donatecharityLbl.text = titleLbl*/
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "GiftDonateViewController") as! GiftDonateViewController
                vc.modalTransitionStyle = .coverVertical
                self.definesPresentationContext = true
                vc.modalPresentationStyle = .overCurrentContext
                vc.headTextlbl = "كفالة أسر معسرة"
                vc.isOtherCharity = "OtherCharity"
                vc.id = 92
                self.present(vc, animated: true, completion: nil)
            }
            if indexPath.row == 4{
                /*self.donateDetailVieww.isHidden = false
                self.id = 63
                self.titleLbl = "Housing Projects"
                self.donatecharityLbl.text = titleLbl*/
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "GiftDonateViewController") as! GiftDonateViewController
                vc.modalTransitionStyle = .coverVertical
                self.definesPresentationContext = true
                vc.modalPresentationStyle = .overCurrentContext
                vc.headTextlbl = "المشاريع الإسكانية"
                vc.isOtherCharity = ""
                vc.id = 63
                self.present(vc, animated: true, completion: nil)
            }
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            if indexPath.row == 0{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "GiftDonateViewController") as! GiftDonateViewController
                vc.modalTransitionStyle = .coverVertical
                self.definesPresentationContext = true
                vc.modalPresentationStyle = .overCurrentContext
                vc.headTextlbl = "Stop arrow"
                vc.isOtherCharity = ""
                vc.id = 69
                self.present(vc, animated: true, completion: nil)
            }
            if indexPath.row == 1{
                /*self.donateDetailVieww.isHidden = false
                self.id = 69
                self.titleLbl = "Public Charity"
                self.donatecharityLbl.text = titleLbl*/
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "GiftDonateViewController") as! GiftDonateViewController
                vc.modalTransitionStyle = .coverVertical
                self.definesPresentationContext = true
                vc.modalPresentationStyle = .overCurrentContext
                vc.headTextlbl = "Public Charity"
                vc.isOtherCharity = ""
                vc.id = 69
                self.present(vc, animated: true, completion: nil)
            }
            if indexPath.row == 2{
                /*self.donateDetailVieww.isHidden = false
                self.id = 71
                self.titleLbl = "Clothing A Poor For One Year"
                self.donatecharityLbl.text = titleLbl*/
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "GiftDonateViewController") as! GiftDonateViewController
                vc.modalTransitionStyle = .coverVertical
                self.definesPresentationContext = true
                vc.modalPresentationStyle = .overCurrentContext
                vc.headTextlbl = "Clothing A Poor For One Year"
                vc.isOtherCharity = "OtherCharity"
                vc.id = 71
                self.present(vc, animated: true, completion: nil)
            }
            if indexPath.row == 3{
                /*self.donateDetailVieww.isHidden = false
                self.id = 92
                self.titleLbl = "Clothing a Family For One Year"
                self.donatecharityLbl.text = titleLbl*/
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "GiftDonateViewController") as! GiftDonateViewController
                vc.modalTransitionStyle = .coverVertical
                self.definesPresentationContext = true
                vc.modalPresentationStyle = .overCurrentContext
                vc.headTextlbl = "Clothing a Family For One Year"
                vc.isOtherCharity = "OtherCharity"
                vc.id = 92
                self.present(vc, animated: true, completion: nil)
            }
            if indexPath.row == 4{
                /*self.donateDetailVieww.isHidden = false
                self.id = 63
                self.titleLbl = "Housing Projects"
                self.donatecharityLbl.text = titleLbl*/
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "GiftDonateViewController") as! GiftDonateViewController
                vc.modalTransitionStyle = .coverVertical
                self.definesPresentationContext = true
                vc.modalPresentationStyle = .overCurrentContext
                vc.headTextlbl = "Housing Projects"
                vc.isOtherCharity = ""
                vc.id = 63
                self.present(vc, animated: true, completion: nil)
            }
        }
        
    }
    
    func getProfile(){
        self.loadinHubShow()
        if Reachability.isConnectedToNetwork(){
            let parameters = [
                "api_token": "WNi3oumvqu8ADhvWLqhPN18FhGplwwYgVYuWaHfrFInZcgI2J7o0obuWIIO5",
                "user_id": "\(userid!)"
                ]
            print(parameters)
                let url = "\(Constants.Common.finalURL)get-user"
            print(url)
            AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).responseJSON {
                        response in
                        switch (response.result) {
                        case .success(let json):
                            let response = json as! [String:AnyObject]
                            print(response)
                            DispatchQueue.main.async {
                                self.loadinHubDismiss()
                                let data = response["data"] as! Array<Any>
                                for i in 0..<data.count{
                                    let x = data[i] as! [String:AnyObject]
                                    self.nameTF.text = x["name"] as? String ?? ""
                                    self.nameTF.isUserInteractionEnabled = false
                                    self.phoneNumberTF.text = x["phone"] as? String ?? ""
                                    self.phoneNumberTF.isUserInteractionEnabled = false
                                }
                            }
                            break
                        case .failure:
                            print(Error.self)
                            let alert = UIAlertController(title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "", comment: ""), message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "Unable To Connect Server", comment: ""), preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "Ok", comment: ""), style: UIAlertAction.Style.default, handler: { action in
                            }))
                            self.present(alert, animated: true, completion: nil)
                            break
                        }
                    }
        }else{
            let alert = UIAlertController(title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "", comment: ""), message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "ok", comment: "Please Check Internet Connection"), preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "ok", comment: ""), style: UIAlertAction.Style.default, handler: { action in
            }))
            self.present(alert, animated: true, completion: nil)
        }

    }
}
