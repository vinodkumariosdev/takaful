//
//  ProjectDetailsVC.swift
//  Tafakul
//
//  Created by Yousuf A Almawli on 12/12/2023.
//

import UIKit

class ProjectDetailsVC: UIViewController {
    
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
    
    @IBOutlet weak var projectIDBox: UILabel!
    var imgView:String!
    
    var titleText:String!
    
    var userid:String!
    
    var descriptionString:String!
    var dataObj:[String: Any]!
    @IBOutlet weak var remainingLabel: UILabel!
    @IBOutlet weak var collectedLabel: UILabel!
    @IBOutlet weak var remainingAmount: UILabel!
    @IBOutlet weak var collectedAmount: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userid = UserDefaults.standard.string(forKey: "id")
        sadaqImg.layer.cornerRadius = 15.0
        sadaqImg.layer.masksToBounds = true
        self.titelLbl.text = titleText!
        sadaqImg.contentMode = .scaleAspectFill
        var data = self.dataObj
        self.descriptionLbl.text = data?["description"] as? String ?? ""
        
        self.projectIDBox.text = "Project No: \(self.sadaquId!)"

        let image = data?["image"] as? String ?? ""
        if image != "" {
            let url = URL(string: image)
            sadaqImg.kf.setImage(with: url)
        }
        let title = data!["ar_title"] as? String ?? ""
        let amount = data!["amount"] as? String ?? ""
        var raised = data!["raised"] as? String ?? ""

        let value = Double(raised)! / Double(amount)! * 100
        var IntValue = Int(value)
        var remaing = Double(amount)! - Double(raised)!
        if(remaing < 0) {
            remaing = 0
        }


        if(IntValue > 100) {
            IntValue = 100
        }
        self.progressBar.progress = Float(IntValue / 100)
        
        self.progressBar.transform = CGAffineTransformMakeScale(1, 1)

        self.collectedAmount.text = "\(raised) OMR"
        self.remainingAmount.text = "\(remaing) OMR"
        self.cartImg.addTarget(self, action: #selector(cartAdded), for: .touchUpInside)
        self.shareBtn.addTarget(self, action: #selector(shareBtnOption), for: .touchUpInside)
        self.donateBtn.addTarget(self, action: #selector(donateAction), for: .touchUpInside)
        

        
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            self.projectIDBox.text = "رقم المشروع: \(self.sadaquId!)"
            donateBtn.setTitle("الحصول على رابط التبرع", for: .normal)
            self.remainingLabel.text = "المتبقي"
            self.collectedLabel.text = "المستلم"
            
        }else{
            donateBtn.setTitle("Donate Now", for: .normal)
        }

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
        let index = sender.tag
        let title = self.titleText
        let amountS = self.dataObj!["amount"] as? String ?? "0"
        let amount = "\(amountS) OMR"
        let link = "https://takafulsuhar.om/projects"
        let textShare = [title,amount,link ]
        let activityViewController = UIActivityViewController(activityItems: textShare , applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
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
            if titleText == "Daily Sadaqa"{
                let alert = UIAlertController(title: "", message:"Cart Added Sucessfully".l10n(), preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok".l10n(), style: .default, handler: {(_ action: UIAlertAction) -> Void in
                    Constant.isLoginView = true
                    self.tabBarController?.selectedIndex = 0
                    titleCart = "Daily Sadaqa"
                    cartAmount = "5 OMR"
                    cartIconImg = "sadqa"
                    donateCartID = Int(self.sadaquId)
                    donateAmountBtnTitle = "SMS Generation"
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
                    donateAmountBtnTitle = "SMS Generation"
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
                    donateAmountBtnTitle = "SMS Generation"
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
                    donateAmountBtnTitle = "SMS Generation"
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
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "PhoneSignUpViewController") as! PhoneSignUpViewController
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }))
                
                self.present(alert, animated: true, completion: nil)
            }else{
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
                        vc.modalTransitionStyle = .coverVertical
                        vc.titleText = self.titleText
                        vc.id = Int(self.sadaquId)
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
                vc.titleText = self.titleText
                vc.id = Int(self.sadaquId)
                self.present(vc, animated: true)

            }
        }
        
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    

}
