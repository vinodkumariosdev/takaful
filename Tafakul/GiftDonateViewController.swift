//
//  GiftDonateViewController.swift
//  Tafakul
//
//  Created by apple on 24/05/23.
//

import UIKit

class GiftDonateViewController: UIViewController {

    @IBOutlet weak var headingLb: UILabel!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var donate5Btn: UIButton!
    
    @IBOutlet weak var donate10Btn: UIButton!
    
    @IBOutlet weak var donate20Btn: UIButton!
    
    @IBOutlet weak var amountLbl: UILabel!
    
    @IBOutlet weak var donateNowBtn: UIButton!
    
    @IBOutlet weak var clotingView: UIView!
    
    var amount:Int?
    
    var headTextlbl:String?
    
    var id:Int?
    
    var isOtherCharity:String?
    
    @IBOutlet weak var donate30Btn: UIButton!
    
    @IBOutlet weak var donate360Btn: UIButton!
    
    @IBOutlet weak var amountclothingLbl: UILabel!
    
    @IBOutlet weak var clotingDonateBtn: UIButton!
    
    @IBOutlet weak var anotherTitleLabel: UILabel!
    var clothinAmount:Int?
    
    @IBOutlet weak var chooseGiftAmtLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        chooseGiftAmtLbl.text = "اختر مبلغ الهدية"
//        donateNowBtn.setTitle("الحصول على رابط التبرع", for: .normal)
//        

        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            backBtn.setImage(UIImage.init(named: "ArabicBackIcon"), for: .normal)
            
            chooseGiftAmtLbl.text = "اختر مبلغ الهدية"
            anotherTitleLabel.text = "اختر مبلغ الهدية"
            donateNowBtn.setTitle("الحصول على رابط التبرع", for: .normal)
            clotingDonateBtn.setTitle("الحصول على رابط التبرع", for: .normal)


