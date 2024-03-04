//
//  SearchCharityViewController.swift
//  Tafakul
//
//  Created by apple on 26/05/23.
//

import UIKit
import Alamofire

class SearchCharityViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    
    @IBOutlet weak var searchLbl: UILabel!
    
    @IBOutlet weak var searchTblVieww: UITableView!{
        didSet{
            searchTblVieww.delegate = self
            searchTblVieww.dataSource = self
        }
    }
    
    @IBOutlet weak var searchTF: UITextField!{
        didSet{
            self.searchTF.layer.cornerRadius = 15.0
            self.searchTF.layer.masksToBounds = true
            self.searchTF.layer.borderColor = UIColor.lightGray.cgColor
            self.searchTF.layer.borderWidth = 1.0
        }
    }
    
    var items = [Item]()
    var filteredItems = [Item]()
    
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
    var Housingprojectslbl:String!
    var HousingprojectId:Int!
    var distresslbl:String!
    var distressId:Int!
    var SchoolBagProjectlbl:String!
    var schoolBagId:Int!
    var HomeforThemlbl:String!
    var HomeforThemId:Int!
    var expirationAuthlbl:String!
    var idArray = [Int]()
    var nameArray = [String]()
    var arnameArry = [String]()
    let padding: CGFloat = 40.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            searchLbl.text = "يبحث"
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            searchTF.delegate = self
            items = [
                Item(name: "الصدقة اليومية", image: UIImage(named: "sadqa")!),
//                Item(name: "الجار الجنب", image: UIImage(named: "neighbor")!),
                Item(name: "فك كربة", image: UIImage(named: "detress")!),
                Item(name: "سهم وقف", image: UIImage(named: "house")!),
                Item(name: "صدقة عامة", image: UIImage(named: "food")!),
                Item(name: "كفالة يتيم لمدة سنة", image: UIImage(named: "clothing")!),
                Item(name: "كفالة أسرة معسرة", image: UIImage(named: "gift_4")!),
                Item(name: "صدقة\n الجمعة", image: UIImage(named: "friday_charity")!),
                Item(name: "العقيقة", image: UIImage(named: "aqiqah")!),
                Item(name: "نذر", image: UIImage(named: "vow")!),
                Item(name: "ذبيحة", image: UIImage(named: "sacrifice")!),
                Item(name: "صدقة ليتيم", image: UIImage(named: "head")!),
                Item(name: "فدية صيام", image: UIImage(named: "masque")!),
                Item(name: "هدية", image: UIImage(named: "gift_s")!),
                Item(name: "الشروط والالكترونيات", image: UIImage(named: "electronics")!),
                Item(name: "التمكين الاقتصادي", image: UIImage(named: "economic")!),
                Item(name: "صيانة المنزل", image: UIImage(named: "house")!),
                Item(name: "مشروع اسكان", image: UIImage(named: "house")!),
                Item(name: "طالب علم", image: UIImage(named: "student")!),
                Item(name: "دعم ذوي الاحتياجات الخاصة", image: UIImage(named: "need")!),
                Item(name: "كسوة اسرة معسرة", image: UIImage(named: "need")!),
                Item(name: "كفالة يتيم", image: UIImage(named: "hand")!),
                Item(name: "كفارة يمين", image: UIImage(named: "expiation")!),
                Item(name: "ملابس رديئة", image: UIImage(named: "clothing")!),
                Item(name: "السلة الغذائية", image: UIImage(named: "food")!),
                Item(name: "صدقات عامة", image: UIImage(named: "food")!),
                Item(name: "منزل يؤويهم", image: UIImage(named: "house")!),
                Item(name: "مشروع الحقيبة المدرسية", image: UIImage(named: "student")!),
                Item(name: "فك كربة", image: UIImage(named: "detress")!),
                Item(name: "المشاريع الإسكانية", image: UIImage(named: "house")!),
            ]
            filteredItems = items
        }else{
            searchLbl.text = "Search"
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            searchTF.delegate = self
            items = [
                Item(name: "Daily Sadaqa", image: UIImage(named: "sadqa")!),
                Item(name: "Next door neighbour", image: UIImage(named: "neighbor")!),
                Item(name: "Distress Relief", image: UIImage(named: "detress")!),
                Item(name: "Stop arrow", image: UIImage(named: "house")!),
                Item(name: "Public Charity", image: UIImage(named: "food")!),
                Item(name: "Clothing a poor For one year", image: UIImage(named: "clothing")!),
                Item(name: "Clothing a Family For one year", image: UIImage(named: "gift_4")!),
                Item(name: "Friday Charity", image: UIImage(named: "friday_charity")!),
                Item(name: "Aqiqah", image: UIImage(named: "aqiqah")!),
                Item(name: "Vow", image: UIImage(named: "vow")!),
                Item(name: "Sacrifice", image: UIImage(named: "sacrifice")!),
                Item(name: "Orphan charity", image: UIImage(named: "head")!),
                Item(name: "Fasting ransom", image: UIImage(named: "masque")!),
                Item(name: "A gift", image: UIImage(named: "gift_s")!),
                Item(name: "Condition & elecctronics", image: UIImage(named: "electronics")!),
                Item(name: "Economic empowerment", image: UIImage(named: "economic")!),
                Item(name: "House maintenance", image: UIImage(named: "house")!),
                Item(name: "Housing Project", image: UIImage(named: "house")!),
                Item(name: "Student support", image: UIImage(named: "student")!),
                Item(name: "Special needs", image: UIImage(named: "need")!),
                Item(name: "Family in need", image: UIImage(named: "need")!),
                Item(name: "Orphan", image: UIImage(named: "hand")!),
                Item(name: "Expiation for a broken Oath", image: UIImage(named: "expiation")!),
                Item(name: "Clothing a poor", image: UIImage(named: "clothing")!),
                Item(name: "Food basket", image: UIImage(named: "food")!),
                Item(name: "Public sadaqat", image: UIImage(named: "food")!),
                Item(name: "Home for them", image: UIImage(named: "house")!),
                Item(name: "School bag project", image: UIImage(named: "student")!),
                Item(name: "Detress Relief", image: UIImage(named: "detress")!),
                Item(name: "Housing project", image: UIImage(named: "house")!),
            ]
            filteredItems = items
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            self.getArabicCauses()
            searchTF.delegate = self
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            self.searchTF.textAlignment = .right
            searchTF.placeholder = "البحث عن طريق الإسم"
            searchTF.setPadding(left: padding, right: padding)
        }else{
            self.getCauses()
            searchTF.delegate = self
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            self.searchTF.textAlignment = .left
            searchTF.placeholder = "Search By Name"
            searchTF.setPadding(left: padding, right: padding)
        }
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    func getCauses(){
        //self.loadinHubShow()
        if Reachability.isConnectedToNetwork(){
            let parameters = [
                "api_token": "WNi3oumvqu8ADhvWLqhPN18FhGplwwYgVYuWaHfrFInZcgI2J7o0obuWIIO5"]
            print(parameters)
            let url = "https://takafulsuhar.om/api/all-causes"
            print(url)
            AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).responseJSON {
                        response in
                        switch (response.result) {
                        case .success(let json):
                            let response = json as! [String:AnyObject]
                            print(response)
                            self.nameArray.removeAll()
                            self.idArray.removeAll()
                            self.arnameArry.removeAll()
                            DispatchQueue.main.async {
                                let data = response["data"] as! Array<Any>
                                print(data.count)
                                for i in 0 ..< data.count{
                                    let x = data[i] as! [String:AnyObject]
                                    let id = x["id"] as? Int ?? 0
                                    let title = x["title"] as? String ?? ""
                                    let Artitle = x["ar_title"] as? String ?? ""
                                    self.arnameArry.append(Artitle)
                                    self.idArray.append(id)
                                    self.nameArray.append(title)
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
                                    if title == "Housing Projects"{
                                        self.Housingprojectslbl = title
                                    }
                                    if id == 77{
                                        self.HousingprojectId = id
                                    }
                                    if title == "Destress Relief"{
                                        self.distresslbl = title
                                    }
                                    if id == 64{
                                        self.distressId = id
                                    }
                                    if title == "School Bag Project"{
                                        self.SchoolBagProjectlbl = title
                                    }
                                    if id == 90{
                                        self.schoolBagId = id
                                    }
                                    if title == "Home For Them"{
                                        self.HomeforThemlbl = title
                                    }
                                    if id == 68{
                                        self.HomeforThemId = id
                                    }
                                    if id == 70{
                                        self.foodBasketID = id
                                    }
                                    if id == 72{
                                        self.expirationAuthId = id
                                    }
                                    if title == "Expiration  for  A broken Oath"{
                                        self.expirationAuthlbl = title
                                    }
                                }
                                self.searchTblVieww.reloadData()
                                
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
    
    func getArabicCauses(){
        //self.loadinHubShow()
        if Reachability.isConnectedToNetwork(){
            let parameters = [
                "api_token": "WNi3oumvqu8ADhvWLqhPN18FhGplwwYgVYuWaHfrFInZcgI2J7o0obuWIIO5"]
            print(parameters)
            let url = "https://takafulsuhar.om/api/all-causes"
            print(url)
            AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).responseJSON {
                        response in
                        switch (response.result) {
                        case .success(let json):
                            let response = json as! [String:AnyObject]
                            print(response)
                            self.nameArray.removeAll()
                            self.idArray.removeAll()
                            self.arnameArry.removeAll()
                            DispatchQueue.main.async {
                                let data = response["data"] as! Array<Any>
                                print(data.count)
                                for i in 0 ..< data.count{
                                    let x = data[i] as! [String:AnyObject]
                                    let id = x["id"] as? Int ?? 0
                                    let title = x["title"] as? String ?? ""
                                    let Artitle = x["ar_title"] as? String ?? ""
                                    self.arnameArry.append(Artitle)
                                    self.idArray.append(id)
                                    self.nameArray.append(title)
                                    
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
                                    if Artitle == "هدية"{
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
                                    if Artitle ==  "الجار الجنب"{
                                        self.nextDoorNeighbor = Artitle
                                    }
                                    if id == 94{
                                        self.nextDoorNeighborID = id
                                    }
                                    if Artitle == "عائلة محتاجة"{
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
                                    if Artitle == "المشاريع الوقفية"{
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
                                    if Artitle == "كفالة يتيم"{
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
                                    if Artitle == "العقيقة"{
                                        self.Aqiqah = Artitle
                                    }
                                    if id == 87{
                                        self.AqiqahId = id
                                    }
                                    
                                    if Artitle == "الأضاحي"{
                                        self.Sacrificelbl = Artitle
                                    }
                                    
                                    if id == 85{
                                        self.SacrificeId = id
                                    }
                                    
                                    if Artitle == "نذر"{
                                        self.vowlbl = Artitle
                                    }
                                    if id == 86{
                                        self.vowId = id
                                    }
                                    if Artitle == "فدية الصيام"{
                                        self.Fastingransomlbl = Artitle
                                    }
                                    if id == 83{
                                        self.FastingId = id
                                    }
                                    if Artitle == "منزل يؤويهم"{
                                        self.Housingprojectslbl = Artitle
                                    }
                                    if id == 77{
                                        self.HousingprojectId = id
                                    }
                                    if Artitle ==  "فك كربة"{
                                        self.distresslbl = Artitle
                                    }
                                    if id == 64{
                                        self.distressId = id
                                    }
                                    if Artitle == "مشروع حقيبة مدرسية"{
                                        self.SchoolBagProjectlbl = Artitle
                                    }
                                    if id == 90{
                                        self.schoolBagId = id
                                    }
                                    if Artitle == "منزل يؤويهم"{
                                        self.HomeforThemlbl = Artitle
                                    }
                                    if id == 68{
                                        self.HomeforThemId = id
                                    }
                                    if id == 70{
                                        self.foodBasketID = id
                                    }
                                    if id == 72{
                                        self.expirationAuthId = id
                                    }
                                    if Artitle == "كفارة يمين"{
                                        self.expirationAuthlbl = Artitle
                                    }
                                }
                                self.searchTblVieww.reloadData()
                                
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTblVieww.dequeueReusableCell(withIdentifier: "cell") as! SearchTableViewCell
        cell.selectionStyle = .none
        let item = filteredItems[indexPath.row]
        cell.lbl?.text = item.name
        cell.img?.image = item.image
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 89
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = filteredItems[indexPath.row]
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            if item.name == "الصدقة اليومية"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = "Daily Sadaqa"
                vc.imgView = "daily_sadqa"
                vc.sadaquId = String(dailysadaquID)
                vc.descriptionString = "On the authority of Abu Hurairah, may God be pleased with him, that the Messenger of God, may God bless him and grant him peace He said (What charity lacks in money). narrated by Muslim"
                present(vc, animated: true,completion: nil)
            }else if item.name == "الجار الجنب"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardNextDoorViewController") as! DashboardNextDoorViewController
//                vc.nextDoorId = 94
//                vc.nextDoor = "fromDashboardNextDoor"
                self.definesPresentationContext = true
                vc.modalTransitionStyle = .coverVertical

                self.present(vc, animated: true, completion: nil)
                
            }else if item.name == "فك كربة"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = "Detress Relief"
                vc.imgView = "DetressRelief"
                vc.sadaquId = String(destressId)
                vc.descriptionString = "On the authority of Uqbah Aamer, may God be pleased with him, that the Messenger of God, may God bless him and grant him peace He said (A man is in the shade of his charity until it is decided betweeen the people). narrated by Ahmed"
                present(vc, animated: true,completion: nil)
            }else if item.name == "صدقة\n الجمعة"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = "Friday Charity"
                vc.imgView = "FridayCharity"
                vc.sadaquId = String(charityId)
                vc.descriptionString = "On the authority of Uqbah Aamer, may God be pleased with him, that the Messenger of God, may God bless him and grant him peace He said (A man is in the shade of his charity until it is decided betweeen the people). narrated by Ahmed"
                present(vc, animated: true,completion: nil)
            }else if item.name == "العقيقة"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
                vc.expirationId = AqiqahId
                vc.isAquiuah = "Aqiuah"
               vc.modalTransitionStyle = .coverVertical
                present(vc, animated: true,completion: nil)
            }
            else if item.name == "نذر"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
                vc.modalTransitionStyle = .coverVertical
                vc.isVow = "Vow"
                vc.sacrificeId = vowId
                present(vc, animated: true,completion: nil)
            }
            else if item.name == "ذبيحة"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
                vc.modalTransitionStyle = .coverVertical
                vc.isSacrifice = "Sacrifice"
                vc.sacrificeId = SacrificeId
                present(vc, animated: true,completion: nil)
            }else if item.name == "صدقة ليتيم"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = orphanLbl
                vc.id = orphanID
                present(vc, animated: true,completion: nil)
            }
            else if item.name == "فدية صيام"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
                vc.modalTransitionStyle = .coverVertical
                vc.isFastingRansom = "IsFastingRansom"
                vc.sacrificeId = FastingId
                present(vc, animated: true,completion: nil)
            }
            else if item.name == "هدية"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "GiftVC") as! GiftVC
                vc.modalTransitionStyle = .coverVertical
                present(vc, animated: true,completion: nil)
            }
            else if item.name == "الشروط والالكترونيات"{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = conditionsElectroincs
                vc.id = conditionsElectroincsID
                self.present(vc, animated: true)
            }
            else if item.name == "التمكين الاقتصادي"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
               vc.modalTransitionStyle = .coverVertical
                vc.titleText = EconmimcEmpowermentLbl
                vc.id = EconmimcEmpowermentId
               present(vc, animated: true,completion: nil)
            }else if item.name == "صيانة المنزل"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = houseMaintenanceLbl
                vc.id = houseMaintenanceId
                present(vc, animated: true,completion: nil)
            }
            else if item.name == "مشروع اسكان"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = "Housing Projects"
                vc.imgView = ""
                vc.sadaquId = "\(HousingprojectId!)"
                vc.descriptionString = "Nothing compares to a safe heaven for a happy family with the aim of improving the standard of living for families and achieving social stability. The team seeks, in partnership with various agencies and individuals, to build housing project for homeless families with limited income and to provide the basic requirements for safe and comfortable housing. By building and maintaning housing units for low-income citizens in which basis facilites and services aer available taking into account the number of family members."
                present(vc, animated: true,completion: nil)
            }
            else if item.name == "طالب علم"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "SponserShipVC") as! SponserShipVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = StudentsLbl
                vc.id = studentsID
                present(vc, animated: true,completion: nil)
            }
            else if item.name == "دعم ذوي الاحتياجات الخاصة"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = specialNeedslbl
                vc.id = specialNeedsId
                present(vc, animated: true,completion: nil)
            }
            else if item.name == "كسوة اسرة معسرة"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "SponserShipVC") as! SponserShipVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = familyInNeedlbl
                vc.id = familyInNeedId
                present(vc, animated: true,completion: nil)
            }
            else if item.name == "Orphan"{
                
            }
            else if item.name == "كفارة يمين"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
                vc.expirationId = expirationAuthId
                vc.isExpirationAuth = "expirationFromDashboard"
                vc.modalTransitionStyle = .coverVertical
                present(vc, animated: true,completion: nil)
            }else if item.name == "ملابس رديئة"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
               vc.modalTransitionStyle = .coverVertical
                vc.titleText = ClothingAPoor
                vc.id = clothingAPoorId
               present(vc, animated: true,completion: nil)
            }
            else if item.name == "السلة الغذائية"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
                vc.BasketId = foodBasketID
               vc.modalTransitionStyle = .coverVertical
               present(vc, animated: true,completion: nil)
            }
            else if item.name == "صدقات عامة"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = "Public Charity"
                vc.imgView = "daily_sadqa"
                vc.sadaquId = "\(publicSadaqatId!)"
                vc.descriptionString = "On the authority of Abu Hurairah, may God be pleased with him, that the Messenger of God, may God bless him and grant him peace He said (What charity lacks in money). narrated by Muslim"
                present(vc, animated: true,completion: nil)
            }
            else if item.name == "منزل يؤويهم"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
               vc.modalTransitionStyle = .coverVertical
                vc.titleText = HomeforThemlbl
                vc.id = HomeforThemId
               present(vc, animated: true,completion: nil)
            }
            else if item.name == "مشروع الحقيبة المدرسية"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
               vc.modalTransitionStyle = .coverVertical
                vc.titleText = SchoolBagProjectlbl
                vc.id = schoolBagId
               present(vc, animated: true,completion: nil)
            }
            else if item.name == "فك كربة"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
               vc.modalTransitionStyle = .coverVertical
                vc.titleText = distresslbl
                vc.id = distressId
               present(vc, animated: true,completion: nil)
            }
            else if item.name == "المشاريع الإسكانية"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = "Housing Projects"
                vc.imgView = ""
                vc.sadaquId = "\(HousingprojectId!)"
                vc.descriptionString = "Nothing compares to a safe heaven for a happy family with the aim of improving the standard of living for families and achieving social stability. The team seeks, in partnership with various agencies and individuals, to build housing project for homeless families with limited income and to provide the basic requirements for safe and comfortable housing. By building and maintaning housing units for low-income citizens in which basis facilites and services aer available taking into account the number of family members."
                present(vc, animated: true,completion: nil)
            }
        }else{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            if item.name == "Daily Sadaqa"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = "Daily Sadaqa"
                vc.imgView = "daily_sadqa"
                vc.sadaquId = String(dailysadaquID)
                vc.descriptionString = "On the authority of Abu Hurairah, may God be pleased with him, that the Messenger of God, may God bless him and grant him peace He said (What charity lacks in money). narrated by Muslim"
                present(vc, animated: true,completion: nil)
            }else if item.name == "Next door neighbour"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = "Neighbours in Village"
                vc.imgView = "neighbours"
                vc.sadaquId = String(nextDoorNeighborID)
                vc.descriptionString = "On the authority of Abdulla bin Omar, may God be pleased with him, that the Messenger of God, may God's prayers and peace be upon him, said Gabriel still advised me about the neighbour, until I thought that he would inherit it. Narrated by Al-Bukhari"
                present(vc, animated: true,completion: nil)
            }
            else if item.name == "Distress Relief"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = "Detress Relief"
                vc.imgView = "DetressRelief"
                vc.sadaquId = String(destressId)
                vc.descriptionString = "On the authority of Uqbah Aamer, may God be pleased with him, that the Messenger of God, may God bless him and grant him peace He said (A man is in the shade of his charity until it is decided betweeen the people). narrated by Ahmed"
                present(vc, animated: true,completion: nil)
            }
            else if item.name == "Stop arrow"{
                
            }
            else if item.name == "Public Charity"{
               
            }
            else if item.name == "Clothing a poor For one year"{
                
            }
            else if item.name == "Clothing a Family For one year"{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = "Clothing a Family For one year"
                vc.id = clothingAPoorId
                self.present(vc, animated: true)
            }
            else if item.name == "Friday Charity"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = "Friday Charity"
                vc.imgView = "FridayCharity"
                vc.sadaquId = String(charityId)
                vc.descriptionString = "On the authority of Uqbah Aamer, may God be pleased with him, that the Messenger of God, may God bless him and grant him peace He said (A man is in the shade of his charity until it is decided betweeen the people). narrated by Ahmed"
                present(vc, animated: true,completion: nil)
            }
            else if item.name == "Aqiqah"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
                vc.expirationId = AqiqahId
                vc.isAquiuah = "Aqiuah"
               vc.modalTransitionStyle = .coverVertical
               present(vc, animated: true,completion: nil)
            }
            else if item.name == "Vow"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
                vc.modalTransitionStyle = .coverVertical
                vc.isVow = "Vow"
                vc.sacrificeId = vowId
                present(vc, animated: true,completion: nil)
            }
            else if item.name == "Sacrifice"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
                vc.modalTransitionStyle = .coverVertical
                vc.isSacrifice = "Sacrifice"
                vc.sacrificeId = SacrificeId
                present(vc, animated: true,completion: nil)
            }
            else if item.name == "Orphan charity"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = orphanLbl
                vc.id = orphanID
                present(vc, animated: true,completion: nil)
            }
            else if item.name == "Fasting ransom"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
                vc.modalTransitionStyle = .coverVertical
                vc.isFastingRansom = "IsFastingRansom"
                vc.sacrificeId = FastingId
                present(vc, animated: true,completion: nil)
            }
            else if item.name == "A gift"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "GiftVC") as! GiftVC
                vc.modalTransitionStyle = .coverVertical
                present(vc, animated: true,completion: nil)
            }
            else if item.name == "Condition & elecctronics"{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = conditionsElectroincs
                vc.id = conditionsElectroincsID
                self.present(vc, animated: true)
            }
            else if item.name == "Economic empowerment"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
               vc.modalTransitionStyle = .coverVertical
                vc.titleText = EconmimcEmpowermentLbl
                vc.id = EconmimcEmpowermentId
               present(vc, animated: true,completion: nil)
            }
            else if item.name == "House maintenance"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = houseMaintenanceLbl
                vc.id = houseMaintenanceId
                present(vc, animated: true,completion: nil)
            }
            else if item.name == "Housing Project"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = "Housing Projects"
                vc.imgView = ""
                vc.sadaquId = "\(HousingprojectId!)"
                vc.descriptionString = "Nothing compares to a safe heaven for a happy family with the aim of improving the standard of living for families and achieving social stability. The team seeks, in partnership with various agencies and individuals, to build housing project for homeless families with limited income and to provide the basic requirements for safe and comfortable housing. By building and maintaning housing units for low-income citizens in which basis facilites and services aer available taking into account the number of family members."
                present(vc, animated: true,completion: nil)
            }
            else if item.name == "Student support"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "SponserShipVC") as! SponserShipVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = StudentsLbl
                vc.id = studentsID
                present(vc, animated: true,completion: nil)
            }
            else if item.name == "Special needs"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = specialNeedslbl
                vc.id = specialNeedsId
                present(vc, animated: true,completion: nil)
            }
            else if item.name == "Family in need"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "SponserShipVC") as! SponserShipVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = familyInNeedlbl
                vc.id = familyInNeedId
                present(vc, animated: true,completion: nil)
            }
            else if item.name == "Orphan"{
                
            }
            else if item.name == "Expiation for a broken Oath"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
                          vc.expirationId = expirationAuthId
                          vc.isExpirationAuth = "expirationFromDashboard"
                         vc.modalTransitionStyle = .coverVertical
                         present(vc, animated: true,completion: nil)
            }
            else if item.name == "Clothing a poor"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
               vc.modalTransitionStyle = .coverVertical
                vc.titleText = ClothingAPoor
                vc.id = clothingAPoorId
               present(vc, animated: true,completion: nil)
            }
            else if item.name == "Food basket"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
                vc.BasketId = foodBasketID
               vc.modalTransitionStyle = .coverVertical
               present(vc, animated: true,completion: nil)
            }
            else if item.name == "Public sadaqat"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = "Public Charity"
                vc.imgView = "daily_sadqa"
                vc.sadaquId = "\(publicSadaqatId!)"
                vc.descriptionString = "On the authority of Abu Hurairah, may God be pleased with him, that the Messenger of God, may God bless him and grant him peace He said (What charity lacks in money). narrated by Muslim"
                present(vc, animated: true,completion: nil)
            }
            
            else if item.name == "Home for them"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
               vc.modalTransitionStyle = .coverVertical
                vc.titleText = HomeforThemlbl
                vc.id = HomeforThemId
               present(vc, animated: true,completion: nil)
            }
            else if item.name == "School bag project"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
               vc.modalTransitionStyle = .coverVertical
                vc.titleText = SchoolBagProjectlbl
                vc.id = schoolBagId
               present(vc, animated: true,completion: nil)
            }
            else if item.name == "Detress Relief"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
               vc.modalTransitionStyle = .coverVertical
                vc.titleText = distresslbl
                vc.id = distressId
               present(vc, animated: true,completion: nil)
            }
            else if item.name == "Housing project"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = "Housing Projects"
                vc.imgView = ""
                vc.sadaquId = "\(HousingprojectId!)"
                vc.descriptionString = "Nothing compares to a safe heaven for a happy family with the aim of improving the standard of living for families and achieving social stability. The team seeks, in partnership with various agencies and individuals, to build housing project for homeless families with limited income and to provide the basic requirements for safe and comfortable housing. By building and maintaning housing units for low-income citizens in which basis facilites and services aer available taking into account the number of family members."
                present(vc, animated: true,completion: nil)
            }
        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            guard let currentText = textField.text else {
                return true
            }
            
            let searchText = (currentText as NSString).replacingCharacters(in: range, with: string)
            
            if searchText.isEmpty {
                filteredItems = items
            } else {
                filteredItems = items.filter { $0.name.lowercased().contains(searchText.lowercased()) }
            }
            
            searchTblVieww.reloadData()
            
            return true
        }
}


struct Item {
    let name: String
    let image: UIImage
}


extension UITextField {
    func setPadding(left: CGFloat, right: CGFloat? = nil) {
        setLeftPadding(left)
        if let rightPadding = right {
            setRightPadding(rightPadding)
        }
    }

    private func setLeftPadding(_ padding: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }

    private func setRightPadding(_ padding: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
