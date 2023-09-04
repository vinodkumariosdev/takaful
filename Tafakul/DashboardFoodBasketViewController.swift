//
//  DashboardFoodBasketViewController.swift
//  Tafakul
//
//  Created by apple on 03/01/23.
//

import UIKit
import SwiftUI

class DashboardFoodBasketViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var sacrificeMoreVieww: UIView!
    
    @IBOutlet weak var sacrificelbl1: UILabel!
    
    @IBOutlet weak var sacrificeLbl2: UILabel!
    
    @IBOutlet weak var sacrificeLbl3: UILabel!
    
    @IBOutlet weak var headinglbl: UILabel!
    
    @IBOutlet weak var expirationBrokenlbl: UILabel!
    
    @IBOutlet weak var expirationAuthVieww: UIView!
    
    @IBOutlet weak var foodBasketVieww: UIView!
    
    @IBOutlet weak var foodBasketImg: UIImageView!
    
    @IBOutlet weak var expirationImg: UIImageView!{
        didSet{
            self.expirationImg.layer.cornerRadius = 15.0
            self.expirationImg.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var aqiqahVieww: UIView!
    @IBOutlet weak var donateRansomBtn: UIButton!
    var result:Int?
    var ransomResult:Double?
    var ransomAmount:Int?
    
    @IBOutlet weak var ransomVivew: UIView!
    @IBOutlet weak var sacrificeHeadingLbl: UILabel!
    @IBOutlet weak var sacrificeImg: UIImageView!
    @IBOutlet weak var sacrificelbl: UILabel!
    @IBOutlet weak var sacrificeTotalAmountTF: UITextField!{
        didSet{
            self.sacrificeTotalAmountTF.layer.cornerRadius = 15.0
            self.sacrificeTotalAmountTF.layer.masksToBounds = true
            self.sacrificeTotalAmountTF.layer.borderColor = UIColor.blue.cgColor
            self.sacrificeTotalAmountTF.layer.borderWidth = 1.0
            self.sacrificeTotalAmountTF.isUserInteractionEnabled = false
        }
    }
    
    @IBOutlet weak var sacrificeDonateBtn: UIButton!{
        didSet{
            self.sacrificeDonateBtn.layer.cornerRadius = 15.0
            self.sacrificeDonateBtn.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var sacrificeAddcartBtn: UIButton!{
        didSet{
            self.sacrificeAddcartBtn.layer.cornerRadius = 15.0
            self.sacrificeAddcartBtn.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var sacrificelblAmount: UILabel!
    
    @IBOutlet weak var otherAmountTF: UITextField!{
        didSet{
            self.otherAmountTF.layer.cornerRadius = 15.0
            self.otherAmountTF.layer.masksToBounds = true
            self.otherAmountTF.layer.borderColor = UIColor.blue.cgColor
            self.otherAmountTF.layer.borderWidth = 1.0
        }
    }
    
    @IBOutlet weak var expirationDayText: UITextField!
    
    @IBOutlet weak var TotalAmountTF: UITextField!{
        didSet{
            self.TotalAmountTF.isUserInteractionEnabled = false
            self.TotalAmountTF.layer.cornerRadius = 15.0
            self.TotalAmountTF.layer.masksToBounds = true
            self.TotalAmountTF.layer.borderColor = UIColor.blue.cgColor
            self.TotalAmountTF.layer.borderWidth = 1.0
        }
    }
    
    @IBOutlet weak var vowAmtLbl: UILabel!
    
    @IBOutlet weak var vowNumebrTF: UITextField!{
        didSet{
            self.vowNumebrTF.layer.cornerRadius = 10.0
            self.vowNumebrTF.layer.masksToBounds = true
            self.vowNumebrTF.layer.borderColor = UIColor.blue.cgColor
            self.vowNumebrTF.layer.borderWidth = 1.0
        }
    }
    
    @IBOutlet weak var vow45Btn: UIButton!
    
    @IBOutlet weak var vow250Btn: UIButton!
    
    @IBOutlet weak var cashBtn: UIButton!
    
    @IBOutlet weak var totalAmountLbl: UILabel!
    
    @IBOutlet weak var expiration20Btn: UIButton!
    
    @IBOutlet weak var oneBtn: UIButton!
    
    @IBOutlet weak var dayHeigthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var fiveBtn: UIButton!
    
    @IBOutlet weak var tenBtn: UIButton!
    
    @IBOutlet weak var twentyBtnAction: UIButton!
    
    @IBOutlet weak var donateBtn: UIButton!{
        didSet{
            self.donateBtn.layer.cornerRadius = 15.0
            self.donateBtn.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var expirationDonateBtn: UIButton!{
        didSet{
            self.expirationDonateBtn.layer.cornerRadius = 15.0
            self.expirationDonateBtn.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var vowVieww: UIView!
    
    @IBOutlet weak var fifteenBtn: UIButton!
    
    @IBOutlet weak var expirationOtherAmtTF: UITextField!{
        didSet{
            self.expirationOtherAmtTF.layer.cornerRadius = 10.0
            self.expirationOtherAmtTF.layer.masksToBounds = true
            self.expirationOtherAmtTF.layer.borderColor = UIColor.blue.cgColor
            self.expirationOtherAmtTF.layer.borderWidth = 1.0
        }
    }
    
    @IBOutlet weak var expirationTotalamtTF: UITextField!{
        didSet{
            self.expirationTotalamtTF.isUserInteractionEnabled = false
            self.expirationTotalamtTF.layer.cornerRadius = 10.0
            self.expirationTotalamtTF.layer.masksToBounds = true
            self.expirationTotalamtTF.layer.borderColor = UIColor.blue.cgColor
            self.expirationTotalamtTF.layer.borderWidth = 1.0
        }
    }
    
    @IBOutlet weak var expirationAmtLbl: UILabel!
    var foodamountValue:String!
    var BasketId:Int!
    var Food1myValue:String!
    var Food5myValue:String!
    var Food10myValue:String!
    var Food20myValue:String!
    var isExpirationAuth:String!
    var expirationAmt:String!
    var expirationId:Int!
    var isAquiuah:String!
    var isSacrifice:String!
    var sacrificeId:Int!
    var sacrificeAmount:String!
    var isVow:String!
    var isFastingRansom:String!
    var isSacrificeMore:String!
    var foodbasket:String?
    var nextDoor: String?
    var nextDoorId: Int?
    var expitationsAuth:String?
    var sacrifice45AmtValue:Int?
    var sacrifice250AmtValue:Int?
    var ransomAmt:Int?
    var vowAmt:Int?
    var aqiqahAmt:Int?
    var sacrificeMoreAmt:Int?
    
    @IBOutlet weak var ransomTF: UITextField!
    
    @IBOutlet weak var sacrifice250Btn: UIButton!
    
    @IBOutlet weak var sacrificeNumberTF: UITextField!{
        didSet{
            self.sacrificeNumberTF.layer.cornerRadius = 15.0
            self.sacrificeNumberTF.layer.masksToBounds = true
            self.sacrificeNumberTF.layer.borderColor = UIColor.blue.cgColor
            self.sacrificeNumberTF.layer.borderWidth = 1.0
        }
    }
    
    @IBOutlet weak var sacrifice45Btn: UIButton!
    
    @IBOutlet weak var sacrificeAmtLbl: UILabel!
    
    @IBOutlet weak var sacrificeVieww: UIView!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var dismissBtn: UIButton!
    
    @IBOutlet weak var ThreeTwelveBtn: UIButton!
    
    @IBOutlet weak var fourtyFiveBtn: UIButton!
    
    @IBOutlet weak var fourtyFiveBtn2: UIButton!
    
    @IBOutlet weak var sacrificeMore315Btn: UIButton!
    
    @IBOutlet weak var sacrificeMore45Btn: UIButton!
    
    @IBOutlet weak var sacrificeMore45Btn1: UIButton!
    
    @IBOutlet weak var expitationOathVieww: UIView!
    
    @IBOutlet weak var sacrificeMoreTF: UITextField!{
        didSet{
            self.sacrificeMoreTF.layer.cornerRadius = 15.0
            self.sacrificeMoreTF.layer.masksToBounds = true
            self.sacrificeMoreTF.layer.borderColor = UIColor.blue.cgColor
            self.sacrificeMoreTF.layer.borderWidth = 1.0
        }
    }
    
    @IBOutlet weak var sacrificeCattleLbl: UILabel!
    
    @IBOutlet weak var sacrificeSheepLbl: UILabel!
    
    @IBOutlet weak var DonateSacBtn: UIButton!
    
    @IBOutlet weak var sacrificeAddCartBtn: UIButton!
    
    @IBOutlet weak var foodBasektBtn: UIButton!
    
    @IBOutlet weak var sacrificeMoreLbl: UILabel!
    
    @IBOutlet weak var cartAddedBtn: UIButton!{
        didSet{
            self.cartAddedBtn.layer.cornerRadius = 15.0
            self.cartAddedBtn.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var donateExpitationBtn: UIButton!{
        didSet{
            self.donateExpitationBtn.layer.cornerRadius = 15.0
            self.donateExpitationBtn.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var aqiqah45Btn: UIButton!
    
    @IBOutlet weak var aqiqahNumberLbl: UILabel!
    
    @IBOutlet weak var aqiqahNumberTF: UITextField!
    {
       didSet{
           self.aqiqahNumberTF.layer.cornerRadius = 15.0
           self.aqiqahNumberTF.layer.masksToBounds = true
           self.aqiqahNumberTF.layer.borderColor = UIColor.blue.cgColor
           self.aqiqahNumberTF.layer.borderWidth = 1.0
       }
    }
    @IBOutlet weak var numberOathExpitationsTF: UITextField!{
        didSet{
            self.numberOathExpitationsTF.layer.cornerRadius = 15.0
            self.numberOathExpitationsTF.layer.masksToBounds = true
            self.numberOathExpitationsTF.layer.borderColor = UIColor.blue.cgColor
            self.numberOathExpitationsTF.layer.borderWidth = 1.0
        }
    }
    
    @IBOutlet weak var expitationLbl: UILabel!
    
    @IBOutlet weak var ransomAmtLbl: UILabel!
    
    @IBOutlet weak var foodbasktHeadLbl: UILabel!
    
    @IBOutlet weak var foodbsktLbl: UILabel!
    
    @IBOutlet weak var addcartBtn: UIButton!
    
    @IBOutlet weak var expitationBackBtn: UIButton!
    
    @IBOutlet weak var expitationBackLbl: UILabel!
    
    @IBOutlet weak var sacrificeBackBtn: UIButton!
    
    @IBOutlet weak var sacrificeLbl: UILabel!
    
    @IBOutlet weak var ransomLbl: UILabel!
    
    @IBOutlet weak var DashboardRansomBackBtn: UIButton!
    
    @IBOutlet weak var ransomAddCartBtn: UIButton!
    
    @IBOutlet weak var ransomADayLbl: UILabel!
    
    
    @IBOutlet weak var sacrificeMoreBackBtn: UIButton!
    
    @IBOutlet weak var DonaterRansomBtnn: UIButton!
    
   
    @IBOutlet weak var moreSacLbl: UILabel!
    
    @IBOutlet weak var moreSacrificecattleLbl: UILabel!
    
    @IBOutlet weak var moreSacCattlesLbl: UILabel!
    
    @IBOutlet weak var moreSacSheepLbl: UILabel!
    
    @IBOutlet weak var sacrificeMoreCartAddedBtn: UIButton!
    
    
    @IBOutlet weak var DonateSacrificeMoreDonateBtn: UIButton!
    
    @IBOutlet weak var vowBackBtn: UIButton!
    
    @IBOutlet weak var vowLbl: UILabel!
    
    @IBOutlet weak var vowCashLbl: UILabel!
    
    @IBOutlet weak var vowCattleLbl: UILabel!
    
    @IBOutlet weak var vowSheepLbl: UILabel!
    
    @IBOutlet weak var vowAddCartBtn: UIButton!
    
    @IBOutlet weak var vowDonateNowBtn: UIButton!
    
    @IBOutlet weak var AquiahBackBtn: UIButton!
    
    @IBOutlet weak var AquiahLbl: UILabel!
    
    @IBOutlet weak var AquiahSheepLbl: UILabel!
    
    
    @IBOutlet weak var AquiahSheepAddcartBtn: UIButton!
    
    @IBOutlet weak var AquiuahDonateBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            otherAmountTF.delegate = self
            sacrificeNumberTF.delegate = self
            numberOathExpitationsTF.delegate = self
            numberOathExpitationsTF.text = ""
            self.expirationAmt = "15"
            let totalAmounts = "المبلغ الإجمالي"
            self.expitationLbl.text = "\(totalAmounts) 15 ر.ع"
            Food1myValue = "1"
            self.expitationBackLbl.text = "كفارة حنث اليمين"
            donateExpitationBtn.setTitle("تبرع الآن", for: .normal)
            cartAddedBtn.setTitle("اضافة للعربة", for: .normal)
            expitationBackBtn.setImage(UIImage.init(named: "ArabicBackIcon"), for: .normal)
            numberOathExpitationsTF.textAlignment = .center
            numberOathExpitationsTF.placeholder = "عدد الكفارات"
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            otherAmountTF.delegate = self
            self.expitationBackLbl.text = "Expiration For A Broken Oath."
            expitationBackBtn.setImage(UIImage.init(named: "BackButton"), for: .normal)
            sacrificeNumberTF.delegate = self
            numberOathExpitationsTF.delegate = self
            numberOathExpitationsTF.text = ""
            self.expirationAmt = "15"
            expitationLbl.text = "Total amounts 15 OMR"
            Food1myValue = "1"
            cartAddedBtn.setTitle("Add Cart", for: .normal)
            donateExpitationBtn.setTitle("Donate Now", for: .normal)
            numberOathExpitationsTF.textAlignment = .center
            numberOathExpitationsTF.placeholder = "Number Of Oath"
        }
        
        if isExpirationAuth == "expirationFromDashboard"{
            self.expitationOathVieww.isHidden = false
            self.foodBasketVieww.isHidden = true
            self.sacrificeVieww.isHidden = true
            self.ransomVivew.isHidden = true
            self.vowVieww.isHidden = true
            self.aqiqahVieww.isHidden = true
            self.sacrificeMoreVieww.isHidden = true
        }
        
        if nextDoor == "fromDashboardNextDoor" {
            if LocalizationSystem.sharedInstance.getLanguage() == "en"{
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
                self.foodBasketVieww.isHidden = false
                self.expitationOathVieww.isHidden = true
                self.sacrificeVieww.isHidden = true
                self.ransomVivew.isHidden = true
                self.vowVieww.isHidden = true
                self.aqiqahVieww.isHidden = true
                self.sacrificeMoreVieww.isHidden = true
                
                self.foodBasektBtn.setImage(UIImage.init(named: "ArabicBackIcon"), for: .normal)
                foodbasktHeadLbl.text = "الجار الجنب"
                foodbsktLbl.text = "عن عبد الله بن عمر رضي الله عنه أن رسول الله صلى الله عليه وسلم قال لي مازال جبريل يطلعني على الجار حتى ظننت أنه سيرثه. رواه البخاري"
                otherAmountTF.textAlignment = .right
                foodbsktLbl.numberOfLines = 5
                otherAmountTF.placeholder = "عدد السلّات"
                donateBtn.setTitle("تبرع الآن", for: .normal)
                addcartBtn.setTitle("اضافة للعربة", for: .normal)
            }else{
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
                self.foodBasketVieww.isHidden = false
                self.expitationOathVieww.isHidden = true
                self.sacrificeVieww.isHidden = true
                self.ransomVivew.isHidden = true
                self.vowVieww.isHidden = true
                self.aqiqahVieww.isHidden = true
                self.sacrificeMoreVieww.isHidden = true
                self.foodBasektBtn.setImage(UIImage.init(named: "BackButton"), for: .normal)
                foodbasktHeadLbl.text = "Neighbours in Village"
                foodbsktLbl.text = "On the authority of Abdulla bin Omar, may God be pleased with him, that the Messenger of God, may God's prayers and peace be upon him, said Gabriel still advised me about the neighbour, until I thought that he would inherit it. Narrated by Al-Bukhari"
                foodbsktLbl.numberOfLines = 5
                otherAmountTF.textAlignment = .left
                otherAmountTF.placeholder = "Number of Baskets"
                donateBtn.setTitle("Donate Now", for: .normal)
                addcartBtn.setTitle("Add Cart", for: .normal)
            }
            
            otherAmountTF.isHidden = true

        }
        

        if foodbasket == "fromDashboard"{
            if LocalizationSystem.sharedInstance.getLanguage() == "en"{
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
                self.foodBasketVieww.isHidden = false
                self.expitationOathVieww.isHidden = true
                self.sacrificeVieww.isHidden = true
                self.ransomVivew.isHidden = true
                self.vowVieww.isHidden = true
                self.aqiqahVieww.isHidden = true
                self.sacrificeMoreVieww.isHidden = true
                self.foodBasektBtn.setImage(UIImage.init(named: "ArabicBackIcon"), for: .normal)
                foodbasktHeadLbl.text = "سلة طعام"
                foodbsktLbl.text = "سلة طعام"
                otherAmountTF.textAlignment = .right
                otherAmountTF.placeholder = "عدد السلّات"
                donateBtn.setTitle("تبرع الآن", for: .normal)
                addcartBtn.setTitle("اضافة للعربة", for: .normal)
            }else{
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
                self.foodBasketVieww.isHidden = false
                self.expitationOathVieww.isHidden = true
                self.sacrificeVieww.isHidden = true
                self.ransomVivew.isHidden = true
                self.vowVieww.isHidden = true
                self.aqiqahVieww.isHidden = true
                self.sacrificeMoreVieww.isHidden = true
                self.foodBasektBtn.setImage(UIImage.init(named: "BackButton"), for: .normal)
                foodbasktHeadLbl.text = "Food Basket"
                foodbsktLbl.text = "Food Basket"
                otherAmountTF.textAlignment = .left
                otherAmountTF.placeholder = "Number of Baskets"
                donateBtn.setTitle("Donate Now", for: .normal)
                addcartBtn.setTitle("Add Cart", for: .normal)
            }
            
        }
        if isSacrifice == "Sacrifice"{
            if LocalizationSystem.sharedInstance.getLanguage() == "en"{
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
                self.foodBasketVieww.isHidden = true
                self.expitationOathVieww.isHidden = true
                self.sacrificeVieww.isHidden = false
                self.vowVieww.isHidden = true
                self.ransomVivew.isHidden = true
                self.aqiqahVieww.isHidden = true
                self.sacrificeMoreVieww.isHidden = true
                sacrifice45Btn.addTarget(self, action: #selector(sacrifice45BtnAction), for: .touchUpInside)
                sacrifice250Btn.addTarget(self, action: #selector(sacrifice250BtnAction), for: .touchUpInside)
                sacrificeAmount = "45"
                sacrifice45AmtValue = 45
                let totalAmounts = "المبلغ الإجمالي"
                self.sacrificeAmtLbl.text = "\(totalAmounts) 45 ر.ع"
                DonateSacBtn.setTitle("تبرع الآن", for: .normal)
                sacrificeAddCartBtn.setTitle("اضافة للعربة", for: .normal)
                sacrificeCattleLbl.text = "ماشية"
                sacrificeSheepLbl.text = "خروف"
                sacrificeNumberTF.textAlignment = .center
                sacrificeNumberTF.placeholder = "رقم"
                sacrificeLbl.text = "الأضاحي"
                sacrificeBackBtn.setImage(UIImage.init(named: "ArabicBackIcon"), for: .normal)
            }else{
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
                self.foodBasketVieww.isHidden = true
                sacrificeLbl.text = "Sacrifice"
                sacrificeBackBtn.setImage(UIImage.init(named: "BackButton"), for: .normal)
                self.expitationOathVieww.isHidden = true
                self.sacrificeVieww.isHidden = false
                self.vowVieww.isHidden = true
                self.ransomVivew.isHidden = true
                self.aqiqahVieww.isHidden = true
                self.sacrificeMoreVieww.isHidden = true
                sacrifice45Btn.addTarget(self, action: #selector(sacrifice45BtnAction), for: .touchUpInside)
                sacrifice250Btn.addTarget(self, action: #selector(sacrifice250BtnAction), for: .touchUpInside)
                sacrificeAmount = "45"
                sacrifice45AmtValue = 45
                sacrificeAmtLbl.text = "Total amounts 45 OMR"
                sacrificeCattleLbl.text = "Cattle"
                sacrificeSheepLbl.text = "Sheep"
                DonateSacBtn.setTitle("Donate Now", for: .normal)
                sacrificeAddCartBtn.setTitle("Add Cart", for: .normal)
                sacrificeNumberTF.textAlignment = .center
                sacrificeNumberTF.placeholder = "Number"
            }
            
        }
        if isFastingRansom == "IsFastingRansom"{
            if LocalizationSystem.sharedInstance.getLanguage() == "en"{
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
                ransomTF.delegate = self
                self.vowVieww.isHidden = true
                self.foodBasketVieww.isHidden = true
                self.expitationOathVieww.isHidden = true
                self.sacrificeVieww.isHidden = true
                self.ransomVivew.isHidden = false
                self.aqiqahVieww.isHidden = true
                self.sacrificeMoreVieww.isHidden = true
                ransomAmount = Int(1.5)
                let totalAmounts = "المبلغ الإجمالي"
                self.ransomAmtLbl.text = "\(totalAmounts) 1.5 ر.ع"
                donateRansomBtn.addTarget(self, action: #selector(ransomDonateBtnAction), for: .touchUpInside)
                ransomLbl.text = "فدية صيام"
                DashboardRansomBackBtn.setImage(UIImage.init(named: "ArabicBackIcon"), for: .normal)
                ransomADayLbl.text = "يوم"
                ransomTF.textAlignment = .center
                ransomTF.placeholder = "عدد الأيام"
                DonaterRansomBtnn.setTitle("تبرع الآن", for: .normal)
                ransomAddCartBtn.setTitle("اضافة للعربة", for: .normal)
            }else{
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
                ransomTF.delegate = self
                self.vowVieww.isHidden = true
                self.foodBasketVieww.isHidden = true
                self.expitationOathVieww.isHidden = true
                self.sacrificeVieww.isHidden = true
                self.ransomVivew.isHidden = false
                self.aqiqahVieww.isHidden = true
                self.sacrificeMoreVieww.isHidden = true
                ransomAmount = Int(1.5)
                donateRansomBtn.addTarget(self, action: #selector(ransomDonateBtnAction), for: .touchUpInside)
                ransomLbl.text = "Fasting Ransom"
                DashboardRansomBackBtn.setImage(UIImage.init(named: "BackButton"), for: .normal)
                ransomADayLbl.text = "A Day"
                ransomTF.textAlignment = .center
                ransomTF.placeholder = "Number Of Days"
                DonaterRansomBtnn.setTitle("Donate Now", for: .normal)
                ransomAddCartBtn.setTitle("Add Cart", for: .normal)
            }
            
        }
        if isVow == "Vow"{
            if LocalizationSystem.sharedInstance.getLanguage() == "en"{
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
                vowBackBtn.setImage(UIImage.init(named: "ArabicBackIcon"), for: .normal)
                vowLbl.text = "نذر"
                vowSheepLbl.text = "خروف"
                vowCashLbl.text = "مبالغ نقدية"
                vowCattleLbl.text = "ماشية"
                vowDonateNowBtn.setTitle("تبرع الآن", for: .normal)
                vowAddCartBtn.setTitle("اضافة للعربة", for: .normal)
                vowNumebrTF.delegate = self
                self.vowVieww.isHidden = false
                vowNumebrTF.textAlignment = .center
                vowNumebrTF.placeholder = "رقم"
                self.foodBasketVieww.isHidden = true
                self.expitationOathVieww.isHidden = true
                self.sacrificeVieww.isHidden = true
                self.ransomVivew.isHidden = true
                self.aqiqahVieww.isHidden = true
                self.sacrificeMoreVieww.isHidden = true
                vowAmt = 45
                let totalAmounts = "المبلغ الإجمالي"
                self.vowAmtLbl.text = "\(totalAmounts) 45 ر.ع"
                vow45Btn.addTarget(self, action: #selector(vow45BtnAction), for: .touchUpInside)
                vow250Btn.addTarget(self, action: #selector(vow250BtnAction), for: .touchUpInside)
            }else{
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
                vowBackBtn.setImage(UIImage.init(named: "BackButton"), for: .normal)
                vowLbl.text = "Vow"
                vowSheepLbl.text = "Sheep"
                vowCashLbl.text = "Cash"
                vowCattleLbl.text = "Cattle"
                vowNumebrTF.delegate = self
                vowNumebrTF.textAlignment = .center
                vowNumebrTF.placeholder = "Number"
                self.vowVieww.isHidden = false
                self.foodBasketVieww.isHidden = true
                self.expitationOathVieww.isHidden = true
                self.sacrificeVieww.isHidden = true
                self.ransomVivew.isHidden = true
                self.aqiqahVieww.isHidden = true
                self.sacrificeMoreVieww.isHidden = true
                vowAmt = 45
                vowAmtLbl.text = "Total amounts 45 OMR"
                vowDonateNowBtn.setTitle("Donate Now", for: .normal)
                vowAddCartBtn.setTitle("Add Cart", for: .normal)
                vow45Btn.addTarget(self, action: #selector(vow45BtnAction), for: .touchUpInside)
                vow250Btn.addTarget(self, action: #selector(vow250BtnAction), for: .touchUpInside)
            }
            
        }
        if isAquiuah == "Aqiuah"{
            if LocalizationSystem.sharedInstance.getLanguage() == "en"{
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
                AquiahBackBtn.setImage(UIImage.init(named: "ArabicBackIcon"), for: .normal)
                AquiahLbl.text = "العقيقة"
                AquiahSheepLbl.text = "خروف"
                aqiqahNumberTF.textAlignment = .center
                aqiqahNumberTF.placeholder = "رقم"
                AquiuahDonateBtn.setTitle("تبرع الآن", for: .normal)
                AquiahSheepAddcartBtn.setTitle("اضافة للعربة", for: .normal)
                self.aqiqahNumberTF.delegate = self
                self.vowVieww.isHidden = true
                self.foodBasketVieww.isHidden = true
                self.expitationOathVieww.isHidden = true
                self.sacrificeVieww.isHidden = true
                self.ransomVivew.isHidden = true
                self.aqiqahVieww.isHidden = false
                self.sacrificeMoreVieww.isHidden = true
                aqiqahAmt = 45
                let totalAmounts = "المبلغ الإجمالي"
                self.aqiqahNumberLbl.text = "\(totalAmounts) 45 ر.ع"
                aqiqah45Btn.addTarget(self, action: #selector(aqiqah45BtnAction), for: .touchUpInside)
            }else{
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
                AquiahBackBtn.setImage(UIImage.init(named: "BackButton"), for: .normal)
                AquiahLbl.text = "Aquiuah"
                AquiahSheepLbl.text = "Sheep"
                aqiqahNumberTF.textAlignment = .center
                aqiqahNumberTF.placeholder = "Number"
                AquiuahDonateBtn.setTitle("Donate Now", for: .normal)
                AquiahSheepAddcartBtn.setTitle("Add Cart", for: .normal)
                self.aqiqahNumberTF.delegate = self
                self.vowVieww.isHidden = true
                self.foodBasketVieww.isHidden = true
                self.expitationOathVieww.isHidden = true
                self.sacrificeVieww.isHidden = true
                self.ransomVivew.isHidden = true
                self.aqiqahVieww.isHidden = false
                self.sacrificeMoreVieww.isHidden = true
                aqiqahAmt = 45
                aqiqahNumberLbl.text = "Total amounts 45 OMR"
                aqiqah45Btn.addTarget(self, action: #selector(aqiqah45BtnAction), for: .touchUpInside)
            }
            
        }
        if isSacrificeMore == "isSacrificeMore"{
            if LocalizationSystem.sharedInstance.getLanguage() == "en"{
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
                sacrificeMoreBackBtn.setImage(UIImage.init(named: "ArabicBackIcon"), for: .normal)
                moreSacLbl.text = "الأضاحي"
                moreSacrificecattleLbl.text = "ماشية"
                moreSacCattlesLbl.text = "ماشية"
                moreSacSheepLbl.text = "خروف"
                DonateSacrificeMoreDonateBtn.setTitle("تبرع الآن", for: .normal)
                sacrificeMoreCartAddedBtn.setTitle("اضافة للعربة", for: .normal)
                self.aqiqahNumberTF.delegate = self
                self.vowVieww.isHidden = true
                self.foodBasketVieww.isHidden = true
                self.expitationOathVieww.isHidden = true
                self.sacrificeVieww.isHidden = true
                self.ransomVivew.isHidden = true
                self.aqiqahVieww.isHidden = true
                self.sacrificeMoreVieww.isHidden = false
                self.sacrificeMoreTF.delegate = self
                sacrificeMoreAmt = 45
                let totalAmounts = "المبلغ الإجمالي"
                self.sacrificeMoreLbl.text = "\(totalAmounts) 45 ر.ع"
                sacrificeMore315Btn.addTarget(self, action: #selector(sacrificeMore315btnAction), for: .touchUpInside)
                sacrificeMore45Btn.addTarget(self, action: #selector(sacrificeMore45btnAction), for: .touchUpInside)
                sacrificeMore45Btn1.addTarget(self, action: #selector(sacrificeMore45_1btnAction), for: .touchUpInside)
                sacrificeMoreTF.textAlignment = .center
                sacrificeMoreTF.placeholder = "رقم"
            }else{
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
                sacrificeMoreBackBtn.setImage(UIImage.init(named: "BackButton"), for: .normal)
                moreSacLbl.text = "Sacrifice"
                self.aqiqahNumberTF.delegate = self
                self.vowVieww.isHidden = true
                self.foodBasketVieww.isHidden = true
                self.expitationOathVieww.isHidden = true
                self.sacrificeVieww.isHidden = true
                self.ransomVivew.isHidden = true
                self.aqiqahVieww.isHidden = true
                self.sacrificeMoreVieww.isHidden = false
                self.sacrificeMoreTF.delegate = self
                sacrificeMoreAmt = 45
                sacrificeMoreLbl.text = "Total amounts 45 OMR"
                sacrificeMore315Btn.addTarget(self, action: #selector(sacrificeMore315btnAction), for: .touchUpInside)
                sacrificeMore45Btn.addTarget(self, action: #selector(sacrificeMore45btnAction), for: .touchUpInside)
                sacrificeMore45Btn1.addTarget(self, action: #selector(sacrificeMore45_1btnAction), for: .touchUpInside)
                sacrificeMoreTF.textAlignment = .center
                sacrificeMoreTF.placeholder = "Number"
                moreSacLbl.text = "Sacrifice"
                moreSacrificecattleLbl.text = "Cattle"
                moreSacCattlesLbl.text = "Cattle"
                moreSacSheepLbl.text = "Sheep"
                DonateSacrificeMoreDonateBtn.setTitle("Donate Now", for: .normal)
                sacrificeMoreCartAddedBtn.setTitle("Add Cart", for: .normal)
            }
            
        }
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            self.otherAmountTF.delegate = self
            oneBtn.addTarget(self, action: #selector(oneBtnAction), for: .touchUpInside)
            fiveBtn.addTarget(self, action: #selector(fiveBtnAction), for: .touchUpInside)
            tenBtn.addTarget(self, action: #selector(tenBtnAction), for: .touchUpInside)
            twentyBtnAction.addTarget(self, action: #selector(twentyBtnAc), for: .touchUpInside)
            self.foodamountValue = "1"
            let totalAmounts = "المبلغ الإجمالي"
            self.totalAmountLbl.text = "\(totalAmounts) \(foodamountValue ?? "") ر.ع"
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            self.otherAmountTF.delegate = self
            oneBtn.addTarget(self, action: #selector(oneBtnAction), for: .touchUpInside)
            fiveBtn.addTarget(self, action: #selector(fiveBtnAction), for: .touchUpInside)
            tenBtn.addTarget(self, action: #selector(tenBtnAction), for: .touchUpInside)
            twentyBtnAction.addTarget(self, action: #selector(twentyBtnAc), for: .touchUpInside)
            self.foodamountValue = "1"
            self.totalAmountLbl.text = "Total Amount 1 OMR"
        }
        
    }
    @IBAction func sacrificeMoreAddCartBtn(_ sender: Any) {
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            let alert = UIAlertController(title: "تمت الإضافة بنجاح في سلة التسوق", message:"", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "نعم", style: .default, handler: {(_ action: UIAlertAction) -> Void in
            }))
            self.present(alert, animated: true, completion: nil)
            
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            let alert = UIAlertController(title: "", message:"Cart Added Sucessfully", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(_ action: UIAlertAction) -> Void in
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func sacrificeMoreDonateBtn(_ sender: Any) {
        if sacrificeMoreTF.text == ""{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.amount = "\(sacrificeMoreAmt!)"
            vc.cartID = sacrificeId
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }else if sacrificeMoreTF.text == nil{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.amount = "\(sacrificeMoreAmt!)"
            vc.cartID = sacrificeId
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }else{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.amount = "\(result ?? 0)"
            vc.cartID = sacrificeId
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    
    @objc func sacrificeMore315btnAction(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            sacrificeMoreAmt = 315
            let totalAmounts = "المبلغ الإجمالي"
            self.sacrificeMoreLbl.text = "\(totalAmounts) 315 ر.ع"
            sacrificeMore315Btn.setImage(UIImage(named: "donation_315_2"), for: UIControl.State.normal)
            sacrificeMore45Btn1.setImage(UIImage(named: "donation_45_2"), for: UIControl.State.normal)
            sacrificeMore45Btn.setImage(UIImage(named: "donation_45_2"), for: UIControl.State.normal)
            sacrificeMoreTF.text = ""
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            sacrificeMoreAmt = 315
            sacrificeMoreLbl.text = "Total amounts 315 OMR"
            sacrificeMore315Btn.setImage(UIImage(named: "donation_315_2"), for: UIControl.State.normal)
            sacrificeMore45Btn1.setImage(UIImage(named: "donation_45_2"), for: UIControl.State.normal)
            sacrificeMore45Btn.setImage(UIImage(named: "donation_45_2"), for: UIControl.State.normal)
            sacrificeMoreTF.text = ""
        }
        
    }
    
    @objc func sacrificeMore45btnAction(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            sacrificeMoreAmt = 45
            let totalAmounts = "المبلغ الإجمالي"
            self.sacrificeMoreLbl.text = "\(totalAmounts) 45 ر.ع"
            sacrificeMore315Btn.setImage(UIImage(named: "donation_315"), for: UIControl.State.normal)
            sacrificeMore45Btn1.setImage(UIImage(named: "donation_45_2"), for: UIControl.State.normal)
            sacrificeMore45Btn.setImage(UIImage(named: "donation_45"), for: UIControl.State.normal)
            sacrificeMoreTF.text = ""
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            sacrificeMoreAmt = 45
            sacrificeMoreLbl.text = "Total amounts 45 OMR"
            sacrificeMore315Btn.setImage(UIImage(named: "donation_315"), for: UIControl.State.normal)
            sacrificeMore45Btn1.setImage(UIImage(named: "donation_45_2"), for: UIControl.State.normal)
            sacrificeMore45Btn.setImage(UIImage(named: "donation_45"), for: UIControl.State.normal)
            sacrificeMoreTF.text = ""
        }
        
    }
    
    @objc func sacrificeMore45_1btnAction(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            sacrificeMoreAmt = 45
            let totalAmounts = "المبلغ الإجمالي"
            self.sacrificeMoreLbl.text = "\(totalAmounts) 45 ر.ع"
            sacrificeMore315Btn.setImage(UIImage(named: "donation_315"), for: UIControl.State.normal)
            sacrificeMore45Btn1.setImage(UIImage(named: "donation_45"), for: UIControl.State.normal)
            sacrificeMore45Btn.setImage(UIImage(named: "donation_45_2"), for: UIControl.State.normal)
            sacrificeMoreTF.text = ""
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            sacrificeMoreAmt = 45
            sacrificeMoreLbl.text = "Total amounts 45 OMR"
            sacrificeMore315Btn.setImage(UIImage(named: "donation_315"), for: UIControl.State.normal)
            sacrificeMore45Btn1.setImage(UIImage(named: "donation_45"), for: UIControl.State.normal)
            sacrificeMore45Btn.setImage(UIImage(named: "donation_45_2"), for: UIControl.State.normal)
            sacrificeMoreTF.text = ""
        }
        
    }
    
    @objc func vow45BtnAction(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            vowAmt = 45
            vowNumebrTF.text = ""
            let totalAmounts = "المبلغ الإجمالي"
            self.vowAmtLbl.text = "\(totalAmounts) 45 ر.ع"
            vow45Btn.setImage(UIImage(named: "donation_45"), for: UIControl.State.normal)
            vow250Btn.setImage(UIImage(named: "donation_250"), for: UIControl.State.normal)
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            vowAmt = 45
            vowNumebrTF.text = ""
            vowAmtLbl.text = "Total amounts 45 OMR"
            vow45Btn.setImage(UIImage(named: "donation_45"), for: UIControl.State.normal)
            vow250Btn.setImage(UIImage(named: "donation_250"), for: UIControl.State.normal)
        }
        
        
    }
    
    @objc func aqiqah45BtnAction(){
        aqiqahAmt = 45
        aqiqahNumberLbl.text = "Total amounts 45 OMR"
        aqiqahNumberTF.text = ""
        vow45Btn.setImage(UIImage(named: "donation_45"), for: UIControl.State.normal)
    }
    
    @objc func vow250BtnAction(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            vowAmt = 250
            vowNumebrTF.text = ""
            let totalAmounts = "المبلغ الإجمالي"
            self.vowAmtLbl.text = "\(totalAmounts) 250 ر.ع"
            vow45Btn.setImage(UIImage(named: "donation_45_2"), for: UIControl.State.normal)
            vow250Btn.setImage(UIImage(named: "donation_250_2"), for: UIControl.State.normal)
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            vowAmt = 250
            vowNumebrTF.text = ""
            vowAmtLbl.text = "Total amounts 250 OMR"
            vow45Btn.setImage(UIImage(named: "donation_45_2"), for: UIControl.State.normal)
            vow250Btn.setImage(UIImage(named: "donation_250_2"), for: UIControl.State.normal)
        }
        
    }
    
    @IBAction func backAqiqahBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func backRansomBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    @objc func ransomDonateBtnAction(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            ransomAmount = Int(1.5)
            ransomTF.text = ""
            let totalAmounts = "المبلغ الإجمالي"
            self.ransomAmtLbl.text = "\(totalAmounts) 1.5 ر.ع"
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            ransomAmount = Int(1.5)
            ransomTF.text = ""
            ransomAmtLbl.text = "Total amounts 1.5 OMR"
        }
        
    }
    
    @IBAction func ransomCartBtn(_ sender: Any) {
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            let alert = UIAlertController(title: "تمت الإضافة بنجاح في سلة التسوق", message:"", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "نعم".l10n(), style: .default, handler: {(_ action: UIAlertAction) -> Void in
            }))
            self.present(alert, animated: true, completion: nil)
            
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            let alert = UIAlertController(title: "", message:"Cart Added Sucessfully", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(_ action: UIAlertAction) -> Void in
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func aqiqahCartBtn(_ sender: Any) {
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            let alert = UIAlertController(title: "تمت الإضافة بنجاح في سلة التسوق", message:"", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "نعم", style: .default, handler: {(_ action: UIAlertAction) -> Void in
            }))
            self.present(alert, animated: true, completion: nil)
            
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            let alert = UIAlertController(title: "", message:"Cart Added Sucessfully", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(_ action: UIAlertAction) -> Void in
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func sacrificeMoreDismissBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func aqiahDonateBtnAction(_ sender: Any) {
        if aqiqahNumberTF.text == ""{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.amount = "\(aqiqahAmt!)"
            vc.cartID = expirationId
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }else if aqiqahNumberTF.text == nil{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.amount = "\(aqiqahAmt!)"
            vc.cartID = expirationId
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }else{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.amount = "\(result ?? 0)"
            vc.cartID = expirationId
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    @IBAction func ransomDonateBtn(_ sender: Any) {
        if ransomTF.text == ""{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.amount = "\(ransomAmount!)"
            vc.cartID = sacrificeId
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }else if sacrificeNumberTF.text == nil{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.amount = "\(ransomAmount!)"
            vc.cartID = sacrificeId
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }else{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.amount = "\(ransomResult ?? 0)"
            vc.cartID = sacrificeId
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    
    @objc func sacrifice45BtnAction(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            sacrificeNumberTF.text = ""
            sacrificeAmount = "45"
            sacrifice45AmtValue = 45
            let totalAmounts = "المبلغ الإجمالي"
            self.sacrificeAmtLbl.text = "\(totalAmounts) 45 ر.ع"
            sacrifice45Btn.setImage(UIImage(named: "donation_45"), for: UIControl.State.normal)
            sacrifice250Btn.setImage(UIImage(named: "donation_250"), for: UIControl.State.normal)
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            sacrificeNumberTF.text = ""
            sacrificeAmount = "45"
            sacrifice45AmtValue = 45
            sacrificeAmtLbl.text = "Total amounts 45 OMR"
            sacrifice45Btn.setImage(UIImage(named: "donation_45"), for: UIControl.State.normal)
            sacrifice250Btn.setImage(UIImage(named: "donation_250"), for: UIControl.State.normal)
        }
        
    }
    
    @objc func sacrifice250BtnAction(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            sacrificeNumberTF.text = ""
            sacrificeAmount = "250"
            sacrifice45AmtValue = 250
            let totalAmounts = "المبلغ الإجمالي"
            self.sacrificeAmtLbl.text = "\(totalAmounts) 250 ر.ع"
            sacrifice45Btn.setImage(UIImage(named: "donation_45_2"), for: UIControl.State.normal)
            sacrifice250Btn.setImage(UIImage(named: "donation_250_2"), for: UIControl.State.normal)
        }else
        {
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            sacrificeNumberTF.text = ""
            sacrificeAmount = "250"
            sacrifice45AmtValue = 250
            sacrificeAmtLbl.text = "Total amounts 250 OMR"
            sacrifice45Btn.setImage(UIImage(named: "donation_45_2"), for: UIControl.State.normal)
            sacrifice250Btn.setImage(UIImage(named: "donation_250_2"), for: UIControl.State.normal)
            
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if textField == self.otherAmountTF{
            if LocalizationSystem.sharedInstance.getLanguage() == "en"{
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
                if otherAmountTF.text == ""{
                    if Food1myValue == "1"{
                        let totalAmounts = "المبلغ الإجمالي"
                        self.totalAmountLbl.text = "\(totalAmounts) 1 ر.ع"
                    }else if Food5myValue == "5"{
                        let totalAmounts = "المبلغ الإجمالي"
                        self.totalAmountLbl.text = "\(totalAmounts) 5 ر.ع"
                    }else if Food10myValue == "10"{
                        let totalAmounts = "المبلغ الإجمالي"
                        self.totalAmountLbl.text = "\(totalAmounts) 10 ر.ع"
                    }else{
                        let totalAmounts = "المبلغ الإجمالي"
                        self.totalAmountLbl.text = "\(totalAmounts) 20 ر.ع"
                    }
                }else{
                    if Food1myValue == "1"{
                        if textField == self.otherAmountTF{
                            let otherAmount = self.otherAmountTF.text!
                            if otherAmount == ""{
                                result = 1
                                self.foodamountValue = "1"
                                let totalAmounts = "المبلغ الإجمالي"
                                self.totalAmountLbl.text = "\(totalAmounts) 1 ر.ع"
                            }else{
                                self.foodamountValue = "\(otherAmount)"
                                result = Int(otherAmount)
                                let totalAmounts = "المبلغ الإجمالي"
                                self.totalAmountLbl.text = "\(totalAmounts) \(foodamountValue ?? "") ر.ع"
                            }
                            
                        }
                    }else if Food5myValue == "5"{
                        if textField == self.otherAmountTF{
                            let otherAmount = self.otherAmountTF.text!
                            let optionalValue1: Int? = 5
                            let optionalValue2: Int? = 10
                            if let value1 = optionalValue1, let value2 = Int(otherAmount) {
                                 result = value1 * value2
                                print(result)
                                let totalAmounts = "المبلغ الإجمالي"
                                self.totalAmountLbl.text = "\(totalAmounts) \(result ?? 0) ر.ع"
                            } else {
                                print("One or both values are nil")
                            }
                            
                        }
                    }else if Food10myValue == "10"{
                        if textField == self.otherAmountTF{
                            let otherAmount = self.otherAmountTF.text!
                            let optionalValue1: Int? = 10
                            if let value1 = optionalValue1, let value2 = Int(otherAmount) {
                                  result = value1 * value2
                                print(result)
                                let totalAmounts = "المبلغ الإجمالي"
                                self.totalAmountLbl.text = "\(totalAmounts) \(result ?? 0) ر.ع"
                                
                            } else {
                                print("One or both values are nil")
                            }
                            
                        }
                    }else{
                        if textField == self.otherAmountTF{
                            let otherAmount = self.otherAmountTF.text!
                            let optionalValue1: Int? = 20
                            if let value1 = optionalValue1, let value2 = Int(otherAmount) {
                                result = value1 * value2
                                print(result)
                                let totalAmounts = "المبلغ الإجمالي"
                                self.totalAmountLbl.text = "\(totalAmounts) \(result ?? 0) ر.ع"
                            } else {
                                print("One or both values are nil")
                            }
                            
                        }
                    }
                }

                
            }else{
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
                if otherAmountTF.text == ""{
                    if Food1myValue == "1"{
                        self.totalAmountLbl.text = "Toal Amount 1 OMR"
                    }else if Food5myValue == "5"{
                        self.totalAmountLbl.text = "Toal Amount 5 OMR"
                    }else if Food10myValue == "10"{
                        self.totalAmountLbl.text = "Toal Amount 10 OMR"
                    }else{
                        self.totalAmountLbl.text = "Toal Amount 20 OMR"
                    }
                }else{
                    if Food1myValue == "1"{
                        if textField == self.otherAmountTF{
                            let otherAmount = self.otherAmountTF.text!
                            if otherAmount == ""{
                                result = 1
                                self.foodamountValue = "1"
                                self.totalAmountLbl.text = "Toal Amount 1 OMR"
                            }else{
                                self.foodamountValue = "\(otherAmount)"
                                result = Int(otherAmount)
                                self.totalAmountLbl.text = "Toal Amount \(foodamountValue ?? "") OMR"
                            }
                            
                        }
                    }else if Food5myValue == "5"{
                        if textField == self.otherAmountTF{
                            let otherAmount = self.otherAmountTF.text!
                            let optionalValue1: Int? = 5
                            let optionalValue2: Int? = 10
                            if let value1 = optionalValue1, let value2 = Int(otherAmount) {
                                 result = value1 * value2
                                print(result)
                                self.totalAmountLbl.text = "Toal Amount \(result ?? 0) OMR"
                            } else {
                                print("One or both values are nil")
                            }
                            
                        }
                    }else if Food10myValue == "10"{
                        if textField == self.otherAmountTF{
                            let otherAmount = self.otherAmountTF.text!
                            let optionalValue1: Int? = 10
                            if let value1 = optionalValue1, let value2 = Int(otherAmount) {
                                  result = value1 * value2
                                print(result)
                                self.totalAmountLbl.text = "Toal Amount \(result ?? 0) OMR"
                            } else {
                                print("One or both values are nil")
                            }
                            
                        }
                    }else{
                        if textField == self.otherAmountTF{
                            let otherAmount = self.otherAmountTF.text!
                            let optionalValue1: Int? = 20
                            if let value1 = optionalValue1, let value2 = Int(otherAmount) {
                                result = value1 * value2
                                print(result)
                                self.totalAmountLbl.text = "Toal Amount \(result ?? 0) OMR"
                            } else {
                                print("One or both values are nil")
                            }
                            
                        }
                    }
                }

            }
        }
        
        if textField == self.numberOathExpitationsTF{
            if LocalizationSystem.sharedInstance.getLanguage() == "en"{
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
                if numberOathExpitationsTF.text == ""{
                    let totalAmounts = "المبلغ الإجمالي"
                    self.expitationLbl.text = "\(totalAmounts) 15 ر.ع"
                }else{
                    let otherAmount = self.numberOathExpitationsTF.text!
                    let optionalValue1: Int? = 15
                    if let value1 = optionalValue1, let value2 = Int(otherAmount) {
                         result = value1 * value2
                        print(result)
                        let totalAmounts = "المبلغ الإجمالي"
                        self.expitationLbl.text = "\(totalAmounts) \(result ?? 0) ر.ع"
                    } else {
                        print("One or both values are nil")
                    }
                }
            }else{
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
                if numberOathExpitationsTF.text == ""{
                    expitationLbl.text =  "Toal Amount 15 OMR"
                }else{
                    let otherAmount = self.numberOathExpitationsTF.text!
                    let optionalValue1: Int? = 15
                    if let value1 = optionalValue1, let value2 = Int(otherAmount) {
                         result = value1 * value2
                        print(result)
                        self.expitationLbl.text = "Toal Amount \(result ?? 0) OMR"
                    } else {
                        print("One or both values are nil")
                    }
                }
            }
            
            
        }
        
        if textField == self.sacrificeNumberTF{
            if LocalizationSystem.sharedInstance.getLanguage() == "en"{
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
                if sacrificeNumberTF.text == ""{
                    if sacrifice45AmtValue == 45{
                        let totalAmounts = "المبلغ الإجمالي"
                        self.sacrificeAmtLbl.text = "\(totalAmounts) 45 ر.ع"
                    }else{
                        let totalAmounts = "المبلغ الإجمالي"
                        self.sacrificeAmtLbl.text = "\(totalAmounts) 250 ر.ع"
                    }
                    
                }else{
                    if sacrifice45AmtValue == 45{
                        let otherAmount = self.sacrificeNumberTF.text!
                        let optionalValue1: Int? = 45
                        if let value1 = optionalValue1, let value2 = Int(otherAmount) {
                             result = value1 * value2
                            print(result)
                            let totalAmounts = "المبلغ الإجمالي"
                            self.sacrificeAmtLbl.text = "\(totalAmounts) \(result ?? 0) ر.ع"
                        } else {
                            print("One or both values are nil")
                        }
                    }else{
                        let otherAmount = self.sacrificeNumberTF.text!
                        let optionalValue1: Int? = 250
                        if let value1 = optionalValue1, let value2 = Int(otherAmount) {
                             result = value1 * value2
                            print(result)
                            let totalAmounts = "المبلغ الإجمالي"
                            self.sacrificeAmtLbl.text = "\(totalAmounts) \(result ?? 0) ر.ع"
                        } else {
                            print("One or both values are nil")
                        }
                    }
                }

            }else{
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
                if sacrificeNumberTF.text == ""{
                    if sacrifice45AmtValue == 45{
                        self.sacrificeAmtLbl.text = "Toal Amount 45 OMR"
                    }else{
                        self.sacrificeAmtLbl.text = "Toal Amount 250 OMR"
                    }
                    
                }else{
                    if sacrifice45AmtValue == 45{
                        let otherAmount = self.sacrificeNumberTF.text!
                        let optionalValue1: Int? = 45
                        if let value1 = optionalValue1, let value2 = Int(otherAmount) {
                             result = value1 * value2
                            print(result)
                            self.sacrificeAmtLbl.text = "Toal Amount \(result ?? 0) OMR"
                        } else {
                            print("One or both values are nil")
                        }
                    }else{
                        let otherAmount = self.sacrificeNumberTF.text!
                        let optionalValue1: Int? = 250
                        if let value1 = optionalValue1, let value2 = Int(otherAmount) {
                             result = value1 * value2
                            print(result)
                            self.sacrificeAmtLbl.text = "Toal Amount \(result ?? 0) OMR"
                        } else {
                            print("One or both values are nil")
                        }
                    }
                }

            }
           
        }
        
        if textField == self.ransomTF{
            if LocalizationSystem.sharedInstance.getLanguage() == "en"{
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
                if ransomTF.text == ""{
                    if ransomAmount == Int(1.5){
                        let totalAmounts = "المبلغ الإجمالي"
                        self.ransomAmtLbl.text = "\(totalAmounts) 1.5 ر.ع"
                    }
                }else{
                    let number: Double? = 1.5
                    let otherAmount = ransomTF.text
                    let multiplier = ransomTF.text!
                    if let unwrappedNumber = number {
                        ransomResult = unwrappedNumber * Double(multiplier)!
                        let totalAmounts = "المبلغ الإجمالي"
                        self.ransomAmtLbl.text = "\(totalAmounts) \(ransomResult ?? 0) ر.ع"
                    } else {
                        print("Number is nil")
                    }
                }
            }else{
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
                if ransomTF.text == ""{
                    if ransomAmount == Int(1.5){
                        ransomAmtLbl.text = "Total amounts 1.5 OMR"
                    }
                }else{
                    let number: Double? = 1.5
                    let otherAmount = ransomTF.text
                    let multiplier = ransomTF.text!
                    if let unwrappedNumber = number {
                        ransomResult = unwrappedNumber * Double(multiplier)!
                        ransomAmtLbl.text = "Total amounts \(ransomResult ?? 0) OMR"
                    } else {
                        print("Number is nil")
                    }
                }
            }
            
        }
        
        if textField == self.vowNumebrTF{
            if LocalizationSystem.sharedInstance.getLanguage() == "en"{
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
                if vowNumebrTF.text == ""{
                    if vowAmt == 45{
                        let totalAmounts = "المبلغ الإجمالي"
                        self.vowAmtLbl.text = "\(totalAmounts) 45 ر.ع"
                    }else{
                        let totalAmounts = "المبلغ الإجمالي"
                        self.vowAmtLbl.text = "\(totalAmounts) 250 ر.ع"
                    }
                }else{
                    if vowAmt == 45{
                        let otherAmount = self.vowNumebrTF.text!
                        let optionalValue1: Int? = 45
                        if let value1 = optionalValue1, let value2 = Int(otherAmount) {
                             result = value1 * value2
                            print(result)
                            let totalAmounts = "المبلغ الإجمالي"
                            self.vowAmtLbl.text = "\(totalAmounts) \(result ?? 0) ر.ع"
                        } else {
                            print("One or both values are nil")
                        }
                    }else{
                        let otherAmount = self.vowNumebrTF.text!
                        let optionalValue1: Int? = 250
                        if let value1 = optionalValue1, let value2 = Int(otherAmount) {
                             result = value1 * value2
                            print(result)
                            let totalAmounts = "المبلغ الإجمالي"
                            self.vowAmtLbl.text = "\(totalAmounts) \(result ?? 0) ر.ع"
                        } else {
                            print("One or both values are nil")
                        }
                    }
                }
            }else{
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
                if vowNumebrTF.text == ""{
                    if vowAmt == 45{
                        self.vowAmtLbl.text = "Toal Amount 45 OMR"
                    }else{
                        self.vowAmtLbl.text = "Toal Amount 250 OMR"
                    }
                }else{
                    if vowAmt == 45{
                        let otherAmount = self.vowNumebrTF.text!
                        let optionalValue1: Int? = 45
                        if let value1 = optionalValue1, let value2 = Int(otherAmount) {
                             result = value1 * value2
                            print(result)
                            self.vowAmtLbl.text = "Toal Amount \(result ?? 0) OMR"
                        } else {
                            print("One or both values are nil")
                        }
                    }else{
                        let otherAmount = self.vowNumebrTF.text!
                        let optionalValue1: Int? = 250
                        if let value1 = optionalValue1, let value2 = Int(otherAmount) {
                             result = value1 * value2
                            print(result)
                            self.vowAmtLbl.text = "Toal Amount \(result ?? 0) OMR"
                        } else {
                            print("One or both values are nil")
                        }
                    }
                }
            }
            
            
        }
        
        if textField == self.aqiqahNumberTF{
            if LocalizationSystem.sharedInstance.getLanguage() == "en"{
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
                if aqiqahNumberTF.text == ""{
                    aqiqahAmt = 45
                    let totalAmounts = "المبلغ الإجمالي"
                    self.aqiqahNumberLbl.text = "\(totalAmounts) 45 ر.ع"
                }else{
                    let otherAmount = self.aqiqahNumberTF.text!
                    let optionalValue1: Int? = 45
                    if let value1 = optionalValue1, let value2 = Int(otherAmount) {
                         result = value1 * value2
                        print(result)
                        let totalAmounts = "المبلغ الإجمالي"
                        self.aqiqahNumberLbl.text = "\(totalAmounts) \(result ?? 0) ر.ع"
                    } else {
                        print("One or both values are nil")
                    }
                }
            }else{
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
                if aqiqahNumberTF.text == ""{
                    aqiqahAmt = 45
                    self.aqiqahNumberLbl.text = "Total amounts 45 OMR"
                }else{
                    let otherAmount = self.aqiqahNumberTF.text!
                    let optionalValue1: Int? = 45
                    if let value1 = optionalValue1, let value2 = Int(otherAmount) {
                         result = value1 * value2
                        print(result)
                        self.aqiqahNumberLbl.text = "Toal Amount \(result ?? 0) OMR"
                    } else {
                        print("One or both values are nil")
                    }
                }
            }
            
            
        }
        
        if textField == self.sacrificeMoreTF{
            if LocalizationSystem.sharedInstance.getLanguage() == "en"{
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
                if sacrificeMoreTF.text == ""{
                    if sacrificeMoreAmt == 45{
                        let totalAmounts = "المبلغ الإجمالي"
                        self.sacrificeMoreLbl.text = "\(totalAmounts) 45 ر.ع"
                    }else if sacrificeMoreAmt == 315{
                        let totalAmounts = "المبلغ الإجمالي"
                        self.sacrificeMoreLbl.text = "\(totalAmounts) 315 ر.ع"
                    }else{
                        let totalAmounts = "المبلغ الإجمالي"
                        self.sacrificeMoreLbl.text = "\(totalAmounts) 45 ر.ع"
                    }
                }else{
                    if sacrificeMoreAmt == 315{
                        let otherAmount = self.sacrificeMoreTF.text!
                        let optionalValue1: Int? = 315
                        if let value1 = optionalValue1, let value2 = Int(otherAmount) {
                             result = value1 * value2
                            print(result)
                            let totalAmounts = "المبلغ الإجمالي"
                            self.sacrificeMoreLbl.text = "\(totalAmounts) \(result ?? 0) ر.ع"
                        } else {
                            print("One or both values are nil")
                        }
                    }else if sacrificeMoreAmt == 45{
                        let otherAmount = self.sacrificeMoreTF.text!
                        let optionalValue1: Int? = 45
                        if let value1 = optionalValue1, let value2 = Int(otherAmount) {
                             result = value1 * value2
                            print(result)
                            
                            let totalAmounts = "المبلغ الإجمالي"
                            self.sacrificeMoreLbl.text = "\(totalAmounts) \(result ?? 0) ر.ع"
                        } else {
                            print("One or both values are nil")
                        }
                    }else{
                        let otherAmount = self.sacrificeMoreTF.text!
                        let optionalValue1: Int? = 45
                        if let value1 = optionalValue1, let value2 = Int(otherAmount) {
                             result = value1 * value2
                            print(result)
                            let totalAmounts = "المبلغ الإجمالي"
                            self.sacrificeMoreLbl.text = "\(totalAmounts) \(result ?? 0) ر.ع"
                        } else {
                            print("One or both values are nil")
                        }
                    }
                }
            }else{
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
                if sacrificeMoreTF.text == ""{
                    if sacrificeMoreAmt == 45{
                        self.sacrificeMoreLbl.text = "Toal Amount 45 OMR"
                    }else if sacrificeMoreAmt == 315{
                        self.sacrificeMoreLbl.text = "Toal Amount 315 OMR"
                    }else{
                        self.sacrificeMoreLbl.text = "Toal Amount 45 OMR"
                    }
                }else{
                    if sacrificeMoreAmt == 315{
                        let otherAmount = self.sacrificeMoreTF.text!
                        let optionalValue1: Int? = 315
                        if let value1 = optionalValue1, let value2 = Int(otherAmount) {
                             result = value1 * value2
                            print(result)
                            self.sacrificeMoreLbl.text = "Toal Amount \(result ?? 0) OMR"
                        } else {
                            print("One or both values are nil")
                        }
                    }else if sacrificeMoreAmt == 45{
                        let otherAmount = self.sacrificeMoreTF.text!
                        let optionalValue1: Int? = 45
                        if let value1 = optionalValue1, let value2 = Int(otherAmount) {
                             result = value1 * value2
                            print(result)
                            self.sacrificeMoreLbl.text = "Toal Amount \(result ?? 0) OMR"
                        } else {
                            print("One or both values are nil")
                        }
                    }else{
                        let otherAmount = self.sacrificeMoreTF.text!
                        let optionalValue1: Int? = 45
                        if let value1 = optionalValue1, let value2 = Int(otherAmount) {
                             result = value1 * value2
                            print(result)
                            self.sacrificeMoreLbl.text = "Toal Amount \(result ?? 0) OMR"
                        } else {
                            print("One or both values are nil")
                        }
                    }
                }
            }
            
            
        }
        
    }
    
    @IBAction func dismissExpitationOathBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    @IBAction func sacrificeDismissBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func vowDismissBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func vowCartBtn(_ sender: Any) {
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            let alert = UIAlertController(title: "تمت الإضافة بنجاح في سلة التسوق", message:"", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "نعم", style: .default, handler: {(_ action: UIAlertAction) -> Void in
            }))
            self.present(alert, animated: true, completion: nil)
            
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            let alert = UIAlertController(title: "", message:"Cart Added Sucessfully", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(_ action: UIAlertAction) -> Void in
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func vowDonateBtn(_ sender: Any) {
        if vowNumebrTF.text == ""{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.amount = "\(vowAmt!)"
            vc.cartID = sacrificeId
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }else if vowNumebrTF.text == nil{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.amount = "\(vowAmt!)"
            vc.cartID = sacrificeId
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }else{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.amount = "\(result ?? 0)"
            vc.cartID = sacrificeId
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    
    @IBAction func sacrificeCartBtn(_ sender: Any) {
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            let alert = UIAlertController(title: "تمت الإضافة بنجاح في سلة التسوق", message:"", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "نعم", style: .default, handler: {(_ action: UIAlertAction) -> Void in
            }))
            self.present(alert, animated: true, completion: nil)
            
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            let alert = UIAlertController(title: "", message:"Cart Added Sucessfully", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(_ action: UIAlertAction) -> Void in
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func sacrificeDonateBtn(_ sender: Any) {
        if sacrificeNumberTF.text == ""{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.amount = sacrificeAmount
            vc.cartID = sacrificeId
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }else if sacrificeNumberTF.text == nil{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.amount = sacrificeAmount
            vc.cartID = sacrificeId
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }else{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.amount = "\(result ?? 0)"
            vc.cartID = sacrificeId
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    
    @IBAction func cartAddedBtn(_ sender: Any) {
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            let alert = UIAlertController(title: "تمت الإضافة بنجاح في سلة التسوق", message:"", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "نعم", style: .default, handler: {(_ action: UIAlertAction) -> Void in
            }))
            self.present(alert, animated: true, completion: nil)
            
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            let alert = UIAlertController(title: "", message:"Cart Added Sucessfully", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(_ action: UIAlertAction) -> Void in
            }))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func ExpitationCartAddBtn(_ sender: Any) {
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            let alert = UIAlertController(title: "تمت الإضافة بنجاح في سلة التسوق", message:"", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "نعم", style: .default, handler: {(_ action: UIAlertAction) -> Void in
            }))
            self.present(alert, animated: true, completion: nil)
            
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            let alert = UIAlertController(title: "", message:"Cart Added Sucessfully", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(_ action: UIAlertAction) -> Void in
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func expitationDonateBtn(_ sender: Any) {
        if numberOathExpitationsTF.text == ""{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.amount = expirationAmt
            vc.cartID = expirationId
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }else if numberOathExpitationsTF.text == nil{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.amount = expirationAmt
            vc.cartID = expirationId
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }else{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.amount = "\(result ?? 0)"
            vc.cartID = expirationId
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @objc func sacrificeDonateNowBtn(){
        if sacrificeNumberTF.text == nil{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.amount = sacrificeAmount
            vc.cartID = sacrificeId
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }else if sacrificeNumberTF.text == ""{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.amount = sacrificeAmount
            vc.cartID = sacrificeId
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }else{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.amount = sacrificeNumberTF.text
            vc.cartID = sacrificeId
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    
    @objc func sacrifceCartBtn(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            let alert = UIAlertController(title: "تمت الإضافة بنجاح في سلة التسوق", message:"", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "نعم", style: .default, handler: {(_ action: UIAlertAction) -> Void in
            }))
            self.present(alert, animated: true, completion: nil)
            
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            let alert = UIAlertController(title: "", message:"Cart Added Sucessfully", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(_ action: UIAlertAction) -> Void in
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
   
    @objc func ThreeTwelvebtnAction(){
        if isSacrifice == "Sacrifice"{
            ThreeTwelveBtn.setImage(UIImage(named: "donation_315_2"), for: UIControl.State.normal)
            fourtyFiveBtn.setImage(UIImage(named: "donation_45_2"), for: UIControl.State.normal)
            fourtyFiveBtn2.setImage(UIImage(named: "donation_45_2"), for: UIControl.State.normal)
            self.sacrificelblAmount.text = "315 OMR"
            self.sacrificeAmount = "315"
        }else if isVow == "Vow"{
            ThreeTwelveBtn.setImage(UIImage(named: "donation_45"), for: UIControl.State.normal)
            fourtyFiveBtn.setImage(UIImage(named: "donation_250"), for: UIControl.State.normal)
            fourtyFiveBtn2.setImage(UIImage(named: "cash"), for: UIControl.State.normal)
            self.sacrificelblAmount.text = "45 OMR"
            self.sacrificeAmount = "45"
        }else{
            ThreeTwelveBtn.setImage(UIImage(named: "donation_45"), for: UIControl.State.normal)
            fourtyFiveBtn.setImage(UIImage(named: "donation_250"), for: UIControl.State.normal)
            self.sacrificelblAmount.text = "45 OMR"
            self.sacrificeAmount = "45"
        }
        
    }
    
    @objc func fourtyFiveAction(){
        if isSacrifice == "Sacrifice"{
            ThreeTwelveBtn.setImage(UIImage(named: "donation_315"), for: UIControl.State.normal)
            fourtyFiveBtn.setImage(UIImage(named: "donation_45"), for: UIControl.State.normal)
            fourtyFiveBtn2.setImage(UIImage(named: "donation_45_2"), for: UIControl.State.normal)
            self.sacrificelblAmount.text = "45 OMR"
            self.sacrificeAmount = "45"
        }else if isVow == "Vow"{
            ThreeTwelveBtn.setImage(UIImage(named: "donation_45_2"), for: UIControl.State.normal)
            fourtyFiveBtn.setImage(UIImage(named: "donation_250_2"), for: UIControl.State.normal)
            fourtyFiveBtn2.setImage(UIImage(named: "cash"), for: UIControl.State.normal)
            self.sacrificelblAmount.text = "250 OMR"
            self.sacrificeAmount = "250"
        }else{
            ThreeTwelveBtn.setImage(UIImage(named: "donation_45_2"), for: UIControl.State.normal)
            fourtyFiveBtn.setImage(UIImage(named: "donation_250_2"), for: UIControl.State.normal)
            self.sacrificelblAmount.text = "250 OMR"
            self.sacrificeAmount = "250"
        }
        
    }
    
    @objc func fourntyFiveActionTwo(){
        if isSacrifice == "Sacrifice"{
            ThreeTwelveBtn.setImage(UIImage(named: "donation_315"), for: UIControl.State.normal)
            fourtyFiveBtn.setImage(UIImage(named: "donation_45_2"), for: UIControl.State.normal)
            fourtyFiveBtn2.setImage(UIImage(named: "donation_45"), for: UIControl.State.normal)
            self.sacrificelblAmount.text = "45 OMR"
            self.sacrificeAmount = "45"
        }else{
            ThreeTwelveBtn.setImage(UIImage(named: "donation_45_2"), for: UIControl.State.normal)
            fourtyFiveBtn.setImage(UIImage(named: "donation_250"), for: UIControl.State.normal)
            fourtyFiveBtn2.setImage(UIImage(named: "cash_1"), for: UIControl.State.normal)
            self.sacrificelblAmount.text = "250 OMR"
            self.sacrificeAmount = "250"
        }
        
    }
    
    @objc func expirationDonation(){
        if numberOathExpitationsTF.text == ""{
            if expirationOtherAmtTF.text == nil{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
                vc.amount = expirationAmt
                vc.cartID = expirationId
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }else if numberOathExpitationsTF.text == nil{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
                vc.amount = expirationAmt
                vc.cartID = expirationId
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }else{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
                vc.amount = expirationOtherAmtTF.text
                vc.cartID = expirationId
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }
        }else{
            if expirationOtherAmtTF.text == nil{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
                vc.amount = expirationAmt
                vc.cartID = expirationId
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }else if expirationOtherAmtTF.text == ""{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
                vc.amount = expirationAmt
                vc.cartID = expirationId
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }else{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
                vc.amount = expirationOtherAmtTF.text
                vc.cartID = expirationId
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }
        }
        
    }
    
    @objc func oneBtnAction(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            foodamountValue = "1"
            let totalAmounts = "المبلغ الإجمالي"
            self.totalAmountLbl.text = "\(totalAmounts) \(foodamountValue ?? "") ر.ع"
            oneBtn.setImage(UIImage(named: "donation_1"), for: UIControl.State.normal)
            fiveBtn.setImage(UIImage(named: "donation_5"), for: UIControl.State.normal)
            tenBtn.setImage(UIImage(named: "donation_10"), for: UIControl.State.normal)
            twentyBtnAction.setImage(UIImage(named: "donation_20"), for: UIControl.State.normal)
            Food1myValue = "1"
            Food5myValue = ""
            Food10myValue = ""
            Food20myValue = ""
            otherAmountTF.text = ""
            
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            totalAmountLbl.text = "Total amount 1 OMR"
            foodamountValue = "1"
            oneBtn.setImage(UIImage(named: "donation_1"), for: UIControl.State.normal)
            fiveBtn.setImage(UIImage(named: "donation_5"), for: UIControl.State.normal)
            tenBtn.setImage(UIImage(named: "donation_10"), for: UIControl.State.normal)
            twentyBtnAction.setImage(UIImage(named: "donation_20"), for: UIControl.State.normal)
            Food1myValue = "1"
            Food5myValue = ""
            Food10myValue = ""
            Food20myValue = ""
            otherAmountTF.text = ""
            
        }
        
    }
    
    
    @IBAction func closeBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @objc func fiveBtnAction(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            let totalAmounts = "المبلغ الإجمالي"
            self.totalAmountLbl.text = "\(totalAmounts) 5 ر.ع"
            foodamountValue = "5"
            oneBtn.setImage(UIImage(named: "donation_1_1"), for: UIControl.State.normal)
            fiveBtn.setImage(UIImage(named: "donation_5_1"), for: UIControl.State.normal)
            tenBtn.setImage(UIImage(named: "donation_10"), for: UIControl.State.normal)
            twentyBtnAction.setImage(UIImage(named: "donation_20"), for: UIControl.State.normal)
            Food1myValue = ""
            Food5myValue = "5"
            Food10myValue = ""
            Food20myValue = ""
            otherAmountTF.text = ""
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            totalAmountLbl.text = "Total amount 5 OMR"
            foodamountValue = "5"
            oneBtn.setImage(UIImage(named: "donation_1_1"), for: UIControl.State.normal)
            fiveBtn.setImage(UIImage(named: "donation_5_1"), for: UIControl.State.normal)
            tenBtn.setImage(UIImage(named: "donation_10"), for: UIControl.State.normal)
            twentyBtnAction.setImage(UIImage(named: "donation_20"), for: UIControl.State.normal)
            Food1myValue = ""
            Food5myValue = "5"
            Food10myValue = ""
            Food20myValue = ""
            otherAmountTF.text = ""
        }
        
    }
    
    @objc func tenBtnAction(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            let totalAmounts = "المبلغ الإجمالي"
            self.totalAmountLbl.text = "\(totalAmounts) 10 ر.ع"
            foodamountValue = "10"
            oneBtn.setImage(UIImage(named: "donation_1_1"), for: UIControl.State.normal)
            fiveBtn.setImage(UIImage(named: "donation_5"), for: UIControl.State.normal)
            tenBtn.setImage(UIImage(named: "donation_10_2"), for: UIControl.State.normal)
            twentyBtnAction.setImage(UIImage(named: "donation_20"), for: UIControl.State.normal)
            Food1myValue = ""
            Food5myValue = ""
            Food10myValue = "10"
            Food20myValue = ""
            otherAmountTF.text = ""
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            totalAmountLbl.text = "Total amount 10 OMR"
            foodamountValue = "10"
            oneBtn.setImage(UIImage(named: "donation_1_1"), for: UIControl.State.normal)
            fiveBtn.setImage(UIImage(named: "donation_5"), for: UIControl.State.normal)
            tenBtn.setImage(UIImage(named: "donation_10_2"), for: UIControl.State.normal)
            twentyBtnAction.setImage(UIImage(named: "donation_20"), for: UIControl.State.normal)
            Food1myValue = ""
            Food5myValue = ""
            Food10myValue = "10"
            Food20myValue = ""
            otherAmountTF.text = ""
        }
        
    }
    
    @objc func twentyBtnAc(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            let totalAmounts = "المبلغ الإجمالي"
            self.totalAmountLbl.text = "\(totalAmounts) 20 ر.ع"
            foodamountValue = "20"
            oneBtn.setImage(UIImage(named: "donation_1_1"), for: UIControl.State.normal)
            fiveBtn.setImage(UIImage(named: "donation_5"), for: UIControl.State.normal)
            tenBtn.setImage(UIImage(named: "donation_10"), for: UIControl.State.normal)
            twentyBtnAction.setImage(UIImage(named: "donation_20_2"), for: UIControl.State.normal)
            Food1myValue = ""
            Food5myValue = ""
            Food10myValue = ""
            Food20myValue = "20"
            otherAmountTF.text = ""
            
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            totalAmountLbl.text = "Total amount 20 OMR"
            foodamountValue = "20"
            oneBtn.setImage(UIImage(named: "donation_1_1"), for: UIControl.State.normal)
            fiveBtn.setImage(UIImage(named: "donation_5"), for: UIControl.State.normal)
            tenBtn.setImage(UIImage(named: "donation_10"), for: UIControl.State.normal)
            twentyBtnAction.setImage(UIImage(named: "donation_20_2"), for: UIControl.State.normal)
            Food1myValue = ""
            Food5myValue = ""
            Food10myValue = ""
            Food20myValue = "20"
            otherAmountTF.text = ""
        }
        
    }
    
    @IBAction func backbtnAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
   
    @IBAction func closeButtonAct(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func donateBtnAction(_ sender: Any) {
        if otherAmountTF.text == nil{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.amount = foodamountValue
            vc.cartID = BasketId
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }else if otherAmountTF.text == ""{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.amount = foodamountValue
            vc.cartID = BasketId
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }else{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.amount = "\(result ?? 0)"
            vc.cartID = BasketId
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.otherAmountTF{
            if Food1myValue == "1"{
                if otherAmountTF.text == ""{
                    if Food1myValue == "1"{
                        oneBtn.setImage(UIImage(named: "donation_1"), for: UIControl.State.normal)
                        Food1myValue = ""
                    }
                }else{
                    if Food1myValue == "1"{
                        oneBtn.setImage(UIImage(named: "donation_1_1"), for: UIControl.State.normal)
                        
                    }
                }
            }
            
            if Food5myValue == "5"{
                if otherAmountTF.text == ""{
                    if Food5myValue == "5"{
                        fiveBtn.setImage(UIImage(named: "donation_5_1"), for: UIControl.State.normal)
                        Food5myValue = ""
                    }
                }else{
                    if Food5myValue == "5"{
                        fiveBtn.setImage(UIImage(named: "donation_5"), for: UIControl.State.normal)
                        
                    }
                }
            }
            
            if Food10myValue == "10"{
                if otherAmountTF.text == ""{
                    if Food10myValue == "10"{
                        tenBtn.setImage(UIImage(named: "donation_10_2"), for: UIControl.State.normal)
                        Food10myValue = ""
                    }
                }else{
                    if Food10myValue == "10"{
                        tenBtn.setImage(UIImage(named: "donation_10"), for: UIControl.State.normal)
                        
                    }
                }
            }

            if Food20myValue == "20"{
                if otherAmountTF.text == ""{
                    if Food20myValue == "20"{
                        twentyBtnAction.setImage(UIImage(named: "donation_20_2"), for: UIControl.State.normal)
                        Food20myValue = ""
                    }
                }else{
                    if Food20myValue == "20"{
                        twentyBtnAction.setImage(UIImage(named: "donation_20"), for: UIControl.State.normal)
                        
                    }
                }
            }
            
        }
    }
    
}


struct DropdownSelector: View {
    @State private var shouldShowDropdown = false
    @State private var selectedOption: DropdownOption? = nil
    var placeholder: String
    var options: [DropdownOption]
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?
    private let buttonHeight: CGFloat = 45

    var body: some View {
        Button(action: {
            self.shouldShowDropdown.toggle()
        }) {
            HStack {
                Text(selectedOption == nil ? placeholder : selectedOption!.value)
                    .font(.system(size: 14))
                    .foregroundColor(selectedOption == nil ? Color.gray: Color.black)

                Spacer()

                Image(systemName: self.shouldShowDropdown ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                    .resizable()
                    .frame(width: 9, height: 5)
                    .font(Font.system(size: 9, weight: .medium))
                    .foregroundColor(Color.black)
            }
        }
        .padding(.horizontal)
        .cornerRadius(5)
        .frame(width: .infinity, height: self.buttonHeight)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.gray, lineWidth: 1)
        )
        .overlay(
            VStack {
                if self.shouldShowDropdown {
                    Spacer(minLength: buttonHeight + 10)
                    Dropdown(options: self.options, onOptionSelected:  { option in
                        shouldShowDropdown = false
                        selectedOption = option
                        self.onOptionSelected?(option)
                    })
                }
            }, alignment: .topLeading
        )
        .background(
            RoundedRectangle(cornerRadius: 5).fill(Color.white)
        )
    }
}



struct DropdownSelector_Previews: PreviewProvider {
    static var uniqueKey: String {
        UUID().uuidString
    }

    static let options: [DropdownOption] = [
        DropdownOption(key: uniqueKey, value: "Sunday"),
        DropdownOption(key: uniqueKey, value: "Monday"),
        DropdownOption(key: uniqueKey, value: "Tuesday"),
        DropdownOption(key: uniqueKey, value: "Wednesday"),
        DropdownOption(key: uniqueKey, value: "Thursday"),
        DropdownOption(key: uniqueKey, value: "Friday"),
        DropdownOption(key: uniqueKey, value: "Saturday")
    ]


    static var previews: some View {
        Group {
            DropdownSelector(
                placeholder: "Day of the week",
                options: options,
                onOptionSelected: { option in
                    print(option)
            })
            .padding(.horizontal)
        }
    }
}

struct DropdownOption: Hashable {
    let key: String
    let value: String

    public static func == (lhs: DropdownOption, rhs: DropdownOption) -> Bool {
        return lhs.key == rhs.key
    }
}

struct DropdownRow: View {
    var option: DropdownOption
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?

    var body: some View {
        Button(action: {
            if let onOptionSelected = self.onOptionSelected {
                onOptionSelected(self.option)
            }
        }) {
            HStack {
                Text(self.option.value)
                    .font(.system(size: 14))
                    .foregroundColor(Color.black)
                Spacer()
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 5)
    }
}
struct Dropdown: View {
    var options: [DropdownOption]
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(self.options, id: \.self) { option in
                    DropdownRow(option: option, onOptionSelected: self.onOptionSelected)
                }
            }
        }
        .frame(minHeight: CGFloat(options.count) * 30, maxHeight: 250)
        .padding(.vertical, 5)
        .background(Color.white)
        .cornerRadius(5)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}
