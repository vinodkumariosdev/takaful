//
//  DailySadaqaVC.swift
//  Tafakul
//
//  Created by apple on 22/12/22.
//

import UIKit

class DailySadaqaVC: UIViewController {

    @IBOutlet weak var buttonView: UIView!{
        didSet{
            self.buttonView.layer.cornerRadius = 15.0
            self.buttonView.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var cartImg: UIButton!
    
    @IBOutlet weak var donateBtn: UIButton!{
        didSet{
            self.donateBtn.layer.cornerRadius = 15.0
            self.donateBtn.layer.masksToBounds = true
        }
    }
    
    var sadaquId:String!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    
    @IBOutlet weak var titelLbl: UILabel!
    
    @IBOutlet weak var shareBtn: UIButton!
    
    @IBOutlet weak var sadaqImg: UIImageView!
    
    var imgView:String!
    
    var titleText:String!
    
    var userid:String!
    
    var descriptionString:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.descriptionLbl.text = descriptionString
        userid = UserDefaults.standard.string(forKey: "id")
        sadaqImg.layer.cornerRadius = 15.0
        sadaqImg.layer.masksToBounds = true
        self.titelLbl.text = titleText!
        sadaqImg.contentMode = .scaleAspectFill
        if titleText == "Daily Sadaqa"{
            if LocalizationSystem.sharedInstance.getLanguage() == "en"{
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
                sadaqImg.image = UIImage.init(named: imgView)
                self.donateBtn.addTarget(self, action: #selector(donateAction), for: .touchUpInside)
                self.titelLbl.text = "الصدقة اليومية"
                descriptionLbl.text = "عن أبي هريرة رضي الله عنه أن رسول الله صلى الله عليه وسلم قال (ما ينقص الصدقة في المال). رواه مسلم"
                donateBtn.setTitle("تبرع الآن", for: .normal)
            }else{
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
                sadaqImg.image = UIImage.init(named: imgView)
                self.donateBtn.addTarget(self, action: #selector(donateAction), for: .touchUpInside)
            }
            
        }else if titleText == "Friday Charity"{
            if LocalizationSystem.sharedInstance.getLanguage() == "en"{
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
                sadaqImg.image = UIImage.init(named: imgView)
                self.donateBtn.addTarget(self, action: #selector(donateAction), for: .touchUpInside)
                self.titelLbl.text = "صدقة الجمعة"
                descriptionLbl.text = "عن عقبة عامر رضي الله عنه أن رسول الله صلى الله عليه وسلم قال (الرجل في ظل صدقته حتى يقرر بين الناس). رواه أحمد"
                donateBtn.setTitle("تبرع الآن", for: .normal)
            }else{
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
                donateBtn.setTitle("Donate Now", for: .normal)
                sadaqImg.image = UIImage.init(named: imgView)
                self.donateBtn.addTarget(self, action: #selector(donateAction), for: .touchUpInside)
            }
            
        }else if titleText == "Neighbours in Village"{
            if LocalizationSystem.sharedInstance.getLanguage() == "en"{
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
                self.titelLbl.text = "الجار الجنب"
                descriptionLbl.text = "عن عبد الله بن عمر رضي الله عنه أن رسول الله صلى الله عليه وسلم قال لي مازال جبريل يطلعني على الجار حتى ظننت أنه سيرثه. رواه البخاري"
                donateBtn.setTitle("تبرع الآن", for: .normal)
                sadaqImg.image = UIImage.init(named: imgView)
                self.donateBtn.addTarget(self, action: #selector(donateAction), for: .touchUpInside)
            }else{
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
                sadaqImg.image = UIImage.init(named: imgView)
                self.donateBtn.addTarget(self, action: #selector(donateAction), for: .touchUpInside)
            }
            
        }else if titleText == "Public Charity"{
            if LocalizationSystem.sharedInstance.getLanguage() == "en"{
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
                titelLbl.text = "صدقة عامة"
                descriptionLbl.text = "عن أبي هريرة رضي الله عنه أن رسول الله صلى الله عليه وسلم قال (ما ينقص مال الصدقة) رواه مسلم."
                sadaqImg.image = UIImage.init(named: imgView)
                self.donateBtn.addTarget(self, action: #selector(donateAction), for: .touchUpInside)
                donateBtn.setTitle("تبرع الآن", for: .normal)
            }else{
                donateBtn.setTitle("Donate Now", for: .normal)
                sadaqImg.image = UIImage.init(named: imgView)
                self.donateBtn.addTarget(self, action: #selector(donateAction), for: .touchUpInside)
            }
            
        }else if titleText == "Housing Project"{
            if LocalizationSystem.sharedInstance.getLanguage() == "en"{
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
                titelLbl.text = ""
                descriptionLbl.text = "لا شيء يضاهي الملاذ الآمن لأسرة سعيدة ، بهدف تحسين مستوى معيشة الأسر وتحقيق الاستقرار الاجتماعي. ويسعى الفريق بالشراكة مع مختلف الجهات والأفراد لبناء مشاريع سكنية للأسر المشردة ذات الدخل المحدود وتوفير المتطلبات الأساسية لسكن آمن ومريح. عن طريق بناء وصيانة وحدات سكنية لذوي الدخل المحدود تتوفر فيها المرافق والخدمات الأساسية مع مراعاة عدد أفراد الأسرة."
                sadaqImg.image = UIImage.init(named: imgView)
                self.donateBtn.addTarget(self, action: #selector(donateAction), for: .touchUpInside)
                donateBtn.setTitle("تبرع الآن", for: .normal)
            }else{
                donateBtn.setTitle("Donate Now", for: .normal)
                sadaqImg.image = UIImage.init(named: imgView)
                self.donateBtn.addTarget(self, action: #selector(donateAction), for: .touchUpInside)
            }
            
        }
        else{
            if LocalizationSystem.sharedInstance.getLanguage() == "en"{
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
                sadaqImg.image = UIImage.init(named: imgView)
                self.donateBtn.addTarget(self, action: #selector(donateAction), for: .touchUpInside)
                titelLbl.text = "تخفيف الضيق"
                descriptionLbl.text = "عن أبي هريرة رضي الله عنه أن رسول الله صلى الله عليه وسلم قال (ما ينقص الصدقة في المال). رواه مسلم"
                donateBtn.setTitle("تبرع الآن", for: .normal)
            }else{
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
                sadaqImg.image = UIImage.init(named: imgView)
                self.donateBtn.addTarget(self, action: #selector(donateAction), for: .touchUpInside)
                donateBtn.setTitle("Donate Now", for: .normal)
            }
            
        }
        
        self.cartImg.addTarget(self, action: #selector(cartAdded), for: .touchUpInside)
        self.shareBtn.addTarget(self, action: #selector(shareBtnOption), for: .touchUpInside)
        
    }
    
    @IBAction func dismissBtnAction(_ sender: Any)
    {
        self.dismiss(animated: true)
    }

    func shareContent(title: String, description: String, link: URL) {
        let items: [Any] = [title, description, link]
        let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        // Exclude certain activity types if desired
        activityViewController.excludedActivityTypes = [.addToReadingList, .airDrop, .print, .markupAsPDF]
        // Present the activity view controller
        if let viewController = UIApplication.shared.windows.first?.rootViewController {
            viewController.present(activityViewController, animated: true, completion: nil)
        }
    }

    @objc func shareBtnOption(sender:UIButton){
        if titleText == "Daily Sadaqa"{
            let text = "Daily Sadaqa"
            let description = descriptionString
            let link = URL(string: "https://takafulsuhar.om/projects")!
            let objectsToShare: [Any] = [text,description ?? "",link]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = sender as! UIView
            self.present(activityVC, animated: true, completion: nil)
        }else if titleText == "Friday Charity"{
            let text = "Friday Charity"
            let description = descriptionString
            let link = URL(string: "https://takafulsuhar.om/projects")!
            let objectsToShare: [Any] = [text,description ?? "",link]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = sender as! UIView
            self.present(activityVC, animated: true, completion: nil)
        }else if titleText == "Neighbours in Village"{
            let text = "Neighbours in Village"
            let description = descriptionString
            let link = URL(string: "https://takafulsuhar.om/projects")!
            let objectsToShare: [Any] = [text,description ?? "",link]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = sender as! UIView
            self.present(activityVC, animated: true, completion: nil)
        }else if titleText == "Public Charity"{
            let text = "Public Charity"
            let description = descriptionString
            let link = URL(string: "https://takafulsuhar.om/projects")!
            let objectsToShare: [Any] = [text,description ?? "",link]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = sender as! UIView
            self.present(activityVC, animated: true, completion: nil)
        }
        else{
            let text = "Distress Relief"
            let description = descriptionString
            let link = URL(string: "https://takafulsuhar.om/projects")!
            let objectsToShare: [Any] = [text,description ?? "",link]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = sender as! UIView
            self.present(activityVC, animated: true, completion: nil)
        }
        
        
        
        
    }
    
    @objc func cartAdded(){
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
            if titleText == "Daily Sadaqa"{
                let alert = UIAlertController(title: "", message:"Cart Added Sucessfully".l10n(), preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok".l10n(), style: .default, handler: {(_ action: UIAlertAction) -> Void in
                    Constant.isLoginView = true
                    self.tabBarController?.selectedIndex = 0
                    titleCart = "Daily Sadaqa"
                    cartAmount = "5 OMR"
                    cartIconImg = "sadqa"
                    donateCartID = Int(self.sadaquId)
                    donateAmountBtnTitle = "Donate"
                    amountDonate = "5"
                }))
                
                self.present(alert, animated: true, completion: nil)
            }else if titleText == "Friday Charity"{
                let alert = UIAlertController(title: "", message:"Cart Added Sucessfully".l10n(), preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok".l10n(), style: .default, handler: {(_ action: UIAlertAction) -> Void in
                    Constant.isLoginView = true
                    self.tabBarController?.selectedIndex = 0
                    titleCart = "Friday Charity"
                    cartAmount = "5 OMR"
                    cartIconImg = "sadqa"
                    donateCartID = Int(self.sadaquId)
                    amountDonate = "5"
                    donateAmountBtnTitle = "Donate"
                }))
                
                self.present(alert, animated: true, completion: nil)
            }else if titleText == "Neighbours in Village"{
                let alert = UIAlertController(title: "", message:"Cart Added Sucessfully".l10n(), preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok".l10n(), style: .default, handler: {(_ action: UIAlertAction) -> Void in
                    Constant.isLoginView = true
                    self.tabBarController?.selectedIndex = 0
                    titleCart = "Neighbours in Village"
                    cartAmount = "5 OMR"
                    cartIconImg = "sadqa"
                    donateCartID = Int(self.sadaquId)
                    amountDonate = "5"
                    donateAmountBtnTitle = "Donate"
                }))
                
                self.present(alert, animated: true, completion: nil)
            }else if titleText == "Detress Relief"{
                let alert = UIAlertController(title: "", message:"Cart Added Sucessfully".l10n(), preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok".l10n(), style: .default, handler: {(_ action: UIAlertAction) -> Void in
                    Constant.isLoginView = true
                    self.tabBarController?.selectedIndex = 0
                    titleCart = "Detress Relief"
                    cartAmount = "5 OMR"
                    cartIconImg = "sadqa"
                    donateCartID = Int(self.sadaquId)
                    amountDonate = "5"
                    donateAmountBtnTitle = "Donate"
                }))
                self.present(alert, animated: true, completion: nil)
            }
            
        }
    }
    
    @objc func donateAction(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
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
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
                vc.modalTransitionStyle = .coverVertical
                vc.id = Int(sadaquId!)
                vc.titleText = titleText
                self.present(vc, animated: true)
                
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
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
                vc.modalTransitionStyle = .coverVertical
                vc.id = Int(sadaquId!)
                vc.titleText = titleText
                self.present(vc, animated: true)
                
            }
        }
        
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    

}
