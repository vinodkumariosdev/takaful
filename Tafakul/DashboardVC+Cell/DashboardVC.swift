//
//  DashboardVC.swift
//  Tafakul
//
//  Created by apple on 16/12/22.
//

import UIKit
import Gemini
import Alamofire
import Kingfisher

class DashboardVC: UIViewController {

    @IBOutlet weak var topCv: UICollectionView!
    
    @IBOutlet weak var charityMoreLbl: UILabel!
    
    @IBOutlet weak var langBtn: UIButton!
    
    @IBOutlet weak var SponsershipsCV: UICollectionView!
    
    @IBOutlet weak var sliderCV: GeminiCollectionView!
    
    @IBOutlet weak var charityPaysCV: UICollectionView!
    
    @IBOutlet weak var searchBarAction: UIButton!
    
    @IBOutlet weak var contributeProject:UICollectionView!
    
    @IBOutlet weak var initiative: UICollectionView!
    
    var percentageArray = [Int]()
    
    var sliderData = [[String:Any]]()
    
    var titleArray = [String]()
    var imgArray = [String]()
    var totalAmountArray = [String]()
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
    var ClothingAPoor:String!
    var clothingAPoorId:Int!
    var foodBasket:String!
    var foodBasketID:Int!
    var Publicsadaqat:String!
    var publicSadaqatId:Int!
    var expirationAuth:String!
    var expirationAuthId:Int!
    var Aqiqah:String!
    var AqiqahId:Int!
    var Sacrificelbl:String!
    var SacrificeId:Int!
    var vowId:Int!
    var vowlbl:String!
    var FastingId:Int!
    var Fastingransomlbl:String!
    
    var TopCVitems = ["Give Gift","Distress Relief","Next door neighbor","Friday Charity","Daily Sadaqa"]
    
    var TopCvArabicItems = ["الهدية","فك كربة","الجار المجاور","صدقة الجمعة","الصدقة اليومية"]
    
    @IBOutlet weak var charityPayLbl: UILabel!
    
    @IBOutlet weak var logoutBtn: UIButton!
    
    @IBOutlet weak var intitativeLbl: UILabel!
    
    @IBOutlet weak var contributeLbl: UILabel!
    
    @IBOutlet weak var sponsorshipLbl: UILabel!
    
    var CharityPaysArray = ["Clothing a poor","Food Basket","Public sadaqat","Expiration for a broken Oath"]
    
    var CharityPaysArabicArray = ["كسوة مسكين","السلة الغذائية","صدقات عامة","كفارة يمين"]
    
    var charityPaysImages = ["clothing","food","public","expiation"]
    
    
    var sponsershipsArray = ["Special needs","Family in needFamily in need","Orphan","Student"]
    var sponsershipImageArray = ["need","family","hand","student"]
    
    var ContributeProjectArray = [" Economic empowerment","House maintenance","Housing Project","Condition & elecronics"]
    
    var ContributeProjectImagesArray = ["economic","maintainence","house","electronics"]
    
    var InitiativeProjectArray = [" Family Consulting support","Awareness & Social Programmes","A gift","Help in married"]
    var InitiativeProjectImagesArray = ["people","share","gift_s","ring"]

    
    
    
    var menuImage: [UIImage?] = [
        UIImage(named: "gift"),
        UIImage(named: "detress"),
        UIImage(named: "neighbor"),
        UIImage(named: "friday_charity"),
        UIImage(named: "sadqa")
      ]
    