            if isOtherCharity == "OtherCharity"{
                clotingView.isHidden = false
                headingLb.text = headTextlbl ?? ""
                clothinAmount = 30
                let totalAmounts = "المبلغ الإجمالي"
                amountclothingLbl.text = "\(totalAmounts) \(clothinAmount ?? 0) ر.ع"
                donate30Btn.addTarget(self, action: #selector(thirtyBtn), for: .touchUpInside)
                donate360Btn.addTarget(self, action: #selector(thirtysixBtn), for: .touchUpInside)
                clotingDonateBtn.addTarget(self, action: #selector(clotinDonateNowBtn), for: .touchUpInside)
                

            }else{
                clotingView.isHidden = true
                headingLb.text = headTextlbl ?? ""
                amount = 5
                let totalAmounts = "المبلغ الإجمالي"
                amountLbl.text = "\(totalAmounts) \(amount ?? 0) ر.ع"
                donate5Btn.addTarget(self, action: #selector(fivebtn), for: .touchUpInside)
                donate10Btn.addTarget(self, action: #selector(tenbtn), for: .touchUpInside)
                donate20Btn.addTarget(self, action: #selector(twentybtn), for: .touchUpInside)
                donateNowBtn.addTarget(self, action: #selector(DonateNowBtn), for: .touchUpInside)
            }
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            donateNowBtn.setTitle("Donate Now", for: .normal)
            backBtn.setImage(UIImage.init(named: "BackButton"), for: .normal)
            chooseGiftAmtLbl.text = "Choose Gift Amount"
            if isOtherCharity == "OtherCharity"{
                clotingView.isHidden = false
                headingLb.text = headTextlbl ?? ""
                clothinAmount = 30
                amountclothingLbl.text = "Total amounts \(clothinAmount ?? 0) OMR"
                donate30Btn.addTarget(self, action: #selector(thirtyBtn), for: .touchUpInside)
                donate360Btn.addTarget(self, action: #selector(thirtysixBtn), for: .touchUpInside)
                clotingDonateBtn.addTarget(self, action: #selector(clotinDonateNowBtn), for: .touchUpInside)
            }else{
                clotingView.isHidden = true
                headingLb.text = headTextlbl ?? ""
                amount = 5
                amountLbl.text = "Total amounts \(amount ?? 0) OMR"
                donate5Btn.addTarget(self, action: #selector(fivebtn), for: .touchUpInside)
                donate10Btn.addTarget(self, action: #selector(tenbtn), for: .touchUpInside)
                donate20Btn.addTarget(self, action: #selector(twentybtn), for: .touchUpInside)
                donateNowBtn.addTarget(self, action: #selector(DonateNowBtn), for: .touchUpInside)
            }
        }
        
    }
    
    @objc func thirtyBtn(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            let totalAmounts = "المبلغ الإجمالي"
            self.amountclothingLbl.text = "\(totalAmounts) 30 ر.ع"
            self.clothinAmount = 30
            donate30Btn.setImage(UIImage(named: "donation_30"), for: UIControl.State.normal)
            donate360Btn.setImage(UIImage(named: "donation_360"), for: UIControl.State.normal)
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            self.amountclothingLbl.text = "Total amounts 30 OMR"
            self.clothinAmount = 30
            donate30Btn.setImage(UIImage(named: "donation_30"), for: UIControl.State.normal)
            donate360Btn.setImage(UIImage(named: "donation_360"), for: UIControl.State.normal)
        }
        
    }
    
    @objc func thirtysixBtn(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            let totalAmounts = "المبلغ الإجمالي"
            self.amountclothingLbl.text = "\(totalAmounts) 360 ر.ع"
            self.clothinAmount = 360
            donate30Btn.setImage(UIImage(named: "donation_30_1"), for: UIControl.State.normal)
            donate360Btn.setImage(UIImage(named: "donation_360_1"), for: UIControl.State.normal)
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            self.amountclothingLbl.text = "Total amounts 360 OMR"
            self.clothinAmount = 360
            donate30Btn.setImage(UIImage(named: "donation_30_1"), for: UIControl.State.normal)
            donate360Btn.setImage(UIImage(named: "donation_360_1"), for: UIControl.State.normal)
        }
        
    }
    
    @objc func fivebtn(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            let totalAmounts = "المبلغ الإجمالي"
            self.amountLbl.text = "\(totalAmounts) 5 ر.ع"
            self.amount = 5
            donate5Btn.setImage(UIImage(named: "donation_5_1"), for: UIControl.State.normal)
            donate10Btn.setImage(UIImage(named: "donation_10"), for: UIControl.State.normal)
            donate20Btn.setImage(UIImage(named: "donation_20"), for: UIControl.State.normal)
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            self.amountLbl.text = "Total amounts 5 OMR"
            self.amount = 5
            donate5Btn.setImage(UIImage(named: "donation_5_1"), for: UIControl.State.normal)
            donate10Btn.setImage(UIImage(named: "donation_10"), for: UIControl.State.normal)
            donate20Btn.setImage(UIImage(named: "donation_20"), for: UIControl.State.normal)
        }
        
    }
    
    @objc func tenbtn(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            let totalAmounts = "المبلغ الإجمالي"
            self.amountLbl.text = "\(totalAmounts) 10 ر.ع"
            self.amount = 10
            donate5Btn.setImage(UIImage(named: "donation_5"), for: UIControl.State.normal)
            donate10Btn.setImage(UIImage(named: "donation_10_2"), for: UIControl.State.normal)
            donate20Btn.setImage(UIImage(named: "donation_20"), for: UIControl.State.normal)
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            self.amountLbl.text = "Total amounts 10 OMR"
            self.amount = 10
            donate5Btn.setImage(UIImage(named: "donation_5"), for: UIControl.State.normal)
            donate10Btn.setImage(UIImage(named: "donation_10_2"), for: UIControl.State.normal)
            donate20Btn.setImage(UIImage(named: "donation_20"), for: UIControl.State.normal)
        }
        
    }
    
    @objc func twentybtn(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            let totalAmounts = "المبلغ الإجمالي"
            self.amountLbl.text = "\(totalAmounts) 20 ر.ع"
            self.amount = 20
            donate5Btn.setImage(UIImage(named: "donation_5"), for: UIControl.State.normal)
            donate10Btn.setImage(UIImage(named: "donation_10"), for: UIControl.State.normal)
            donate20Btn.setImage(UIImage(named: "donation_20_2"), for: UIControl.State.normal)
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            self.amountLbl.text = "Total amounts 20 OMR"
            self.amount = 20
            donate5Btn.setImage(UIImage(named: "donation_5"), for: UIControl.State.normal)
            donate10Btn.setImage(UIImage(named: "donation_10"), for: UIControl.State.normal)
            donate20Btn.setImage(UIImage(named: "donation_20_2"), for: UIControl.State.normal)
        }
        
    }
    
    @objc func DonateNowBtn(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DonateGiftDetailsViewController") as! DonateGiftDetailsViewController
        vc.modalTransitionStyle = .coverVertical
        self.definesPresentationContext = true
        vc.amount = "\(amount ?? 0)"
        vc.id = id ?? 0
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func clotinDonateNowBtn(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DonateGiftDetailsViewController") as! DonateGiftDetailsViewController
        vc.modalTransitionStyle = .coverVertical
        self.definesPresentationContext = true
        vc.amount = "\(clothinAmount ?? 0)"
        vc.id = id ?? 0
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
    }

    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
