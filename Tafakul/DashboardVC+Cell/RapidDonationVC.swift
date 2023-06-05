//
//  RapidDonationVC.swift
//  Tafakul
//
//  Created by apple on 21/12/22.
//

import UIKit
import Alamofire
import Kingfisher

class RapidDonationVC: UIViewController,UITextFieldDelegate
{

    @IBOutlet weak var titlelbl: UILabel!
    
    var isformDashboardFoodbasket:String!
    
    @IBOutlet weak var foodDonateNowBtn: UIButton!{
        didSet{
            self.foodDonateNowBtn.layer.cornerRadius = 15.0
            self.foodDonateNowBtn.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var customImg: UIImageView!
    
    var AquiahId:Int?
    var VowID:Int?
    
    @IBOutlet weak var foodOtherAmoutnsTF: UITextField!{
        didSet{
            self.foodOtherAmoutnsTF.layer.cornerRadius = 15.0
            self.foodOtherAmoutnsTF.layer.masksToBounds = true
            self.foodOtherAmoutnsTF.layer.borderColor = UIColor.blue.cgColor
            self.foodOtherAmoutnsTF.layer.borderWidth = 1
        }
    }
    
    @IBOutlet weak var customlbl: UILabel!
    
    @IBOutlet weak var foodTotalAmountTF: UITextField!{
        didSet{
            self.foodTotalAmountTF.layer.cornerRadius = 15.0
            self.foodTotalAmountTF.layer.masksToBounds = true
            self.foodTotalAmountTF.layer.borderColor = UIColor.blue.cgColor
            self.foodTotalAmountTF.layer.borderWidth = 1
        }
    }
    
    @IBOutlet weak var quickDonationLbl: UILabel!
    
    @IBOutlet weak var foodAmountLbl: UILabel!
    
    @IBOutlet weak var vowViewDismissBtn: UIButton!
    
    @IBOutlet weak var vowDonateBtn: UIButton!{
        didSet{
            self.vowDonateBtn.layer.cornerRadius = 10.0
            self.vowDonateBtn.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var foodOneBtn: UIButton!
    
    @IBOutlet weak var foodBasketVieww: UIView!
    
    @IBOutlet weak var foodFiveBtn: UIButton!
    
    @IBOutlet weak var foodbasketBackBtn: UIButton!
    
    @IBOutlet weak var foodTenBtn: UIButton!
    
    @IBOutlet weak var foodTwentyBtn: UIButton!
    
    @IBOutlet weak var foodbasketDismissBtn: UIButton!
    
    @IBOutlet weak var backDismissAqiahBtn: UIButton!
    
    @IBOutlet weak var anmalLbl: UILabel!
    
    @IBOutlet weak var vowCancelBtn: UIButton!
    
    @IBOutlet weak var vowVieww: UIView!
    
    @IBOutlet weak var fourntyFiveBtn: UIButton!
    
    @IBOutlet weak var vow45Amtlbl: UILabel!
    
    @IBOutlet weak var donationRapidTB: UITableView!
    
    @IBOutlet weak var twentyFiftyZeroBtn: UIButton!
    
    @IBOutlet weak var cashBtn: UIButton!
    
    @IBOutlet weak var vowOtherAmountTF: UITextField!{
        didSet{
            self.vowOtherAmountTF.layer.cornerRadius = 15
            self.vowOtherAmountTF.layer.masksToBounds = true
            self.vowOtherAmountTF.layer.borderColor = UIColor.blue.cgColor
            self.vowOtherAmountTF.layer.borderWidth = 1.0
        }
    }
    
    @IBOutlet weak var viewTotalAmountTF: UITextField!{
        didSet{
            self.viewTotalAmountTF.layer.cornerRadius = 15
            self.viewTotalAmountTF.layer.masksToBounds = true
            self.viewTotalAmountTF.layer.borderColor = UIColor.blue.cgColor
            self.viewTotalAmountTF.layer.borderWidth = 1.0
        }
    }
    
    @IBOutlet weak var donateNowBtn: UIButton!{
        didSet{
            self.donateNowBtn.layer.cornerRadius = 15
            self.donateNowBtn.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var totalAmountLbl: UILabel!
    
    @IBOutlet weak var totalAmountTF: UITextField!{
        didSet{
            self.totalAmountTF.layer.cornerRadius = 15
            self.totalAmountTF.layer.masksToBounds = true
            self.totalAmountTF.layer.borderColor = UIColor.blue.cgColor
            self.totalAmountTF.layer.borderWidth = 1.0
        }
    }
    @IBOutlet weak var otherAmountTF: UITextField!{
        didSet{
            self.otherAmountTF.layer.cornerRadius = 15
            self.otherAmountTF.layer.masksToBounds = true
            self.otherAmountTF.layer.borderColor = UIColor.blue.cgColor
            self.otherAmountTF.layer.borderWidth = 1.0
        }
    }
    
    var isAqiqahId:String!
    @IBOutlet weak var fourtyFiveBtn: UIButton!
    @IBOutlet weak var dismissCustomViewBackBtn: UIButton!
    @IBOutlet weak var dataViveww: UIView!
    @IBOutlet weak var customVieww: UIView!
    var categoriesData = [[String:Any]]()
    var userid:String!
    var totalAmountArray = [String]()
    var nameArray = [String]()
    var RaisedArray = [String]()
    var idArray = [Int]()
    var charitylbl:String!
    var familyInNeedlbl:String!
    var familyInNeedId:Int!
    var charityId:Int!
    var destressRelieflbl:String!
    var destressId:Int!
    var giftlbl:String!
    var giftID:Int!
    var dailySadaqu:String!
    var dailysadaquID:Int!
    var nextDoorNeighbor:String!
    var nextDoorNeighborID:Int!
    var awarenessSocialLbl:String!
    var awarenessSocialID:Int!
    var helpInLbl:String!
    var helpInId:Int!
    var EconmimcEmpowermentLbl:String!
    var houseMaintenanceLbl:String!
    var HousingProject:String!
    var conditionsElectroincs:String!
    var EconmimcEmpowermentId:Int!
    var houseMaintenanceId:Int!
    var HousingProjectId:Int!
    var conditionsElectroincsID:Int!
    var specialNeedslbl:String!
    var specialNeedsId:Int!
    var orphanLbl:String!
    var orphanID:Int!
    var StudentsLbl:String!
    var studentsID:Int!
    var clothingAPoorlbl:String!
    var clothingApoorId:Int!
    var publicSadaqatlbl:String!
    var publicSadaqatID:Int!
    var HomeforThemLbl:String!
    var HomeforID:Int!
    var schoolBagProject:String!
    var schoolBagProjectID:Int!
    var amount:String!
    var otheramount:String!
    var totalAmount:String!
    var Aqiqahlbl:String!
    var AqiqahID:Int!
    var vowlbl:String!
    var vowId:Int!
    var Sacrificelbl:String!
    var SacrificeId:Int!
    var totalAmountValue:String!
    var sacrificetoatalAmountValue:String!
    var sacrifice45_2Valueamount:String!
    var sacrifice315Valueamount:String!
    var my45countValue:String!
    var my45_2countValue:String!
    var my315countValue:String!
    var Fastingransomlbl:String!
    var Basketlbl:String!
    var foodamountValue:String!
    var BasketId:Int!
    var FastingId:Int!
    var Food1myValue:String!
    var Food5myValue:String!
    var Food10myValue:String!
    var Food20myValue:String!
    @IBOutlet weak var cashAmountConstraintVow: NSLayoutConstraint!
    @IBOutlet weak var sacrificeVieww: UIView!
    @IBOutlet weak var sacrificeBackBtn: UIButton!
    @IBOutlet weak var closeSacrificeBtn: UIButton!
    @IBOutlet weak var sacrifice45Btn: UIButton!
    @IBOutlet weak var sacrifice45_2Btn: UIButton!
    @IBOutlet weak var sacrifice315Btn: UIButton!
    var ExpirationbrokenOath:String!
    var ExpirationID:Int!
    @IBOutlet weak var sacrificeAddamountsTF: UITextField!{
        didSet{
            self.sacrificeAddamountsTF.layer.cornerRadius = 15.0
            self.sacrificeAddamountsTF.layer.masksToBounds = true
            self.sacrificeAddamountsTF.layer.borderWidth = 1
            self.sacrificeAddamountsTF.layer.borderColor = UIColor.blue.cgColor
        }
    }
    @IBOutlet weak var sacrificeTotalAmountTF: UITextField!{
        didSet{
            self.sacrificeTotalAmountTF.layer.cornerRadius = 15.0
            self.sacrificeTotalAmountTF.layer.masksToBounds = true
            self.sacrificeTotalAmountTF.layer.borderWidth = 1
            self.sacrificeTotalAmountTF.layer.borderColor = UIColor.blue.cgColor
        }
    }
    @IBOutlet weak var sacrificeAmountLbl: UILabel!
    @IBOutlet weak var sacrificeDonateBtn: UIButton!{
        didSet{
            self.sacrificeDonateBtn.layer.cornerRadius = 15.0
            self.sacrificeDonateBtn.layer.masksToBounds = true
        }
    }
    
    var titleArray = ["Friday Charity","Aqiqah","Vow","Sacrifice","Orphan Charity","Fasting ransom","A gift","Condition & Electronics","Economic empowerment","House maintenance","Student support","Special needs","Family in need","Orphan","Expiation for a broken Oath","Clothing a poor","Food basket","Public sadaqat","Home for them","School bag project","Detress Relief","Housing Project"]
    
    var titleArabciArray = ["صدقة الجمعة","العقيقة","نذر","تصحية","صدقة ليتيم","فدية صيام","إرسال هدية","الشروط والالكترونيات","التمكين الاقتصادي","صيانة المنزل","طالب علم","الاحتياجات الخاصة","عائلة محتاجة","يتيم","كفارة حنث اليمين","ملابس رديئة","سلة طعام","صدقات عامة","منزل يؤويهم","مشروع الحقيبة المدرسية","تخفيف الضيق","مشروع اسكان"]
    
    var imgArray = ["charity","aqiqah","vow","sacrifice","gift_s","electronics","economic","maintainence","house","student","need","family","hand","expiation","clothing","food","public","house","student","detress","house"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            quickDonationLbl.text = "التبرع السريع"
            totalAmountLbl.text = "45 OMR"
            totalAmountValue = "45"
            vow45Amtlbl.text = "45 OMR"
            self.sacrificetoatalAmountValue = "45"
            self.cashAmountConstraintVow.constant = 0
            userid = UserDefaults.standard.string(forKey: "id")
            if userid == nil{
                self.donationRapidTB.isHidden = true
                let alert = UIAlertController(title: "", message:"Please Login For Access Donate".l10n(), preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok".l10n(), style: .default, handler: {(_ action: UIAlertAction) -> Void in
                    Constant.isLoginView = true
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }))
                
                self.present(alert, animated: true, completion: nil)
            }else{
                self.donationRapidTB.isHidden = false
            }
            donationRapidTB.dataSource = self
            donationRapidTB.delegate = self
            fourtyFiveBtn.addTarget(self, action: #selector(fourtyFivebtnAction), for: .touchUpInside)
            totalAmountTF.isUserInteractionEnabled = false
            otherAmountTF.delegate = self
            donateNowBtn.addTarget(self, action: #selector(DonateNowBtn), for: .touchUpInside)
            dismissCustomViewBackBtn.addTarget(self, action: #selector(backdismiss), for: .touchUpInside)
            fourntyFiveBtn.addTarget(self, action: #selector(fourtyFiveAct), for: .touchUpInside)
            twentyFiftyZeroBtn.addTarget(self, action: #selector(twoHunderedAct), for: .touchUpInside)
            cashBtn.addTarget(self, action: #selector(CashAct), for: .touchUpInside)
            viewTotalAmountTF.isUserInteractionEnabled = false
            vowOtherAmountTF.delegate = self
            vowViewDismissBtn.addTarget(self, action: #selector(backdismiss), for: .touchUpInside)
            backDismissAqiahBtn.addTarget(self, action: #selector(backdismiss), for: .touchUpInside)
            sacrificeBackBtn.addTarget(self, action: #selector(backdismiss), for: .touchUpInside)
            vowDonateBtn.addTarget(self, action: #selector(donateVow), for: .touchUpInside)
            self.sacrificeVieww.isHidden = true
            sacrifice45Btn.addTarget(self, action: #selector(sacrifice45Act), for: .touchUpInside)
            sacrifice45_2Btn.addTarget(self, action: #selector(sacrifice452Act), for: .touchUpInside)
            sacrifice315Btn.addTarget(self, action: #selector(sacrifice315Act), for: .touchUpInside)
            sacrificeDonateBtn.addTarget(self, action: #selector(donateSacrificeBtn), for: .touchUpInside)
            self.sacrificeAddamountsTF.delegate = self
            my45countValue = "45"
            Food1myValue = "1"
            foodOneBtn.addTarget(self, action: #selector(foodOneBtnAction), for: .touchUpInside)
            foodFiveBtn.addTarget(self, action: #selector(foodfiveBtnAction), for: .touchUpInside)
            foodTenBtn.addTarget(self, action: #selector(foodtenBtnAction), for: .touchUpInside)
            foodTwentyBtn.addTarget(self, action: #selector(foodtwentyBtnAction), for: .touchUpInside)
            self.foodAmountLbl.text = "1 OMR"
            foodOtherAmoutnsTF.delegate = self
            foodTotalAmountTF.isUserInteractionEnabled = false
            foodDonateNowBtn.addTarget(self, action: #selector(foodDonation), for: .touchUpInside)
            foodamountValue = "1"
            foodbasketBackBtn.addTarget(self, action: #selector(backdismiss), for: .touchUpInside)
            foodbasketDismissBtn.addTarget(self, action: #selector(backdismiss), for: .touchUpInside)
            foodBasketVieww.isHidden = true
            
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            quickDonationLbl.text = "Quick Donation"
            totalAmountLbl.text = "45 OMR"
            totalAmountValue = "45"
            vow45Amtlbl.text = "45 OMR"
            self.sacrificetoatalAmountValue = "45"
            self.cashAmountConstraintVow.constant = 0
            userid = UserDefaults.standard.string(forKey: "id")
            if userid == nil{
                self.donationRapidTB.isHidden = true
                let alert = UIAlertController(title: "", message:"Please Login For Access Donate".l10n(), preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok".l10n(), style: .default, handler: {(_ action: UIAlertAction) -> Void in
                    Constant.isLoginView = true
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }))
                
                self.present(alert, animated: true, completion: nil)
            }else{
                self.donationRapidTB.isHidden = false
            }
            donationRapidTB.dataSource = self
            donationRapidTB.delegate = self
            fourtyFiveBtn.addTarget(self, action: #selector(fourtyFivebtnAction), for: .touchUpInside)
            totalAmountTF.isUserInteractionEnabled = false
            otherAmountTF.delegate = self
            donateNowBtn.addTarget(self, action: #selector(DonateNowBtn), for: .touchUpInside)
            dismissCustomViewBackBtn.addTarget(self, action: #selector(backdismiss), for: .touchUpInside)
            fourntyFiveBtn.addTarget(self, action: #selector(fourtyFiveAct), for: .touchUpInside)
            twentyFiftyZeroBtn.addTarget(self, action: #selector(twoHunderedAct), for: .touchUpInside)
            cashBtn.addTarget(self, action: #selector(CashAct), for: .touchUpInside)
            viewTotalAmountTF.isUserInteractionEnabled = false
            vowOtherAmountTF.delegate = self
            vowViewDismissBtn.addTarget(self, action: #selector(backdismiss), for: .touchUpInside)
            backDismissAqiahBtn.addTarget(self, action: #selector(backdismiss), for: .touchUpInside)
            sacrificeBackBtn.addTarget(self, action: #selector(backdismiss), for: .touchUpInside)
            vowDonateBtn.addTarget(self, action: #selector(donateVow), for: .touchUpInside)
            self.sacrificeVieww.isHidden = true
            sacrifice45Btn.addTarget(self, action: #selector(sacrifice45Act), for: .touchUpInside)
            sacrifice45_2Btn.addTarget(self, action: #selector(sacrifice452Act), for: .touchUpInside)
            sacrifice315Btn.addTarget(self, action: #selector(sacrifice315Act), for: .touchUpInside)
            sacrificeDonateBtn.addTarget(self, action: #selector(donateSacrificeBtn), for: .touchUpInside)
            self.sacrificeAddamountsTF.delegate = self
            my45countValue = "45"
            Food1myValue = "1"
            foodOneBtn.addTarget(self, action: #selector(foodOneBtnAction), for: .touchUpInside)
            foodFiveBtn.addTarget(self, action: #selector(foodfiveBtnAction), for: .touchUpInside)
            foodTenBtn.addTarget(self, action: #selector(foodtenBtnAction), for: .touchUpInside)
            foodTwentyBtn.addTarget(self, action: #selector(foodtwentyBtnAction), for: .touchUpInside)
            self.foodAmountLbl.text = "1 OMR"
            foodOtherAmoutnsTF.delegate = self
            foodTotalAmountTF.isUserInteractionEnabled = false
            foodDonateNowBtn.addTarget(self, action: #selector(foodDonation), for: .touchUpInside)
            foodamountValue = "1"
            foodbasketBackBtn.addTarget(self, action: #selector(backdismiss), for: .touchUpInside)
            foodbasketDismissBtn.addTarget(self, action: #selector(backdismiss), for: .touchUpInside)
            foodBasketVieww.isHidden = true
        }
        
    }
    
    @objc func foodDonation(){
        if foodOtherAmoutnsTF.text == nil{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.amount = foodamountValue
            vc.cartID = BasketId
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }else if foodOtherAmoutnsTF.text == ""{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.amount = foodamountValue
            vc.cartID = BasketId
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }else{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.amount = foodOtherAmoutnsTF.text!
            vc.cartID = BasketId
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    
    @objc func foodOneBtnAction(){
        foodAmountLbl.text = "1 OMR"
        foodamountValue = "1"
        foodOneBtn.setImage(UIImage(named: "donation_1"), for: UIControl.State.normal)
        foodFiveBtn.setImage(UIImage(named: "donation_5"), for: UIControl.State.normal)
        foodTenBtn.setImage(UIImage(named: "donation_10"), for: UIControl.State.normal)
        foodTwentyBtn.setImage(UIImage(named: "donation_20"), for: UIControl.State.normal)
        Food1myValue = "1"
        Food5myValue = ""
        Food10myValue = ""
        Food20myValue = ""
    }
    @objc func foodfiveBtnAction(){
        foodAmountLbl.text = "5 OMR"
        foodamountValue = "5"
        foodOneBtn.setImage(UIImage(named: "donation_1_1"), for: UIControl.State.normal)
        foodFiveBtn.setImage(UIImage(named: "donation_5_1"), for: UIControl.State.normal)
        foodTenBtn.setImage(UIImage(named: "donation_10"), for: UIControl.State.normal)
        foodTwentyBtn.setImage(UIImage(named: "donation_20"), for: UIControl.State.normal)
        Food1myValue = ""
        Food5myValue = "5"
        Food10myValue = ""
        Food20myValue = ""
    }
    @objc func foodtenBtnAction(){
        foodAmountLbl.text = "10 OMR"
        foodamountValue = "10"
        foodOneBtn.setImage(UIImage(named: "donation_1_1"), for: UIControl.State.normal)
        foodFiveBtn.setImage(UIImage(named: "donation_5"), for: UIControl.State.normal)
        foodTenBtn.setImage(UIImage(named: "donation_10_2"), for: UIControl.State.normal)
        foodTwentyBtn.setImage(UIImage(named: "donation_20"), for: UIControl.State.normal)
        Food1myValue = ""
        Food5myValue = ""
        Food10myValue = "10"
        Food20myValue = ""
    }
    @objc func foodtwentyBtnAction(){
        foodAmountLbl.text = "20 OMR"
        foodamountValue = "20"
        foodOneBtn.setImage(UIImage(named: "donation_1_1"), for: UIControl.State.normal)
        foodFiveBtn.setImage(UIImage(named: "donation_5"), for: UIControl.State.normal)
        foodTenBtn.setImage(UIImage(named: "donation_10"), for: UIControl.State.normal)
        foodTwentyBtn.setImage(UIImage(named: "donation_20_2"), for: UIControl.State.normal)
        Food1myValue = ""
        Food5myValue = ""
        Food10myValue = ""
        Food20myValue = "20"
    }
    
    @objc func sacrifice45Act(){
        self.sacrificeAddamountsTF.text = ""
        self.sacrificeAmountLbl.text = "45 OMR"
        sacrificetoatalAmountValue = "45"
        my45countValue = "45"
        my315countValue = ""
        my45_2countValue = ""
        sacrifice45Btn.setImage(UIImage(named: "donation_45"), for: UIControl.State.normal)
        sacrifice45_2Btn.setImage(UIImage(named: "donation_45_2"), for: UIControl.State.normal)
        sacrifice315Btn.setImage(UIImage(named: "donation_315"), for: UIControl.State.normal)
    }
    
    @objc func sacrifice452Act(){
        self.sacrificeAddamountsTF.text = ""
        self.sacrificeAmountLbl.text = "45 OMR"
        sacrificetoatalAmountValue = "45"
        sacrifice45_2Valueamount = "45"
        my45_2countValue = "45_2"
        my315countValue = ""
        my45countValue = ""
        sacrifice45Btn.setImage(UIImage(named: "donation_45_2"), for: UIControl.State.normal)
        sacrifice45_2Btn.setImage(UIImage(named: "donation_45"), for: UIControl.State.normal)
        sacrifice315Btn.setImage(UIImage(named: "donation_315"), for: UIControl.State.normal)
    }
    
    @objc func sacrifice315Act(){
        self.sacrificeAmountLbl.text = "315 OMR"
        self.sacrificeAddamountsTF.text = ""
        sacrificetoatalAmountValue = "315"
        sacrifice315Valueamount = "315"
        my315countValue = "315"
        my45countValue = ""
        my45_2countValue = ""
        sacrifice45Btn.setImage(UIImage(named: "donation_45_2"), for: UIControl.State.normal)
        sacrifice45_2Btn.setImage(UIImage(named: "donation_45_2"), for: UIControl.State.normal)
        sacrifice315Btn.setImage(UIImage(named: "donation_315_2"), for: UIControl.State.normal)
    }
    
    @objc func fourtyFiveAct(){
        vow45Amtlbl.text = "45 OMR"
        totalAmountValue = "45"
        fourntyFiveBtn.setImage(UIImage(named: "donation_45"), for: UIControl.State.normal)
        twentyFiftyZeroBtn.setImage(UIImage(named: "donation_250"), for: UIControl.State.normal)
        cashBtn.setImage(UIImage(named: "cash"), for: UIControl.State.normal)
        cashAmountConstraintVow.constant = 0
    }
    
    @objc func donateSacrificeBtn(){
        if sacrificeAddamountsTF.text == nil{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.amount = sacrificetoatalAmountValue
            vc.cartID = SacrificeId
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }else if sacrificeAddamountsTF.text == ""{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.amount = sacrificetoatalAmountValue
            vc.cartID = SacrificeId
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }else{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.amount = sacrificeAddamountsTF.text!
            vc.cartID = SacrificeId
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    
    @objc func twoHunderedAct(){
        vow45Amtlbl.text = "250 OMR"
        totalAmountValue = "250"
        fourntyFiveBtn.setImage(UIImage(named: "donation_45_2"), for: UIControl.State.normal)
        twentyFiftyZeroBtn.setImage(UIImage(named: "donation_250_2"), for: UIControl.State.normal)
        cashBtn.setImage(UIImage(named: "cash"), for: UIControl.State.normal)
        cashAmountConstraintVow.constant = 0
    }
    
    @objc func CashAct(){
        vow45Amtlbl.text = "Cash OMR"
        fourntyFiveBtn.setImage(UIImage(named: "donation_45_2"), for: UIControl.State.normal)
        twentyFiftyZeroBtn.setImage(UIImage(named: "donation_250"), for: UIControl.State.normal)
        cashBtn.setImage(UIImage(named: "cash_1"), for: UIControl.State.normal)
        cashAmountConstraintVow.constant = 55
    }
    
    @objc func backdismiss(){
        tabBarController?.selectedIndex = 0
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.otherAmountTF{
            if otherAmountTF.text == ""{
                
                fourtyFiveBtn.setImage(UIImage(named: "donation_45"), for: UIControl.State.normal)
            }
            else{
                
                fourtyFiveBtn.setImage(UIImage(named: "donation_45_2"), for: UIControl.State.normal)
            }
        }
        
        if textField == self.sacrificeAddamountsTF{
            if my45countValue == "45"{
                if sacrificeAddamountsTF.text == ""{
                    if my45countValue == "45"{
                        sacrifice45Btn.setImage(UIImage(named: "donation_45"), for: UIControl.State.normal)
                        my45countValue = ""
                    }
                }else{
                    if my45countValue == "45"{
                        sacrifice45Btn.setImage(UIImage(named: "donation_45_2"), for: UIControl.State.normal)
                        
                    }
                }
            }
            
            if my45_2countValue == "45_2"{
                if sacrificeAddamountsTF.text == ""{
                    if my45_2countValue == "45_2"{
                        sacrifice45_2Btn.setImage(UIImage(named: "donation_45"), for: UIControl.State.normal)
                        my45_2countValue = ""
                    }
                }else{
                    if my45_2countValue == "45_2"{
                        sacrifice45_2Btn.setImage(UIImage(named: "donation_45_2"), for: UIControl.State.normal)
                        
                    }
                }
            }
            
            if my315countValue == "315"{
                if sacrificeAddamountsTF.text == ""{
                    if my315countValue == "315"{
                        sacrifice315Btn.setImage(UIImage(named: "donation_315_2"), for: UIControl.State.normal)
                        my315countValue = ""
                    }
                }else{
                    if my315countValue == "315"{
                        sacrifice315Btn.setImage(UIImage(named: "donation_315"), for: UIControl.State.normal)
                        
                    }
                }
            }

            
            
        }
        
        if textField == self.foodOtherAmoutnsTF{
            if Food1myValue == "1"{
                if foodOtherAmoutnsTF.text == ""{
                    if Food1myValue == "1"{
                        foodOneBtn.setImage(UIImage(named: "donation_1"), for: UIControl.State.normal)
                        Food1myValue = ""
                    }
                }else{
                    if Food1myValue == "1"{
                        foodOneBtn.setImage(UIImage(named: "donation_1_1"), for: UIControl.State.normal)
                        
                    }
                }
            }
            
            if Food5myValue == "5"{
                if foodOtherAmoutnsTF.text == ""{
                    if Food5myValue == "5"{
                        foodFiveBtn.setImage(UIImage(named: "donation_5_1"), for: UIControl.State.normal)
                        Food5myValue = ""
                    }
                }else{
                    if Food5myValue == "5"{
                        foodFiveBtn.setImage(UIImage(named: "donation_5"), for: UIControl.State.normal)
                        
                    }
                }
            }
            
            if Food10myValue == "10"{
                if foodOtherAmoutnsTF.text == ""{
                    if Food10myValue == "10"{
                        foodTenBtn.setImage(UIImage(named: "donation_10_2"), for: UIControl.State.normal)
                        Food10myValue = ""
                    }
                }else{
                    if Food10myValue == "10"{
                        foodTenBtn.setImage(UIImage(named: "donation_10"), for: UIControl.State.normal)
                        
                    }
                }
            }

            if Food20myValue == "20"{
                if foodOtherAmoutnsTF.text == ""{
                    if Food20myValue == "20"{
                        foodTwentyBtn.setImage(UIImage(named: "donation_20_2"), for: UIControl.State.normal)
                        Food20myValue = ""
                    }
                }else{
                    if Food20myValue == "20"{
                        foodTwentyBtn.setImage(UIImage(named: "donation_20"), for: UIControl.State.normal)
                        
                    }
                }
            }
            
        }
        
        
        
        if textField == self.vowOtherAmountTF{
            vow45Amtlbl.text = "\(vowOtherAmountTF.text!) OMR"
            totalAmountValue = vowOtherAmountTF.text!
            print(totalAmountValue!)
        }
    }
   
    
    @objc func fourtyFivebtnAction(){
        fourtyFiveBtn.setImage(UIImage(named: "donation_45_2"), for: UIControl.State.normal)
    }
    
    @objc func donateVow(){
        if vowOtherAmountTF.text == nil{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.modalPresentationStyle = .fullScreen
            vc.amount = totalAmountValue
            vc.cartID = vowId
            self.present(vc, animated: true)
        }else if vowOtherAmountTF.text == ""{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.modalPresentationStyle = .fullScreen
            vc.amount = totalAmountValue
            vc.cartID = vowId
            self.present(vc, animated: true)
        }else{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.modalPresentationStyle = .fullScreen
            vc.amount = totalAmountValue
            vc.cartID = vowId
            self.present(vc, animated: true)
        }
    }
    

    func getCauses(){
        //self.loadinHubShow()
        if Reachability.isConnectedToNetwork(){
            let parameters = [
                "api_token": "WNi3oumvqu8ADhvWLqhPN18FhGplwwYgVYuWaHfrFInZcgI2J7o0obuWIIO5"]
            print(parameters)
                let url = "\(Constants.Common.finalURL)all-causes"
            print(url)
            AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).responseJSON {
                        response in
                        switch (response.result) {
                        case .success(let json):
                            let response = json as! [String:AnyObject]
                            print(response)
                            self.nameArray.removeAll()
                            self.idArray.removeAll()
                            DispatchQueue.main.async {
                                let data = response["data"] as! Array<Any>
                                for i in 0 ..< data.count{
                                    let x = data[i] as! [String:AnyObject]
                                    let id = x["id"] as? Int ?? 0
                                    let title = x["title"] as? String ?? ""
                                    self.idArray.append(id)
                                    self.nameArray.append(title)
                                    print(self.titleArray)
                                    if title == "Friday charity"{
                                        self.charitylbl = title
                                    }
                                    if id == 89{
                                        self.charityId = id
                                    }
                                    if title == "Destress Relief"{
                                        self.destressRelieflbl = title
                                    }
                                    if id == 64{
                                        self.destressId = id
                                    }
                                    if title == "Gift"{
                                        self.giftlbl = title
                                    }
                                    if id == 81{
                                        self.giftID = id
                                    }
                                    if title == "Daily Sadaqa"{
                                        self.dailySadaqu = title
                                    }
                                    if id == 93{
                                        self.dailysadaquID = id
                                    }
                                    if title == "Next Door Neighbor"{
                                        self.nextDoorNeighbor = title
                                    }
                                    if id == 94{
                                        self.nextDoorNeighborID = id
                                    }
                                    if title == "Family in Need"{
                                        self.familyInNeedlbl = title
                                    }
                                    if id == 74{
                                        self.familyInNeedId = id
                                    }
                                    if title == "Awareness & Social Programs"{
                                        self.awarenessSocialLbl = title
                                    }
                                    if id == 91{
                                        self.awarenessSocialID = id
                                    }
                                    if title == "Help in Married"{
                                        self.helpInLbl = title
                                    }
                                    if id == 82{
                                        self.helpInId = id
                                    }
                                    if title == "Economic empowerment"{
                                        self.EconmimcEmpowermentLbl = title
                                    }
                                    if id == 79{
                                        self.EconmimcEmpowermentId = id
                                    }
                                    if title == "House maintenance"{
                                        self.houseMaintenanceLbl = title
                                    }
                                    if id == 78{
                                        self.houseMaintenanceId = id
                                    }
                                    if title == "Housing Projects"{
                                        self.HousingProject = title
                                    }
                                    if id == 77{
                                        self.HousingProjectId = id
                                    }
                                    if title == "Conditions & Electronics"{
                                        self.conditionsElectroincs = title
                                    }
                                    if id == 80{
                                        self.conditionsElectroincsID = id
                                    }
                                    if title == "Special Needs"{
                                        self.specialNeedslbl = title
                                    }
                                    if id == 75{
                                        self.specialNeedsId = id
                                    }
                                    if title == "Orphan"{
                                        self.orphanLbl = title
                                    }
                                    if id == 73{
                                        self.orphanID = id
                                    }
                                    if title == "Students"{
                                        self.StudentsLbl = title
                                    }
                                    if id == 76{
                                        self.studentsID = id
                                    }
                                    if title == "Clothing a Poor"{
                                        self.clothingAPoorlbl = title
                                    }
                                    if id == 71{
                                        self.clothingApoorId = id
                                    }
                                    if title == "Public sadaqat"{
                                        self.publicSadaqatlbl = title
                                    }
                                    if id == 69{
                                        self.publicSadaqatID = id
                                    }
                                    if title == "Home For Them"{
                                        self.HomeforThemLbl = title
                                    }
                                    if id == 68{
                                        self.HomeforID = id
                                    }
                                    if title == "School Bag Project"{
                                        self.schoolBagProject = title
                                    }
                                    if id == 90{
                                        self.schoolBagProjectID = id
                                    }
                                    if title == "Aqiqah"{
                                        self.Aqiqahlbl = title
                                    }
                                    if id == 87{
                                        self.AquiahId = id
                                    }
                                    if title == "Vow"{
                                        self.vowlbl = title
                                    }
                                    if id == 86{
                                        self.VowID = id
                                    }
                                    if title == "Sacrifice"{
                                        self.Sacrificelbl = title
                                    }
                                    if id == 85{
                                        self.SacrificeId = id
                                    }
                                    if title == "Fasting Ransom"{
                                        self.Fastingransomlbl = title
                                    }
                                    if id == 83{
                                        self.FastingId = id
                                    }
                                    if title == "Expiration  for  A broken Oath"{
                                        self.ExpirationbrokenOath = title
                                    }
                                    
                                    if id == 72{
                                        self.ExpirationID = id
                                    }
                                    if title == "Food Basket"{
                                        self.Basketlbl = title
                                    }
                                    if id == 70{
                                        self.BasketId = id
                                    }
                                    
                                }
                               // self.donationRapidTB.reloadData()
                            }
                            break
                        case .failure:
                            print(Error.self)
                            let alert = UIAlertController(title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "Baseet-Driver", comment: ""), message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "Unable To Connect Server", comment: ""), preferredStyle: UIAlertController.Style.alert)
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
    
    override func viewWillAppear(_ animated: Bool) {
        self.getCauses()
        self.customVieww.isHidden = true
        self.donationRapidTB.isHidden = false
        self.dataViveww.isHidden = false
        self.vowVieww.isHidden = true
        self.sacrificeVieww.isHidden = true
        self.foodBasketVieww.isHidden = true
    }
    
    func formFoodBasket(){
        self.customVieww.isHidden = true
        self.donationRapidTB.isHidden = true
        self.dataViveww.isHidden = true
        self.vowVieww.isHidden = true
        self.sacrificeVieww.isHidden = true
        self.foodBasketVieww.isHidden = false
    }
    
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @objc func DonateNowBtn(){
        if otherAmountTF.text == nil{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.modalPresentationStyle = .fullScreen
            if isAqiqahId == "Aqiqah"{
                vc.cartID = AqiqahID
                vc.amount = "45"
            }
            if isAqiqahId == "expiration"{
                vc.amount = "20"
                vc.cartID = ExpirationID
            }
            if isAqiqahId == "ransom"{
                vc.amount = "45"
                vc.cartID = FastingId
            }
            
            self.present(vc, animated: true)
        }else if otherAmountTF.text == ""{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.modalPresentationStyle = .fullScreen
            if isAqiqahId == "Aqiqah"{
                vc.cartID = AqiqahID
                vc.amount = "45"
            }
            if isAqiqahId == "expiration"{
                vc.amount = "20"
                vc.cartID = ExpirationID
            }
            if isAqiqahId == "ransom"{
                vc.amount = "45"
                vc.cartID = FastingId
            }
            self.present(vc, animated: true)
        }else{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.modalPresentationStyle = .fullScreen
            if isAqiqahId == "Aqiqah"{
                vc.cartID = AqiqahID
                vc.amount = otherAmountTF.text!
            }
            if isAqiqahId == "ransom"{
                vc.cartID = FastingId
                vc.amount = otherAmountTF.text!
            }
            if isAqiqahId == "expiration"{
                vc.cartID = ExpirationID
                vc.amount = otherAmountTF.text!
            }
            self.present(vc, animated: true)
        }
    }
    

}

extension RapidDonationVC:UITableViewDelegate,UITableViewDataSource

{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            return titleArabciArray.count
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            return titleArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RapidDonationTVCell", for: indexPath) as! RapidDonationTVCell
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            cell.titelLbl.text = titleArabciArray[indexPath.row]
            if imgArray.count > 0 && indexPath.row < imgArray.count {
            cell.donateImg.image = UIImage.init(named: imgArray[indexPath.row])
            }
            cell.selectionStyle = .none
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            cell.titelLbl.text = titleArray[indexPath.row]
            if imgArray.count > 0 && indexPath.row < imgArray.count {
            cell.donateImg.image = UIImage.init(named: imgArray[indexPath.row])
            }
            cell.selectionStyle = .none
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
            vc.modalTransitionStyle = .coverVertical
            vc.titleText = "Friday Charity"
            vc.imgView = "FridayCharity"
            vc.sadaquId = "\(charityId!)"
            vc.descriptionString = "On the authority of Uqbah Aamer, may God be pleased with him, that the Messenger of God, may God bless him and grant him peace He said (A man is in the shade of his charity until it is decided betweeen the people). narrated by Ahmed"
            present(vc, animated: true,completion: nil)
        }
        if indexPath.row == 1{
            /*self.customVieww.isHidden = false
            self.donationRapidTB.isHidden = true
            self.dataViveww.isHidden = true
            self.vowVieww.isHidden = true
            self.sacrificeVieww.isHidden = true
            self.foodBasketVieww.isHidden = true
            self.customlbl.text = "Aqiqah"
            self.titlelbl.text = "Aqiqah"
            self.anmalLbl.text = "Sheep"
            self.customImg.image = UIImage.init(named: "aqaya")
            isAqiqahId = "Aqiqah"
            fourtyFiveBtn.setImage(UIImage.init(named: "donation_45"), for: .normal)
            totalAmountLbl.text = "45 OMR"*/
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
            vc.expirationId = AquiahId
            vc.isAquiuah = "Aqiuah"
           vc.modalTransitionStyle = .coverVertical
           present(vc, animated: true,completion: nil)
        }
        if indexPath.row == 2{
            /*self.customVieww.isHidden = true
            self.donationRapidTB.isHidden = true
            self.dataViveww.isHidden = true
            self.vowVieww.isHidden = false
            self.sacrificeVieww.isHidden = true
            self.foodBasketVieww.isHidden = true*/
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
            vc.modalTransitionStyle = .coverVertical
            vc.isVow = "Vow"
            vc.sacrificeId = VowID
            present(vc, animated: true,completion: nil)
        }
        if indexPath.row == 3{
            /*self.customVieww.isHidden = true
            self.donationRapidTB.isHidden = true
            self.dataViveww.isHidden = true
            self.vowVieww.isHidden = true
            self.sacrificeVieww.isHidden = false
            foodBasketVieww.isHidden = true*/
            
           /* let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
            vc.modalTransitionStyle = .coverVertical
            vc.isSacrifice = "Sacrifice"
            vc.sacrificeId = SacrificeId
            self.definesPresentationContext = true
            self.present(vc, animated: true, completion: nil)*/
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
            vc.modalTransitionStyle = .coverVertical
            vc.isSacrifice = "Sacrifice"
            vc.sacrificeId = SacrificeId
            present(vc, animated: true,completion: nil)
        }
        if indexPath.row == 4{
            let vc = storyboard?.instantiateViewController(withIdentifier: "SponserShipVC") as! SponserShipVC
           vc.modalTransitionStyle = .coverVertical
            vc.titleText = "\(orphanLbl!) charity"
            vc.id = orphanID
           present(vc, animated: true,completion: nil)
        }
        if indexPath.row == 5{
           /* self.customVieww.isHidden = false
            self.donationRapidTB.isHidden = true
            self.dataViveww.isHidden = true
            self.vowVieww.isHidden = true
            self.sacrificeVieww.isHidden = true
            foodBasketVieww.isHidden = true
            self.customlbl.text = "Fasting ransom"
            self.titlelbl.text = "Fasting ransom"
            self.anmalLbl.text = "A day"
            self.customImg.image = UIImage.init(named: "aqaya")
            fourtyFiveBtn.setImage(UIImage.init(named: "donation_45"), for: .normal)
            isAqiqahId = "ransom"
            totalAmountLbl.text = "45 OMR"*/
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
            vc.modalTransitionStyle = .coverVertical
            vc.isFastingRansom = "IsFastingRansom"
            vc.sacrificeId = FastingId
            self.present(vc, animated: true, completion: nil)
        }
        if indexPath.row == 6{
            let vc = storyboard?.instantiateViewController(withIdentifier: "GiftVC") as! GiftVC
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        if indexPath.row == 7{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
            vc.modalTransitionStyle = .coverVertical
            vc.titleText = conditionsElectroincs
            vc.id = conditionsElectroincsID
            self.present(vc, animated: true)
        }
        if indexPath.row == 8{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
            vc.modalTransitionStyle = .coverVertical
            vc.titleText = EconmimcEmpowermentLbl
            vc.id = EconmimcEmpowermentId
            self.present(vc, animated: true)
        }
        if indexPath.row == 9{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
            vc.modalTransitionStyle = .coverVertical
            vc.titleText = houseMaintenanceLbl
            vc.id = houseMaintenanceId
            self.present(vc, animated: true)
        }
        if indexPath.row == 10{
            let vc = storyboard?.instantiateViewController(withIdentifier: "SponserShipVC") as! SponserShipVC
           vc.modalTransitionStyle = .coverVertical
            vc.titleText = "\(StudentsLbl!) support"
            vc.id = studentsID
           present(vc, animated: true,completion: nil)
        }
        if indexPath.row == 11{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
            vc.modalTransitionStyle = .coverVertical
            vc.titleText = specialNeedslbl
            vc.id = specialNeedsId
            self.present(vc, animated: true)
        }
        if indexPath.row == 12{
            let vc = storyboard?.instantiateViewController(withIdentifier: "SponserShipVC") as! SponserShipVC
           vc.modalTransitionStyle = .coverVertical
            vc.titleText = familyInNeedlbl
            vc.id = familyInNeedId
           present(vc, animated: true,completion: nil)
        }
        if indexPath.row == 13{
            let vc = storyboard?.instantiateViewController(withIdentifier: "SponserShipVC") as! SponserShipVC
            vc.modalTransitionStyle = .coverVertical
            vc.titleText = orphanLbl
            vc.id = orphanID
            present(vc, animated: true,completion: nil)
        }
        if indexPath.row == 14{
            /*self.customVieww.isHidden = false
            self.donationRapidTB.isHidden = true
            self.dataViveww.isHidden = true
            self.vowVieww.isHidden = true
            self.sacrificeVieww.isHidden = true
            self.foodBasketVieww.isHidden = true
            self.customlbl.text = "Expiation for a broken Oath"
            self.titlelbl.text = "Expiation for a broken Oath"
            self.anmalLbl.text = ""
            self.customImg.image = UIImage.init(named: "aqaya")
            fourtyFiveBtn.setImage(UIImage.init(named: "donation_20_2"), for: .normal)
            totalAmountLbl.text = "20 OMR"
            isAqiqahId = "expiration"*/
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
            vc.expirationId = ExpirationID
            vc.isExpirationAuth = "expirationFromDashboard"
            self.present(vc, animated: true, completion: nil)
        }
        if indexPath.row == 15{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
            vc.modalTransitionStyle = .coverVertical
            vc.titleText = clothingAPoorlbl
            vc.id = clothingApoorId
            self.present(vc, animated: true)
        }
        if indexPath.row == 16{
            /*self.customVieww.isHidden = true
            self.donationRapidTB.isHidden = true
            self.dataViveww.isHidden = true
            self.vowVieww.isHidden = true
            self.sacrificeVieww.isHidden = true
            self.foodBasketVieww.isHidden = false*/
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
            vc.BasketId = BasketId
            vc.foodbasket = "fromDashboard"
            self.present(vc, animated: true, completion: nil)
        }
        if indexPath.row == 17{
            let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
            vc.modalTransitionStyle = .coverVertical
            vc.titleText = "Public Charity"
            vc.imgView = "PublicCharity"
            vc.sadaquId = "\(publicSadaqatID!)"
            vc.descriptionString = "On the authority of Abu Hurairah, may God be pleased with him, that the Messenger of God, may God bless him and grant him peace He said (What charity lacks in money). narrated by Muslim"
            present(vc, animated: true,completion: nil)
        }
        if indexPath.row == 18{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
            vc.modalTransitionStyle = .coverVertical
            vc.titleText = HomeforThemLbl
            vc.id = HomeforID
            self.present(vc, animated: true)
        }
        if indexPath.row == 19{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
            vc.modalTransitionStyle = .coverVertical
            vc.titleText = schoolBagProject
            vc.id = schoolBagProjectID
            self.present(vc, animated: true)
        }
        if indexPath.row == 20{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
            vc.modalTransitionStyle = .coverVertical
            vc.titleText = destressRelieflbl
            vc.id = destressId
            self.present(vc, animated: true)
        }
        if indexPath.row == 21{
            let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
            vc.modalTransitionStyle = .coverVertical
            vc.titleText = "Housing Project"
            vc.imgView = "housingProjects"
            vc.sadaquId = "\(HousingProjectId!)"
            vc.descriptionString = "nothing compares to a safe haven for a happy family with the aim of improving the standard of living for families and achieving social stability the team seeks in partnership with various agencies and individuals to build housing projects for homeless families with limited income and to provide the basic requirements for safe and comfortable housing by building and maintaining housing units for low income citizens in which basic facilities and services are available taking into account the number of family members"
            present(vc, animated: true,completion: nil)
        }
        
        
    }
    
    
}