    var menuModifyImage: [UIImage?] = [
        
        UIImage(named: "sadqa"),
        UIImage(named: "friday_charity"),

        UIImage(named: "neighbor"),

        UIImage(named: "detress"),

        UIImage(named: "gift")
      ]
   
    
    override func viewDidLoad()
    {
        super.viewDidLoad()


        searchBarAction.addTarget(self, action: #selector(searchController), for: .touchUpInside)
        configureAnimation()
        self.langBtn.addTarget(self, action: #selector(languBtnAction), for: .touchUpInside)
    }
    
    @objc func languBtnAction(){
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
    
    @objc func searchController(){
       /* let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        vc.modalTransitionStyle = .coverVertical
        self.present(vc, animated: true)*/
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchCharityViewController") as! SearchCharityViewController
        vc.modalTransitionStyle = .coverVertical
        self.definesPresentationContext = true
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(LocalizationSystem.sharedInstance.getLanguage())
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            let ar = UIImage(named: "ar")
            self.charityPayLbl.text = "الصدقة تدفع البلاء"
            self.intitativeLbl.text = "المبادرات"
            self.charityMoreLbl.text = "المزيد"
            self.contributeLbl.text = "مشاريع خيرية وصدقات جارية"
            self.sponsorshipLbl.text = "الكفالات"
            langBtn.setImage(ar, for: .normal)
            let en = UIImage(named: "en")
            langBtn.setImage(en, for: .normal)
            
            self.getArabicCauses()
            self.getArabicSlider()
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            let ar = UIImage(named: "en")
            self.charityPayLbl.text = "Charity Pay"
            self.intitativeLbl.text = "Initiative"
            self.contributeLbl.text = "Contribute To A Project"
            self.charityMoreLbl.text = "More"
            self.sponsorshipLbl.text = "Sponsorships"
            langBtn.setImage(ar, for: .normal)
            let en = UIImage(named: "ar")
            langBtn.setImage(en, for: .normal)
            self.getCauses()
            self.getSlider()
        }
        charityMoreLbl.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
        charityMoreLbl.addGestureRecognizer(tapGesture)
    }
    
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CharityPayMoreViewController") as! CharityPayMoreViewController
        self.definesPresentationContext = true
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
    }

    
    func getArabicSlider(){
        //self.loadinHubShow()
        if Reachability.isConnectedToNetwork(){
            let parameters = [
                "api_token": "WNi3oumvqu8ADhvWLqhPN18FhGplwwYgVYuWaHfrFInZcgI2J7o0obuWIIO5"]
            print(parameters)
                let url = "\(Constants.Common.finalURL)slider"
            print(url)
            AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).responseJSON {
                        response in
                        switch (response.result) {
                        case .success(let json):
                            let response = json as! [String:AnyObject]
                            print(response)
                            DispatchQueue.main.async {
                                //self.loadinHubDismiss()
                                self.imgArray.removeAll()
                                self.titleArray.removeAll()
                                self.RaisedArray.removeAll()
                                self.totalAmountArray.removeAll()
                                self.percentageArray.removeAll()
                                self.idArray.removeAll()
                                let data = response["data"] as! Array<Any>
                                for i in 0..<data.count{
                                    let x = data[i] as! [String:AnyObject]
                                    let image = x["image"] as? String ?? ""
                                    self.imgArray.append(image)
                                    let other_details = x["other_details"] as! Array<Any>
                                    for i in 0..<other_details.count{
                                        let dict = other_details[i] as! [String:AnyObject]
                                        let title = dict["ar_title"] as? String ?? ""
                                        let amount = dict["amount"] as? String ?? ""
                                        var raised = dict["raised"] as? String ?? ""
                                        let id = dict["id"] as? Int ?? 0
                                        self.idArray.append(id)
                                        let value = Double(raised)! / Double(amount)! * 100
                                        let IntValue = Int(value)
                                        self.percentageArray.append(IntValue)
                                        self.titleArray.append(title)
                                        print(self.titleArray)
                                        self.totalAmountArray.append(amount)
                                        self.RaisedArray.append(raised)
                                        self.sliderCV.reloadData()
                                        
                                    }
                                   
                                }
//                                self.sliderCV.gemini.circleRotationAnimation()
//                                let indexPath = IndexPath(item: 0, section: 0)
//
//                                self.sliderCV.collectionViewLayout.collectionView?.scrollToItem(at: indexPath,  at: [.centeredVertically, .centeredHorizontally], animated: true)

                                
                            }
                           // self.loadinHubDismiss()
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
    
    func getSlider(){
        //self.loadinHubShow()
        if Reachability.isConnectedToNetwork(){
            let parameters = [
                "api_token": "WNi3oumvqu8ADhvWLqhPN18FhGplwwYgVYuWaHfrFInZcgI2J7o0obuWIIO5"]
            print(parameters)
                let url = "\(Constants.Common.finalURL)slider"
            print(url)
            AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).responseJSON {
                        response in
                        switch (response.result) {
                        case .success(let json):
                            let response = json as! [String:AnyObject]
                            print(response)
                            DispatchQueue.main.async {
                                //self.loadinHubDismiss()
                                self.imgArray.removeAll()
                                self.titleArray.removeAll()
                                self.RaisedArray.removeAll()
                                self.totalAmountArray.removeAll()
                                self.percentageArray.removeAll()
                                self.idArray.removeAll()
                                let data = response["data"] as! Array<Any>
                                for i in 0..<data.count{
                                    let x = data[i] as! [String:AnyObject]
                                    let image = x["image"] as? String ?? ""
                                    self.imgArray.append(image)
                                    let other_details = x["other_details"] as! Array<Any>
                                    for i in 0..<other_details.count{
                                        let dict = other_details[i] as! [String:AnyObject]
                                        let title = dict["title"] as? String ?? ""
                                        let amount = dict["amount"] as? String ?? ""
                                        var raised = dict["raised"] as? String ?? ""
                                        let id = dict["id"] as? Int ?? 0
                                        self.idArray.append(id)
                                        let value = Double(raised)! / Double(amount)! * 100
                                        let IntValue = Int(value)
                                        self.percentageArray.append(IntValue)
                                        self.titleArray.append(title)
                                        self.totalAmountArray.append(amount)
                                        self.RaisedArray.append(raised)
                                        self.sliderCV.reloadData()
                                    }
                                   
                                }
                                
                            }
                           // self.loadinHubDismiss()
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
    
    
    func getArabicCauses(){
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
                            self.titleArray.removeAll()
                            self.idArray.removeAll()
                            DispatchQueue.main.async {
                                let data = response["data"] as! Array<Any>
                                for i in 0 ..< data.count{
                                    let x = data[i] as! [String:AnyObject]
                                    let id = x["id"] as? Int ?? 0
                                    let title = x["title"] as? String ?? ""
                                    let Artitle = x["ar_title"] as? String ?? ""
                                    self.idArray.append(id)
                                    self.titleArray.append(title)
                                    print(self.titleArray)
                                    
                                    if Artitle == "صدقة الجمعة"{
                                        self.charitylbl = Artitle
                                    }
                                    if id == 89{
                                        self.charityId = id
                                    }
                                    if Artitle == "فك كربة"{
                                        self.destressRelieflbl = Artitle
                                    }
                                    if id == 64{
                                        self.destressId = id
                                    }
                                    if Artitle == "إرسال هدية" {
                                        self.giftlbl = Artitle
                                    }
                                    if id == 81{
                                        self.giftID = id
                                    }
                                    if Artitle == "الصدقة اليومية"{
                                        self.dailySadaqu = Artitle
                                    }
                                    if id == 93{
                                        self.dailysadaquID = id
                                    }
                                    if Artitle == "الجار الجنب"{
                                        self.nextDoorNeighbor = Artitle
                                    }
                                    if id == 94{
                                        self.nextDoorNeighborID = id
                                    }
                                    if Artitle == "أسرة معسرة"{
                                        self.familyInNeedlbl = Artitle
                                    }
                                    if id == 74{
                                        self.familyInNeedId = id
                                    }
                                    if Artitle == "البرامج التوعوية والاجتماعية"{
                                        self.awarenessSocialLbl = Artitle
                                    }
                                    if id == 91{
                                        self.awarenessSocialID = id
                                    }
                                    if Artitle == "تزويج شاب معسر"{
                                        self.helpInLbl = Artitle
                                    }
                                    if id == 82{
                                        self.helpInId = id
                                    }
                                    if Artitle == "مشاريع مدرة للدخل"{
                                        self.EconmimcEmpowermentLbl = Artitle
                                    }
                                    if id == 79{
                                        self.EconmimcEmpowermentId = id
                                    }
                                    if Artitle == "صيانة منازل"{
                                        self.houseMaintenanceLbl = Artitle
                                    }
                                    if id == 78{
                                        self.houseMaintenanceId = id
                                    }
                                    if Artitle == "منزل يؤويهم"{
                                        self.HousingProject = Artitle
                                    }
                                    if id == 77{
                                        self.HousingProjectId = id
                                    }
                                    if Artitle == "مكيفات وإلكترونيات"{
                                        self.conditionsElectroincs = Artitle
                                    }
                                    if id == 80{
                                        self.conditionsElectroincsID = id
                                    }
                                    if Artitle == "دعم ذوي الإحتياجات الخاصة"{
                                        self.specialNeedslbl = Artitle
                                    }
                                    if id == 75{
                                        self.specialNeedsId = id
                                    }
                                    if Artitle == "كفالة يتيم" {
                                        self.orphanLbl = Artitle
                                    }
                                    if id == 73{
                                        self.orphanID = id
                                    }
                                    if Artitle == "طالب علم"{
                                        self.StudentsLbl = Artitle
                                    }
                                    if id == 76{
                                        self.studentsID = id
                                    }
                                    if Artitle == "كسوة مسكين"{
                                        self.ClothingAPoor = Artitle
                                    }
                                    if id == 71{
                                        self.clothingAPoorId = id
                                    }
                                    if Artitle == "السلة الغذائية"{
                                        self.foodBasket = Artitle
                                    }
                                    if id == 70{
                                        self.foodBasketID = id
                                    }
                                    if Artitle == "صدقات عامة"{
                                        self.Publicsadaqat = Artitle
                                    }
                                    if id == 69{
                                        self.publicSadaqatId = id
                                    }
                                    if Artitle == "كفارة يمين"{
                                        self.expirationAuth = Artitle
                                    }
                                    if id == 72{
                                        self.expirationAuthId = id
                                    }
                                    if title == "Aqiqah"{
                                        self.Aqiqah = title
                                    }
                                    if id == 87{
                                        self.AqiqahId = id
                                    }
                                    
                                    if title == "Sacrifice"{
                                        self.Sacrificelbl = title
                                    }
                                    
                                    if id == 85{
                                        self.SacrificeId = id
                                    }
                                    
                                    if title == "Vow"{
                                        self.vowlbl = title
                                    }
                                    if id == 86{
                                        self.vowId = id
                                    }
                                    if title == "Fasting Ransom"{
                                        self.Fastingransomlbl = title
                                    }
                                    if id == 83{
                                        self.FastingId = id
                                    }
                                }
                                self.topCv.reloadData()
                                self.initiative.reloadData()
                                self.contributeProject.reloadData()
                                self.SponsershipsCV.reloadData()
                                self.charityPaysCV.reloadData()
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
                            self.titleArray.removeAll()
                            self.idArray.removeAll()
                            DispatchQueue.main.async {
                                let data = response["data"] as! Array<Any>
                                for i in 0 ..< data.count{
                                    let x = data[i] as! [String:AnyObject]
                                    let id = x["id"] as? Int ?? 0
                                    let title = x["title"] as? String ?? ""
                                    self.idArray.append(id)
                                    self.titleArray.append(title)
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
                                    if title == "Send A Gift"{
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
                                        self.ClothingAPoor = title
                                    }
                                    if id == 71{
                                        self.clothingAPoorId = id
                                    }
                                    if title == "Food Basket"{
                                        self.foodBasket = title
                                    }
                                    if id == 70{
                                        self.foodBasketID = id
                                    }
                                    if title == "Public sadaqat"{
                                        self.Publicsadaqat = title
                                    }
                                    if id == 69{
                                        self.publicSadaqatId = id
                                    }
                                    if title == "Expiration  for  A broken Oath"{
                                        self.expirationAuth = title
                                    }
                                    if id == 72{
                                        self.expirationAuthId = id
                                    }
                                    if title == "Aqiqah"{
                                        self.Aqiqah = title
                                    }
                                    if id == 87{
                                        self.AqiqahId = id
                                    }
                                    
                                    if title == "Sacrifice"{
                                        self.Sacrificelbl = title
                                    }
                                    
                                    if id == 85{
                                        self.SacrificeId = id
                                    }
                                    
                                    if title == "Vow"{
                                        self.vowlbl = title
                                    }
                                    if id == 86{
                                        self.vowId = id
                                    }
                                    if title == "Fasting Ransom"{
                                        self.Fastingransomlbl = title
                                    }
                                    if id == 83{
                                        self.FastingId = id
                                    }
                                }
                                self.topCv.reloadData()
                                self.initiative.reloadData()
                                self.contributeProject.reloadData()
                                self.SponsershipsCV.reloadData()
                                self.charityPaysCV.reloadData()
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
    
    
    
    @objc func logoutAction(){
        let alert = UIAlertController(title: "", message: "Are You Sure You Want To Logout", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: { action in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            UserDefaults.standard.removeObject(forKey: "id")
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func configureAnimation()
    {
             sliderCV.gemini
            .scaleAnimation()
            .scale(0.60)
            .scaleEffect(.scaleUp)
    }
    

    

}
extension DashboardVC:UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            if collectionView == topCv
            {
                return 5
            }
            else if collectionView == sliderCV
            {
                return totalAmountArray.count
            }
            else if collectionView == charityPaysCV
            {
                return CharityPaysArabicArray.count
            }
            else if collectionView == SponsershipsCV
            {
                return 4
            }
            else if collectionView == contributeProject
            {
                return 4
            }
            else if collectionView == initiative {
                return 4
            }
            else
            {
                return 15
            }
            
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            if collectionView == topCv
            {
                return 5
            }
            else if collectionView == sliderCV
            {
                return totalAmountArray.count
            }
            else if collectionView == charityPaysCV
            {
                return CharityPaysArray.count
            }
            else if collectionView == SponsershipsCV
            {
                return 4
            }
            else if collectionView == contributeProject
            {
                return 4
            }
            else if collectionView == initiative {
                return 4
            }
            else
            {
                return 15
            }
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
//            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            self.view.semanticContentAttribute = .forceRightToLeft

            if(collectionView == self.topCv)
            {
                let cell = topCv.dequeueReusableCell(withReuseIdentifier: "DashboardTopCVCell", for: indexPath) as? DashboardTopCVCell
                
                if indexPath.row == 3 {
                    cell?.dashboardLbl.text = charitylbl ?? ""
                }
                
                if indexPath.row == 4{
                    cell?.dashboardLbl.text = dailySadaqu ?? ""
                }
                
                if indexPath.row == 2{
                    cell?.dashboardLbl.text = nextDoorNeighbor ?? ""
                }
                
                if indexPath.row == 1{
                    cell?.dashboardLbl.text = destressRelieflbl ?? ""
                   
                }
                
                if indexPath.row == 0{
                    cell?.dashboardLbl.text = "\(giftlbl ?? "")"
                    
                }
                
                if cell?.dashboardLbl.text?.split(separator: " ").count ?? 1 > 1 {
                    var items = cell?.dashboardLbl.text?.split(separator: " ")
                    cell?.dashboardLbl.text = "\(items![0]) \n \(items![1])"
//                    cell?.dashboardLbl.font = UIFont(name: "", size: 14)

                }
                
                cell?.DashboardimageView.image = menuImage[indexPath.item]
                return cell!
            }
            
            else if (collectionView == self.sliderCV)
            {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DashboardSliderCVCell", for: indexPath) as! DashboardSliderCVCell
                cell.ProjectNameLbl.text = titleArray[indexPath.row]
                cell.tragetLbl.text = "المتبقي"
                cell.omrLbl.text = "\(RaisedArray[indexPath.row]) OMR"
                let url = URL(string: imgArray[indexPath.row])
                cell.DashimageView.kf.setImage(with: url)
                cell.progressBar.progress = Float(percentageArray[indexPath.row] / 100)
//                self.sliderCV.animateCell(cell)
                if(percentageArray[indexPath.row] > 100) {
                    cell.percentageLbl.text = "100%"
                }else {
                    cell.percentageLbl.text = "\(percentageArray[indexPath.row])%"
                }
//                cell.percentageLbl.text = "\(percentageArray[indexPath.row])%"
                cell.percentageLbl.textColor = UIColor.blue
                cell.shareBtn.addTarget(self, action: #selector(shareButton(_sender:)), for: .touchUpInside)
                cell.shareBtn.tag = indexPath.row
                cell.donateBtn.setTitle("تبرع الان", for: .normal)
                cell.donateBtn.addTarget(self, action: #selector(DonateBtn(_sender:)), for: .touchUpInside)
                cell.donateBtn.tag = indexPath.row
                
                return cell
            }
            
           else if (collectionView == self.charityPaysCV)
            {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharityPaysCVCell", for: indexPath) as! CharityPaysCVCell
               cell.charityLbl.text = CharityPaysArabicArray[indexPath.row]
               cell.charityImage.image = UIImage(named: charityPaysImages[indexPath.row])
            return cell
           }
            
            else if (collectionView == self.SponsershipsCV)
            {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SponsershipsCVCell", for: indexPath) as! SponsershipsCVCell
                if indexPath.row == 0{
                    cell.sponsershipLbl.text = specialNeedslbl ?? ""
                }
                if indexPath.row == 1{
                    cell.sponsershipLbl.text = familyInNeedlbl ?? ""
                }
                if indexPath.row == 2{
                    cell.sponsershipLbl.text = orphanLbl ?? ""
                }
                if indexPath.row == 3{
                    cell.sponsershipLbl.text = StudentsLbl ?? ""
                }
                cell.sponsershipImage.image = UIImage(named: sponsershipImageArray[indexPath.row])
                return cell
            }
            else if (collectionView == self.contributeProject)
            {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContributeProjectCVCell", for: indexPath) as! ContributeProjectCVCell
                if indexPath.row == 0{
                    cell.contributeLbl.text = EconmimcEmpowermentLbl ?? ""
                }
                
                if indexPath.row == 1{
                    cell.contributeLbl.text = houseMaintenanceLbl ?? ""
                }
                
                if indexPath.row == 2{
                    cell.contributeLbl.text = HousingProject ?? ""
                }
                
                if indexPath.row == 3{
                    cell.contributeLbl.text = conditionsElectroincs ?? ""
                   
                }
                
                /*if indexPath.row == 4{
                    cell.contributeLbl.text = "Other Projects"
                }*/
                
                if ContributeProjectImagesArray.count > 0 && indexPath.row < ContributeProjectImagesArray.count {

                    cell.contributeImage.image = UIImage(named: ContributeProjectImagesArray[indexPath.row])

                }
                
                return cell
            }
            else if (collectionView == self.initiative)
            {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InitiativeCVCell", for: indexPath) as! InitiativeCVCell
                if indexPath.row == 0{
                    cell.initiativeLbl.text = familyInNeedlbl ?? ""
                }
                
                if indexPath.row == 1{
                    cell.initiativeLbl.text = awarenessSocialLbl ?? ""
                }
                
                if indexPath.row == 2{
                    cell.initiativeLbl.text = "A \(giftlbl ?? "")"
                }
                
                if indexPath.row == 3{
                    cell.initiativeLbl.text = helpInLbl ?? ""
                }
                
                cell.initiativeImage.image = UIImage(named: InitiativeProjectImagesArray[indexPath.row])
                return cell
            }

            else
            {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DashboardSliderCVCell", for: indexPath) as! DashboardSliderCVCell
//                self.sliderCV.animateCell(cell)
                return cell
            }
            
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            if(collectionView == self.topCv)
            {
                let cell = topCv.dequeueReusableCell(withReuseIdentifier: "DashboardTopCVCell", for: indexPath) as? DashboardTopCVCell
                
                if indexPath.row == 4{
                    cell?.dashboardLbl.text = dailySadaqu ?? ""
                }
                
                if indexPath.row == 1{
                    cell?.dashboardLbl.text = charitylbl ?? ""
                }
                
                
                if indexPath.row == 2{
                    cell?.dashboardLbl.text = nextDoorNeighbor ?? ""
                }
                
                if indexPath.row == 3{
                    cell?.dashboardLbl.text = destressRelieflbl ?? ""
                   
                }
                
                if indexPath.row == 4{
                    cell?.dashboardLbl.text = "Give \(giftlbl ?? "")"
                    
                }
                
                cell?.DashboardimageView.image = menuModifyImage[indexPath.item]
                return cell!
            }
            
            else if (collectionView == self.sliderCV)
            {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DashboardSliderCVCell", for: indexPath) as! DashboardSliderCVCell
                cell.tragetLbl.text = "Target"
                cell.ProjectNameLbl.text = titleArray[indexPath.row]
                cell.omrLbl.text = "\(RaisedArray[indexPath.row]) OMR"
                let url = URL(string: imgArray[indexPath.row])
                cell.DashimageView.kf.setImage(with: url)
//                self.sliderCV.animateCell(cell)
                cell.percentageLbl.text = "\(percentageArray[indexPath.row])%"
                cell.percentageLbl.textColor = UIColor.blue
                cell.shareBtn.addTarget(self, action: #selector(shareButton(_sender:)), for: .touchUpInside)
                cell.shareBtn.tag = indexPath.row
//                self.sliderCV.animateCell(cell)
                if(percentageArray[indexPath.row] > 100) {
                    cell.percentageLbl.text = "100%"
                }else {
                    cell.percentageLbl.text = "\(percentageArray[indexPath.row])%"
                }
                cell.donateBtn.setTitle("Donate", for: .normal)
                cell.donateBtn.addTarget(self, action: #selector(DonateBtn(_sender:)), for: .touchUpInside)
                cell.donateBtn.tag = indexPath.row
                return cell
            }
            
           else if (collectionView == self.charityPaysCV)
            {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharityPaysCVCell", for: indexPath) as! CharityPaysCVCell
               cell.charityLbl.text = CharityPaysArray[indexPath.row]
               cell.charityImage.image = UIImage(named: charityPaysImages[indexPath.row])
            return cell
           }
            
            else if (collectionView == self.SponsershipsCV)
            {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SponsershipsCVCell", for: indexPath) as! SponsershipsCVCell
                if indexPath.row == 0{
                    cell.sponsershipLbl.text = specialNeedslbl ?? ""
                }
                if indexPath.row == 1{
                    cell.sponsershipLbl.text = familyInNeedlbl ?? ""
                }
                if indexPath.row == 2{
                    cell.sponsershipLbl.text = orphanLbl ?? ""
                }
                if indexPath.row == 3{
                    cell.sponsershipLbl.text = StudentsLbl ?? ""
                }
                cell.sponsershipImage.image = UIImage(named: sponsershipImageArray[indexPath.row])
                return cell
            }
            else if (collectionView == self.contributeProject)
            {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContributeProjectCVCell", for: indexPath) as! ContributeProjectCVCell
                if indexPath.row == 0{
                    cell.contributeLbl.text = EconmimcEmpowermentLbl ?? ""
                }
                
                if indexPath.row == 1{
                    cell.contributeLbl.text = houseMaintenanceLbl ?? ""
                }
                
                if indexPath.row == 2{
                    cell.contributeLbl.text = HousingProject ?? ""
                }
                
                if indexPath.row == 3{
                    cell.contributeLbl.text = conditionsElectroincs ?? ""
                   
                }
                
                /*if indexPath.row == 4{
                    cell.contributeLbl.text = "Other Projects"
                }*/
                
                if ContributeProjectImagesArray.count > 0 && indexPath.row < ContributeProjectImagesArray.count {

                    cell.contributeImage.image = UIImage(named: ContributeProjectImagesArray[indexPath.row])

                }
                
                return cell
            }
            else if (collectionView == self.initiative)
            {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InitiativeCVCell", for: indexPath) as! InitiativeCVCell
                if indexPath.row == 0{
                    cell.initiativeLbl.text =  "Family Consultant Support"
                }
                
                if indexPath.row == 1{
                    cell.initiativeLbl.text = awarenessSocialLbl ?? ""
                }
                
                if indexPath.row == 2{
                    cell.initiativeLbl.text = "A \(giftlbl ?? "")"
                }
                
                if indexPath.row == 3{
                    cell.initiativeLbl.text = helpInLbl ?? ""
                }
                
                cell.initiativeImage.image = UIImage(named: InitiativeProjectImagesArray[indexPath.row])
                return cell
            }

            else
            {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DashboardSliderCVCell", for: indexPath) as! DashboardSliderCVCell
//                self.sliderCV.animateCell(cell)
                return cell
            }
        }
        
       
        
        
    }
    
    @objc func shareButton(_sender:UIButton){
        let index = _sender.tag
        let title = titleArray[index]
        let amount = "\(totalAmountArray[index])OMR"
        let link = "https://takafulsuhar.om/projects"
        let textShare = [title,amount,link ]
        let activityViewController = UIActivityViewController(activityItems: textShare , applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    @objc func DonateBtn(_sender:UIButton){
        let index = _sender.tag
        let title = titleArray[index]
        let id = idArray[index]
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
        vc.modalTransitionStyle = .coverVertical
        vc.titleText = title
        vc.id = idArray[index]
        self.present(vc, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        sliderCV.animateVisibleCells()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
    {
        if let cell = cell as? DashboardSliderCVCell
        {
//            self.sliderCV.animateCell(cell)
        }
    }

    
}

extension DashboardVC: UICollectionViewDelegateFlowLayout {
    
    // Distance Between Item Cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
        {
           
        if(collectionView == self.topCv)
        {
            return 5
        }

        else if(collectionView == self.sliderCV)
        {
            return 5
        }

        else if (collectionView == self.charityPaysCV)
        {
            return 10
        }
        else if (collectionView == self.SponsershipsCV)
        {
            return 5
        }
        else if (collectionView == self.contributeProject)
        {
            return 5
        }
        else if (collectionView == self.initiative)
        {
                return 5
        }
        else
        {
            return 5
        }
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        
        if collectionView == topCv
        {
            let noOfCellsInRow = 5

            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

            let totalSpace = flowLayout.sectionInset.left
                + flowLayout.sectionInset.right
                + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

            let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))

            return CGSize(width: size, height: size)
        }
        
        else if collectionView == charityPaysCV
        {
            
            let noOfCellsInRow = 2

            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

            let totalSpace = flowLayout.sectionInset.left
                + flowLayout.sectionInset.right
                + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

            let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
            let cellHeightSize = 50

            return CGSize(width: size, height: cellHeightSize)
        }
        
        else if collectionView == SponsershipsCV
        {
//          return CGSize(width: 120, height: 50)
            
            let noOfCellsInRow = 2

            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

            let totalSpace = flowLayout.sectionInset.left
                + flowLayout.sectionInset.right
                + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

            let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
            let cellHeightSize = 50

            return CGSize(width: size, height: cellHeightSize)
        }
        
        else if collectionView == contributeProject
        {
            let noOfCellsInRow = 2

            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

            let totalSpace = flowLayout.sectionInset.left
                + flowLayout.sectionInset.right
                + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

            let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
            let cellHeightSize = 50

            return CGSize(width: size, height: cellHeightSize)
            
        }
        else if collectionView == initiative
        {
            let noOfCellsInRow = 2

            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

            let totalSpace = flowLayout.sectionInset.left
                + flowLayout.sectionInset.right
                + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

            let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
            let cellHeightSize = 50

            return CGSize(width: size, height: cellHeightSize)
            
        }
    
        else
        {
            let noOfCellsInRow = 2

            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

            let totalSpace = flowLayout.sectionInset.left
                + flowLayout.sectionInset.right
                + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

            let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))

            return CGSize(width: size, height: size)
        }
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == charityPaysCV{
            return UIEdgeInsets.zero
        }
//        else if collectionView == SponsershipsCV{
//            return UIEdgeInsets.zero
//        }
        else {
            return UIEdgeInsets.zero
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == topCv{
            if indexPath.row == 4{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = "Daily Sadaqa"
                vc.imgView = "daily_sadqa"
                vc.sadaquId = "\(dailysadaquID!)"
                vc.descriptionString = "On the authority of Abu Hurairah, may God be pleased with him, that the Messenger of God, may God bless him and grant him peace He said (What charity lacks in money). narrated by Muslim"
                present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 3{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = "Friday Charity"
                vc.imgView = "FridayCharity"
                vc.sadaquId = "\(charityId!)"
                vc.descriptionString = "On the authority of Uqbah Aamer, may God be pleased with him, that the Messenger of God, may God bless him and grant him peace He said (A man is in the shade of his charity until it is decided betweeen the people). narrated by Ahmed"
                present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 2{
//                let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardNextDoorViewController") as! DashboardNextDoorViewController
//                print(foodBasketID!)
////                vc.nextDoorId = 94
////                vc.nextDoor = "fromDashboardNextDoor"
//                self.definesPresentationContext = true
//                vc.modalPresentationStyle = .overCurrentContext
//                self.present(vc, animated: true, completion: nil)
//
//
                let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = "Neighbours in Village"
                vc.imgView = "neighbours"
                vc.sadaquId = "\(nextDoorNeighborID!)"
                vc.descriptionString = "On the authority of Abdulla bin Omar, may God be pleased with him, that the Messenger of God, may God's prayers and peace be upon him, said Gabriel still advised me about the neighbour, until I thought that he would inherit it. Narrated by Al-Bukhari"
                present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 1{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = "Detress Relief"
                vc.imgView = "DetressRelief"
                vc.sadaquId = "\(destressId!)"
                vc.descriptionString = "On the authority of Uqbah Aamer, may God be pleased with him, that the Messenger of God, may God bless him and grant him peace He said (A man is in the shade of his charity until it is decided betweeen the people). narrated by Ahmed"
                present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 0{
                let vc = storyboard?.instantiateViewController(withIdentifier: "GiftVC") as! GiftVC
                vc.modalTransitionStyle = .coverVertical
                self.definesPresentationContext = true
                vc.modalPresentationStyle = .overCurrentContext
                self.present(vc, animated: true, completion: nil)
            }

        }
        
       
        else if collectionView == initiative{
            if indexPath.row == 0
            {
                let vc = storyboard?.instantiateViewController(withIdentifier: "InitiativeVC") as! InitiativeVC
               vc.modalTransitionStyle = .coverVertical
                vc.titleText = familyInNeedlbl
                vc.id = familyInNeedId
               present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 1
            {
                let vc = storyboard?.instantiateViewController(withIdentifier: "InitiativeVC") as! InitiativeVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = awarenessSocialLbl
                vc.id = awarenessSocialID
                present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 2
            {
                let vc = storyboard?.instantiateViewController(withIdentifier: "GiftVC") as! GiftVC
                vc.modalTransitionStyle = .coverVertical
                self.definesPresentationContext = true
                vc.modalPresentationStyle = .overCurrentContext
                self.present(vc, animated: true, completion: nil)
            }
            if indexPath.row == 3
            {
                let vc = storyboard?.instantiateViewController(withIdentifier: "InitiativeVC") as! InitiativeVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = helpInLbl
                vc.id = helpInId
                present(vc, animated: true,completion: nil)
            }
            
            
        }
        
        else if collectionView == contributeProject{
            
            
            if indexPath.row == 0
            {
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
               vc.modalTransitionStyle = .coverVertical
                vc.titleText = EconmimcEmpowermentLbl
                vc.id = EconmimcEmpowermentId
               present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 1
            {
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = houseMaintenanceLbl
                vc.id = houseMaintenanceId
                present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 2
            {
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = HousingProject
                vc.id = HousingProjectId
                present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 3
            {
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = conditionsElectroincs
                vc.id = conditionsElectroincsID
                present(vc, animated: true,completion: nil)
            }
            
            
        }
        if collectionView == SponsershipsCV
        {
            
            if indexPath.row == 0
            {
                let vc = storyboard?.instantiateViewController(withIdentifier: "SponserShipVC") as! SponserShipVC
               vc.modalTransitionStyle = .coverVertical
                vc.titleText = specialNeedslbl
                vc.id = specialNeedsId
               present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 1
            {
                let vc = storyboard?.instantiateViewController(withIdentifier: "SponserShipVC") as! SponserShipVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = familyInNeedlbl
                vc.id = familyInNeedId
                present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 2
            {
                let vc = storyboard?.instantiateViewController(withIdentifier: "SponserShipVC") as! SponserShipVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = orphanLbl
                vc.id = orphanID
                present(vc, animated: true,completion: nil)
            }
            
            if indexPath.row == 3
            {
                let vc = storyboard?.instantiateViewController(withIdentifier: "SponserShipVC") as! SponserShipVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = StudentsLbl
                vc.id = studentsID
                present(vc, animated: true,completion: nil)
            }
            
        }
        
        if collectionView == self.charityPaysCV{
            if indexPath.row == 0{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
               vc.modalTransitionStyle = .coverVertical
                vc.titleText = ClothingAPoor
                vc.id = clothingAPoorId
               present(vc, animated: true,completion: nil)
            }
            
            if indexPath.row == 1{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
                print(foodBasketID!)
                vc.BasketId = foodBasketID
                vc.foodbasket = "fromDashboard"
                self.definesPresentationContext = true
                vc.modalPresentationStyle = .overCurrentContext
                self.present(vc, animated: true, completion: nil)
            }
            
            if indexPath.row == 2{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = "Public Charity"
                vc.imgView = "PublicCharity"
                vc.sadaquId = "\(publicSadaqatId!)"
                vc.descriptionString = "On the authority of Abu Hurairah, may God be pleased with him, that the Messenger of God, may God bless him and grant him peace He said (What charity lacks in money). narrated by Muslim"
                present(vc, animated: true,completion: nil)
            }
            
            if indexPath.row == 5{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = orphanLbl
                vc.id = orphanID
                present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 3{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
                vc.expirationId = expirationAuthId
                vc.isExpirationAuth = "expirationFromDashboard"
                self.definesPresentationContext = true
                vc.modalPresentationStyle = .overCurrentContext
                self.present(vc, animated: true, completion: nil)
            }
            if indexPath.row == 12{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
                vc.expirationId = AqiqahId
                vc.isAquiuah = "Aqiuah"
               vc.modalTransitionStyle = .coverVertical
               present(vc, animated: true,completion: nil)
            }
            
            if indexPath.row == 11{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = StudentsLbl
                vc.id = studentsID
                present(vc, animated: true,completion: nil)
            }
            
            if indexPath.row == 10{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = specialNeedslbl
                vc.id = specialNeedsId
                present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 9{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
                vc.modalTransitionStyle = .coverVertical
                vc.isSacrifice = "Sacrifice"
                vc.sacrificeId = SacrificeId
                present(vc, animated: true,completion: nil)
            }
            
            if indexPath.row == 8{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
                vc.modalTransitionStyle = .coverVertical
                vc.isVow = "Vow"
                vc.sacrificeId = vowId
                present(vc, animated: true,completion: nil)
            }
            
            if indexPath.row == 7{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = "Friday Charity"
                vc.imgView = "FridayCharity"
                vc.descriptionString = "On the authority of Uqbah Aamer, may God be pleased with him, that the Messenger of God, may God bless him and grant him peace He said (A man is in the shade of his charity until it is decided betweeen the people). narrated by Ahmed"
                vc.sadaquId = "\(charityId!)"
                present(vc, animated: true,completion: nil)
            }
            
            if indexPath.row == 6{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
                vc.modalTransitionStyle = .coverVertical
                vc.isFastingRansom = "IsFastingRansom"
                vc.sacrificeId = FastingId
                present(vc, animated: true,completion: nil)
            }
            
            if indexPath.row == 4{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
                vc.modalTransitionStyle = .coverVertical
                vc.isSacrificeMore = "isSacrificeMore"
                vc.sacrificeId = SacrificeId
                present(vc, animated: true,completion: nil)
            }
        }
    }


   
    
}
