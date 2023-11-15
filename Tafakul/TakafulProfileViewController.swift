//
//  TakafulProfileViewController.swift
//  Tafakul
//
//  Created by apple on 21/12/22.
//

import UIKit
import Alamofire

class TakafulProfileViewController: UIViewController,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var loginLbl: UILabel!
    
    @IBOutlet weak var profileLbl: UILabel!
    
    @IBOutlet weak var usernameLbl: UILabel!
    
    @IBOutlet weak var backVieww: UIView!
    
    @IBOutlet weak var contentView: UIView!
    
    var id:Int!
    
    @IBOutlet weak var tblView: UITableView!
    
    var userid:String!
    
    var profileData = [[String:Any]]()
    
    var profileInfo = [profileList]()
    
    @IBOutlet weak var backBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userid = UserDefaults.standard.string(forKey: "id")
        self.tblView.delegate = self
        self.tblView.dataSource = self
        
        
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
//            backBtn.setImage(UIImage.init(named: "ArabicBackIcon"), for: .normal)
            backBtn.isHidden = true
            profileLbl.text = "الملف الشخصي"
            if userid == nil{
                profileInfo.append(profileList(name: "التبرعات", image: Constants.Account.Donate))
                profileInfo.append(profileList(name: "عن فريق تكافل صحار", image: Constants.Account.About))
                profileInfo.append(profileList(name: "تغيير اللغة", image: Constants.Account.ChangeLanguage))
                profileInfo.append(profileList(name: "سياسة الخصوصية", image: Constants.Account.PrivacyPolicy))
                profileInfo.append(profileList(name: "الشروط والأحكام", image: Constants.Account.TermsConditons))
                profileInfo.append(profileList(name: "تواصل مع الدعم", image: Constants.Account.ContactSupport))
                loginLbl.text = "تسجيل الدخول"
                usernameLbl.text = "اسم المستخدم"
                loginLbl.isUserInteractionEnabled = true
                backVieww.isHidden = false
                contentView.isHidden = true
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))

                loginLbl.addGestureRecognizer(tapGesture)

            }else{
                profileInfo.append(profileList(name: "التبرعات", image: Constants.Account.Donate))
                profileInfo.append(profileList(name: "عن فريق تكافل صحار", image: Constants.Account.About))
                profileInfo.append(profileList(name: "تغيير اللغة", image: Constants.Account.ChangeLanguage))
                profileInfo.append(profileList(name: "سياسة الخصوصية", image: Constants.Account.PrivacyPolicy))
                profileInfo.append(profileList(name: "الشروط والأحكام", image: Constants.Account.TermsConditons))
                profileInfo.append(profileList(name: "تواصل مع الدعم", image: Constants.Account.ContactSupport))
                profileInfo.append(profileList(name: "تسجيل الخروج", image: Constants.Account.signOut))
                profileInfo.append(profileList(name: "حذف الحساب", image: Constants.Account.delete))
                self.getArabicProfile()
                loginLbl.text = "تعديل الملف الشخصي"
                loginLbl.isUserInteractionEnabled = true
                backVieww.isHidden = false
                contentView.isHidden = true
                
            }
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            backBtn.setImage(UIImage.init(named: "BackButton"), for: .normal)
            profileLbl.text = "Profile"
            if userid == nil{
                profileInfo.append(profileList(name: "Donations", image: Constants.Account.Donate))
                profileInfo.append(profileList(name: "About Takaful Sohar", image: Constants.Account.About))
                profileInfo.append(profileList(name: "Change Language", image: Constants.Account.ChangeLanguage))
                profileInfo.append(profileList(name: "Privacy Policy", image: Constants.Account.PrivacyPolicy))
                profileInfo.append(profileList(name: "Terms & Conditions", image: Constants.Account.TermsConditons))
                profileInfo.append(profileList(name: "Contact Support", image: Constants.Account.ContactSupport))
                
                loginLbl.text = "Login"
                loginLbl.isUserInteractionEnabled = true
                usernameLbl.text = "Username"
                backVieww.isHidden = false
                contentView.isHidden = true
                
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))

                loginLbl.addGestureRecognizer(tapGesture)

            }else{
                profileInfo.append(profileList(name: "Donations", image: Constants.Account.Donate))
                profileInfo.append(profileList(name: "About Takaful Sohar", image: Constants.Account.About))
                profileInfo.append(profileList(name: "Change Language", image: Constants.Account.ChangeLanguage))
                profileInfo.append(profileList(name: "Privacy Policy", image: Constants.Account.PrivacyPolicy))
                profileInfo.append(profileList(name: "Terms & Conditions", image: Constants.Account.TermsConditons))
                profileInfo.append(profileList(name: "Contact Support", image: Constants.Account.ContactSupport))
                profileInfo.append(profileList(name: "Sign Out", image: Constants.Account.signOut))
                profileInfo.append(profileList(name: "Delete Account", image: Constants.Account.delete))

                self.getProfileApi()
                loginLbl.text = "Edit Profile"
                loginLbl.isUserInteractionEnabled = true
                backVieww.isHidden = false
                contentView.isHidden = true
            }
        }
        
        
       
    }
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PhoneSignUpViewController") as! PhoneSignUpViewController
        UserDefaults.standard.removeObject(forKey: "id")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)

    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "cell") as! TakafulProfileTableViewCell
        cell.accountObj = profileInfo[indexPath.row]
        cell.selectionStyle = .none
        if indexPath.row == 0{
            cell.ArrowImg.isHidden = false
        }else if indexPath.row == 1{
            cell.ArrowImg.isHidden = false
        }else if indexPath.row == 2{
            cell.ArrowImg.isHidden = false
        }else{
            cell.ArrowImg.isHidden = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 6 {
            if userid == nil{
                let alertController = UIAlertController(title: "", message: "Please Login To Acess Profile.", preferredStyle: .alert)
                let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) { _ in
                }
                let confirmButton = UIAlertAction(title: "Continue", style: .default) { _ in
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "PhoneSignUpViewController") as! PhoneSignUpViewController
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }
                alertController.addAction(cancelButton)
                alertController.addAction(confirmButton)
                self.present(alertController, animated: true, completion: nil)
            }else{
                if LocalizationSystem.sharedInstance.getLanguage() == "en"{
                    UIView.appearance().semanticContentAttribute = .forceRightToLeft
                    let alertController = UIAlertController(title: "", message: "هل ترغب بالخروج", preferredStyle: .alert)
                    let cancelButton = UIAlertAction(title: "إلغاء", style: .cancel) { _ in
                    }
                    let confirmButton = UIAlertAction(title: "إكمال", style: .default) { _ in
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PhoneSignUpViewController") as! PhoneSignUpViewController
                        UserDefaults.standard.removeObject(forKey: "id")
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated: true)
                    }
                    alertController.addAction(cancelButton)
                    alertController.addAction(confirmButton)
                    self.present(alertController, animated: true, completion: nil)
                }else
                {
                    UIView.appearance().semanticContentAttribute = .forceLeftToRight
                    let alertController = UIAlertController(title: "", message: "Are You Sure Want To Logout.", preferredStyle: .alert)
                    let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) { _ in
                    }
                    let confirmButton = UIAlertAction(title: "Continue", style: .default) { _ in
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PhoneSignUpViewController") as! PhoneSignUpViewController
                        UserDefaults.standard.removeObject(forKey: "id")
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated: true)
                    }
                    alertController.addAction(cancelButton)
                    alertController.addAction(confirmButton)
                    self.present(alertController, animated: true, completion: nil)
                }
                
            }
            
        }
        if indexPath.row == 7 {
            if userid == nil{
                let alertController = UIAlertController(title: "", message: "Please Login To Acess Profile.", preferredStyle: .alert)
                let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) { _ in
                }
                let confirmButton = UIAlertAction(title: "Continue", style: .default) { _ in
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "PhoneSignUpViewController") as! PhoneSignUpViewController
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }
                alertController.addAction(cancelButton)
                alertController.addAction(confirmButton)
                self.present(alertController, animated: true, completion: nil)
            }else{
                if LocalizationSystem.sharedInstance.getLanguage() == "en"{
                    UIView.appearance().semanticContentAttribute = .forceRightToLeft
                    let alertController = UIAlertController(title: "", message: "هل ترغب بحذف الحساب؟", preferredStyle: .alert)
                    let cancelButton = UIAlertAction(title: "إلغاء", style: .cancel) { _ in
                    }
                    let confirmButton = UIAlertAction(title: "إكمال", style: .default) { _ in
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PhoneSignUpViewController") as! PhoneSignUpViewController
                        UserDefaults.standard.removeObject(forKey: "id")
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated: true)
                    }
                    alertController.addAction(cancelButton)
                    alertController.addAction(confirmButton)
                    self.present(alertController, animated: true, completion: nil)
                }else
                {
                    UIView.appearance().semanticContentAttribute = .forceLeftToRight
                    let alertController = UIAlertController(title: "", message: "Are You Sure Want To Delete account?", preferredStyle: .alert)
                    let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) { _ in
                    }
                    let confirmButton = UIAlertAction(title: "Continue", style: .default) { _ in
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PhoneSignUpViewController") as! PhoneSignUpViewController
                        UserDefaults.standard.removeObject(forKey: "id")
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated: true)
                    }
                    alertController.addAction(cancelButton)
                    alertController.addAction(confirmButton)
                    self.present(alertController, animated: true, completion: nil)
                }
                
            }
            
        }
        if indexPath.row == 1{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "AboutTakafulViewController") as! AboutTakafulViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
        if indexPath.row == 0{
            if LocalizationSystem.sharedInstance.getLanguage() == "en"{
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
                if userid == nil{
                    let alertController = UIAlertController(title: "", message: "تحتاج إلى تسجيل الدخول أولاً لمشاهدة الملف الشخصي", preferredStyle: .alert)
                    let cancelButton = UIAlertAction(title: "إلغاء", style: .cancel) { _ in
                    }
                    let confirmButton = UIAlertAction(title: "إكمال", style: .default) { _ in
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PhoneSignUpViewController") as! PhoneSignUpViewController
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated: true)
                    }
                    alertController.addAction(cancelButton)
                    alertController.addAction(confirmButton)
                    self.present(alertController, animated: true, completion: nil)
                }else{
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "DonationDetailsViewController") as! DonationDetailsViewController
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }
                
            }else{
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
                if userid == nil{
                    let alertController = UIAlertController(title: "", message: "Please Login To Acess Profile.", preferredStyle: .alert)
                    let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) { _ in
                    }
                    let confirmButton = UIAlertAction(title: "Continue", style: .default) { _ in
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PhoneSignUpViewController") as! PhoneSignUpViewController
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated: true)
                    }
                    alertController.addAction(cancelButton)
                    alertController.addAction(confirmButton)
                    self.present(alertController, animated: true, completion: nil)
                }else{
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "DonationDetailsViewController") as! DonationDetailsViewController
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }
            }
            
            
        }
        
        if indexPath.row == 2{
            if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
                LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
               UIView.appearance().semanticContentAttribute = .forceLeftToRight
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            } else {
                LocalizationSystem.sharedInstance.setLanguage(languageCode: "ar")
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
        }
        
        if indexPath.row == 3 {
            if let url = URL(string: "https://www.takafulsuhar.om/privacy"), UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
        if indexPath.row == 4 {
            if let url = URL(string: "https://www.takafulsuhar.om/volunteer"), UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
        if indexPath.row == 5 {
            if let url = URL(string: "https://www.takafulsuhar.om/contact"), UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func getArabicProfile(){
        self.loadinHubShowArabic()
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
                                    self.usernameLbl.text = x["name"] as? String ?? ""
                                }
                            }
                            break
                        case .failure:
                            print(Error.self)
                            let alert = UIAlertController(title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "", comment: ""), message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "Unable To Connect Server", comment: ""), preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "Okay", comment: ""), style: UIAlertAction.Style.default, handler: { action in
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
    
    func getProfileApi(){
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
                                    self.usernameLbl.text = x["name"] as? String ?? ""
                                }
                            }
                            break
                        case .failure:
                            print(Error.self)
                            let alert = UIAlertController(title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "", comment: ""), message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "Unable To Connect Server", comment: ""), preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "Okay", comment: ""), style: UIAlertAction.Style.default, handler: { action in
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


class profileList {
    var name: String?
    var image: String?

    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
