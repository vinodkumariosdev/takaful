//
//  NeighborSadaqaVC.swift
//  Tafakul
//
//  Created by Yousuf A Almawli on 13/12/2023.
//

import UIKit
class NeighborSadaqaVC: UIViewController {
    
    
    
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
    
    @IBOutlet weak var chooseCityString: UILabel!
    var descriptionString:String!
    @IBOutlet weak var selectAreaToDonateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let actionClosure = { (action: UIAction) in
             print(action.title)
        }

        let dataSource = [
            "وادي عاهن",
            "الجفرة",
            "الحجرة",
            "الحظيرة",
            "الخويرية",
            "الزعفران",
            "الشبيبات",
            "الشيزاو",
            "الصبارة",
            "الصنقر",
            "الصويحرة",
            "الطريف",
            "العفيفة",
            "العوينات",
            "الغشبة",
            "الفاتك",
            "القطن",
            "الملتقى",
            "المناطق الجبلية",
            "الهمبار",
            "الوقيبة",
            "حارة الشيخ",
            "حلة الشيخ حسان",
            "حي الرفعة",
            "خشيشة الملح",
            "خور السيابي",
            "سيح المكارم",
            "صلان",
            "عمق",
            "عوتب",
            "غيل الشبول",
            "فلج السوق",
            "فلج العوهي",
            "فلج القبائل",
            "كروان",
            "مجان",
            "مجز الكبرى",
            "مجيس",
            "مسيال السدر",
            "مويلح",
            "وادي البدي",
            "وادي الجزي",
            "وادي الحلتي",
            "وادي الصلاحي",
            "وادي العراد",
            "وادي العقق",
            "وادي حيبي",
            "ينبع"]
        
        dataSource.sorted { $0.lowercased() < $1.lowercased() }

        var menuChildren: [UIMenuElement] = []
        for city in dataSource {
            menuChildren.append(UIAction(title: city, handler: actionClosure))
        }
        

        selectAreaToDonateButton.menu = UIMenu(options: .displayInline, children: menuChildren)

        selectAreaToDonateButton.showsMenuAsPrimaryAction = true
        selectAreaToDonateButton.changesSelectionAsPrimaryAction = true

        
        
        
        self.descriptionLbl.text = descriptionString
        userid = UserDefaults.standard.string(forKey: "id")
        sadaqImg.layer.cornerRadius = 15.0
        sadaqImg.layer.masksToBounds = true
        self.titelLbl.text = titleText!
        sadaqImg.contentMode = .scaleAspectFill
        
            if LocalizationSystem.sharedInstance.getLanguage() == "en"{
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
                self.titelLbl.text = "الجار الجنب"
                descriptionLbl.text = "عن عبدالله بن عمر رضي الله عنه أن رسول الله صلى الله عليه وسلم قال ما زالَ جِبْرِيلُ يُوصِينِي بالجارِ، حتّى ظَنَنْتُ أنَّه سَيُوَرِّثُه. رواه البخاري"
                donateBtn.setTitle("الحصول على رابط التبرع", for: .normal)
                sadaqImg.image = UIImage.init(named: imgView)
                self.donateBtn.addTarget(self, action: #selector(donateAction), for: .touchUpInside)
                
                chooseCityString.text = "اختر المنطقة"

            }else{
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
                sadaqImg.image = UIImage.init(named: imgView)
                self.donateBtn.addTarget(self, action: #selector(donateAction), for: .touchUpInside)
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
            let link = URL(string: "http://takafulsuhar.om/projects")!
            let objectsToShare: [Any] = [text,description ?? "",link]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = sender as! UIView
            self.present(activityVC, animated: true, completion: nil)
        }else if titleText == "Friday Charity"{
            let text = "Friday Charity"
            let description = descriptionString
            let link = URL(string: "http://takafulsuhar.om/projects")!
            let objectsToShare: [Any] = [text,description ?? "",link]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = sender as! UIView
            self.present(activityVC, animated: true, completion: nil)
        }else if titleText == "Neighbours in Village"{
            let text = "Neighbours in Village"
            let description = descriptionString
            let link = URL(string: "http://takafulsuhar.om/projects")!
            let objectsToShare: [Any] = [text,description ?? "",link]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = sender as! UIView
            self.present(activityVC, animated: true, completion: nil)
        }else if titleText == "Public Charity"{
            let text = "Public Charity"
            let description = descriptionString
            let link = URL(string: "http://takafulsuhar.om/projects")!
            let objectsToShare: [Any] = [text,description ?? "",link]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = sender as! UIView
            self.present(activityVC, animated: true, completion: nil)
        }
        else{
            let text = "Distress Relief"
            let description = descriptionString
            let link = URL(string: "http://takafulsuhar.om/projects")!
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
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "PhoneSignUpViewController") as! PhoneSignUpViewController
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }))
            
            self.present(alert, animated: true, completion: nil)
        }else{
            
                let alert = UIAlertController(title: "", message:"Cart Added Sucessfully".l10n(), preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok".l10n(), style: .default, handler: {(_ action: UIAlertAction) -> Void in
                    Constant.isLoginView = true
                    self.tabBarController?.selectedIndex = 0
                    titleCart = "Neighbours in Village"
                    cartAmount = "5 OMR"
                    cartIconImg = "sadqa"
                    donateCartID = Int(self.sadaquId)
                    amountDonate = "5"
                    donateAmountBtnTitle = "SMS Generation"
                }))
                
                self.present(alert, animated: true, completion: nil)
            
            
        }
    }
    
    @objc func donateAction(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
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
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
                vc.modalTransitionStyle = .coverVertical
                vc.id = Int(sadaquId!)
                vc.titleText = titleText
                vc.areaLocation = self.selectAreaToDonateButton.titleLabel?.text ?? ""
                self.present(vc, animated: true)
                
            }
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
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
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
                vc.modalTransitionStyle = .coverVertical
                vc.id = Int(sadaquId!)
                vc.titleText = titleText
                vc.areaLocation = self.selectAreaToDonateButton.titleLabel?.text ?? ""
                self.present(vc, animated: true)
                
            }
        }
        
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    

}


