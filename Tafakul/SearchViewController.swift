//
//  SearchViewController.swift
//  Tafakul
//
//  Created by apple on 11/01/23.
//

import UIKit
import Alamofire

class SearchViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    
    @IBOutlet weak var backBtn: UIButton!
    var countriesData = [[String:Any]]()
    var searchCountries = [[String:Any]]()
    var result: Result?
    @IBOutlet weak var tblVieww: UITableView!
    var idArray = [Int]()
    var nameArray = [String]()
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
    var searchResults:[String] = []
    var searchTxt = ""
    var isSearchingSelecting = ""
    var arrFilterData : [String] = []
    var imageFilterData : [String] = []
    var isSearch : Bool!
    var distresslbl:String!
    var distressId:Int!
    var SchoolBagProjectlbl:String!
    var schoolBagId:Int!
    var HomeforThemlbl:String!
    var HomeforThemId:Int!
    var expirationAuthlbl:String!
    var searchlist = [SearchList]()
    var filteredItems = [SearchList]()
    
    @IBOutlet weak var searchNameTF: UITextField!{
        didSet{
            self.searchNameTF.layer.cornerRadius = 15.0
            self.searchNameTF.layer.masksToBounds = true
            self.searchNameTF.layer.borderColor = UIColor.lightGray.cgColor
            self.searchNameTF.layer.borderWidth = 1.0
        }
    }
    
    var titleArray = ["Daily Sadaqa","Next door neighbour","Distress Relief","Stop arrow","Public Charity","Clothing a poor For one year","Clothing a Family For one year","Friday Charity","Aqiqah","Vow","Sacrifice","Orphan charity","Fasting ransom","A gift","Condition & elecctronics","Economic empowerment","House maintenance","Housing Project","Student support","Special needs","Family in need","Orphan","Expiation for a broken Oath","Clothing a poor","Food basket","Public sadaqat","Home for them","School bag project","Detress Relief","Housing project"]
    
    var iconArray = ["sadqa","neighbor","detress","house","food","clothing","gift_4","friday_charity","aqiqah","vow","sacrifice","head","masque","gift_s","electronics","economic","house","house","student","need","need","hand","expiation","clothing","food","food","house","student","detress","house"]
    
    var dic = [String:Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchlist.append(SearchList(name: "Daily Sadaqa", image: "sadqa"))
        searchlist.append(SearchList(name: "Next door neighbour", image: "neighbor"))
        searchlist.append(SearchList(name: "Distress Relief", image: "detress"))
        searchlist.append(SearchList(name: "Stop arrow", image: "house"))
        searchlist.append(SearchList(name: "Public Charity", image: "food"))
        searchlist.append(SearchList(name: "Clothing a poor For one year", image: "clothing"))
        searchlist.append(SearchList(name: "Clothing a Family For one year", image: "gift_4"))
        searchlist.append(SearchList(name: "Friday Charity", image: "friday_charity"))
        searchlist.append(SearchList(name: "Aqiqah", image: "aqiqah"))
        searchlist.append(SearchList(name: "Vow", image: "vow"))
        searchlist.append(SearchList(name: "Sacrifice", image: "sacrifice"))
        searchlist.append(SearchList(name: "Orphan charity", image: "head"))
        searchlist.append(SearchList(name: "Fasting ransom", image: "masque"))
        searchlist.append(SearchList(name: "A gift", image: "gift_s"))
        searchlist.append(SearchList(name: "Condition & elecctronics", image: "electronics"))
        searchlist.append(SearchList(name: "Economic empowerment", image: "economic"))
        searchlist.append(SearchList(name: "House maintenance", image: "house"))
        searchlist.append(SearchList(name: "Housing Project", image: "house"))
        searchlist.append(SearchList(name: "Student support", image: "student"))
        searchlist.append(SearchList(name: "Special needs", image: "need"))
        searchlist.append(SearchList(name: "Family in need", image: "need"))
        searchlist.append(SearchList(name: "Orphan", image: "hand"))
        searchlist.append(SearchList(name: "Expiation for a broken Oath", image: "expiation"))
        searchlist.append(SearchList(name: "Clothing a poor", image: "clothing"))
        searchlist.append(SearchList(name: "Food basket", image: "food"))
        searchlist.append(SearchList(name: "Public sadaqat", image: "food"))
        searchlist.append(SearchList(name: "Home for them", image: "house"))
        searchlist.append(SearchList(name: "School bag project", image: "student"))
        searchlist.append(SearchList(name: "Detress Relief", image: "detress"))
        searchlist.append(SearchList(name: "Housing project", image: "house"))
        self.searchNameTF.delegate = self
        isSearch = false
        searchNameTF.setLeftPaddingPoints(30)
        self.tblVieww.delegate = self
        self.tblVieww.dataSource = self
        self.getCauses()
        
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        isSearchingSelecting = ""
    }
    
      
      
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{

        var searchText  = textField.text! + string

        if string  == "" {
            searchText = (searchText as String).substring(to: searchText.index(before: searchText.endIndex))
        }

        if searchText == "" {
            isSearch = false
            tblVieww.reloadData()
        }
        else{
            isSearchingSelecting = "SearchingSelection"
            getSearchArrayContains(searchText)
        }
        return true
    }
    
    func getSearchArrayContains(_ text : String) {
        var predicate : NSPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", text)
        arrFilterData = (searchCountries as NSArray).filtered(using: predicate) as! [String]
        isSearch = true
        tblVieww.reloadData()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearch! {
                return searchCountries.count
        }else{
            return searchlist.count
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblVieww.dequeueReusableCell(withIdentifier: "cell") as! SearchTableViewCell
        if isSearch! {
           // searchCountries[indexPath.row]
            cell.lbl.text = ""
            if imageFilterData.count > 0 && indexPath.row < imageFilterData.count {
                cell.img.image = UIImage.init(named: imageFilterData[indexPath.row])
            }
            
        }else{
           /* cell.lbl.text = titleArray[indexPath.row]
            cell.img.image = UIImage.init(named: iconArray[indexPath.row])*/
            cell.accountObj = searchlist[indexPath.row]
        }
       
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isSearchingSelecting == "SearchingSelection"{
            print("searching")
            if arrFilterData[indexPath.row] == "Daily Sadaqa"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = "Daily Sadaqa"
                vc.imgView = "daily_sadqa"
                vc.sadaquId = String(dailysadaquID)
                vc.descriptionString = "On the authority of Abu Hurairah, may God be pleased with him, that the Messenger of God, may God bless him and grant him peace He said (What charity lacks in money). narrated by Muslim"
                present(vc, animated: true,completion: nil)
            }else if arrFilterData[indexPath.row] == "Next door neighbour"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = "Neighbours in Village"
                vc.imgView = "neighbours"
                vc.sadaquId = String(nextDoorNeighborID)
                vc.descriptionString = "On the authority of Abdulla bin Omar, may God be pleased with him, that the Messenger of God, may God's prayers and peace be upon him, said Gabriel still advised me about the neighbour, until I thought that he would inherit it. Narrated by Al-Bukhari"
                present(vc, animated: true,completion: nil)
            }
            else if arrFilterData[indexPath.row] == "Distress Relief"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = "Detress Relief"
                vc.imgView = "DetressRelief"
                vc.sadaquId = String(destressId)
                vc.descriptionString = "On the authority of Uqbah Aamer, may God be pleased with him, that the Messenger of God, may God bless him and grant him peace He said (A man is in the shade of his charity until it is decided betweeen the people). narrated by Ahmed"
                present(vc, animated: true,completion: nil)
            }
            else if arrFilterData[indexPath.row] == "Stop arrow"{
                
            }
            else if arrFilterData[indexPath.row] == "Public Charity"{
               
            }
            else if arrFilterData[indexPath.row] == "Clothing a poor For one year"{
                
            }
            else if arrFilterData[indexPath.row] == "Clothing a Family For one year"{
                
            }
            else if arrFilterData[indexPath.row] == "Friday Charity"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = "Friday Charity"
                vc.imgView = "FridayCharity"
                vc.sadaquId = String(charityId)
                vc.descriptionString = "On the authority of Uqbah Aamer, may God be pleased with him, that the Messenger of God, may God bless him and grant him peace He said (A man is in the shade of his charity until it is decided betweeen the people). narrated by Ahmed"
                present(vc, animated: true,completion: nil)
            }
            else if arrFilterData[indexPath.row] == "Aqiqah"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
                vc.expirationId = AqiqahId
                vc.isAquiuah = "Aqiuah"
               vc.modalTransitionStyle = .coverVertical
               present(vc, animated: true,completion: nil)
            }
            else if arrFilterData[indexPath.row] == "Vow"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
                vc.modalTransitionStyle = .coverVertical
                vc.isVow = "Vow"
                vc.sacrificeId = vowId
                present(vc, animated: true,completion: nil)
            }
            else if arrFilterData[indexPath.row] == "Sacrifice"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
                vc.modalTransitionStyle = .coverVertical
                vc.isSacrifice = "Sacrifice"
                vc.sacrificeId = SacrificeId
                present(vc, animated: true,completion: nil)
            }
            else if arrFilterData[indexPath.row] == "Orphan charity"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = orphanLbl
                vc.id = orphanID
                present(vc, animated: true,completion: nil)
            }
            else if arrFilterData[indexPath.row] == "Fasting ransom"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
                vc.modalTransitionStyle = .coverVertical
                vc.isFastingRansom = "IsFastingRansom"
                vc.sacrificeId = FastingId
                present(vc, animated: true,completion: nil)
            }
            else if arrFilterData[indexPath.row] == "A gift"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "GiftVC") as! GiftVC
                vc.modalTransitionStyle = .coverVertical
                present(vc, animated: true,completion: nil)
            }
            else if arrFilterData[indexPath.row] == "Condition & elecctronics"{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = conditionsElectroincs
                vc.id = conditionsElectroincsID
                self.present(vc, animated: true)
            }
            else if arrFilterData[indexPath.row] == "Economic empowerment"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
               vc.modalTransitionStyle = .coverVertical
                vc.titleText = EconmimcEmpowermentLbl
                vc.id = EconmimcEmpowermentId
               present(vc, animated: true,completion: nil)
            }
            else if arrFilterData[indexPath.row] == "House maintenance"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = houseMaintenanceLbl
                vc.id = houseMaintenanceId
                present(vc, animated: true,completion: nil)
            }
            else if arrFilterData[indexPath.row] == "Housing Project"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = "Housing Projects"
                vc.imgView = ""
                vc.sadaquId = "\(HousingprojectId!)"
                vc.descriptionString = "Nothing compares to a safe heaven for a happy family with the aim of improving the standard of living for families and achieving social stability. The team seeks, in partnership with various agencies and individuals, to build housing project for homeless families with limited income and to provide the basic requirements for safe and comfortable housing. By building and maintaning housing units for low-income citizens in which basis facilites and services aer available taking into account the number of family members."
                present(vc, animated: true,completion: nil)
            }
            else if arrFilterData[indexPath.row] == "Student support"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "SponserShipVC") as! SponserShipVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = StudentsLbl
                vc.id = studentsID
                present(vc, animated: true,completion: nil)
            }
            else if arrFilterData[indexPath.row] == "Special needs"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = specialNeedslbl
                vc.id = specialNeedsId
                present(vc, animated: true,completion: nil)
            }
            else if arrFilterData[indexPath.row] == "Family in need"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "SponserShipVC") as! SponserShipVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = familyInNeedlbl
                vc.id = familyInNeedId
                present(vc, animated: true,completion: nil)
            }
            else if arrFilterData[indexPath.row] == "Orphan"{
                
            }
            else if arrFilterData[indexPath.row] == "Expiation for a broken Oath"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
                          vc.expirationId = expirationAuthId
                          vc.isExpirationAuth = "expirationFromDashboard"
                         vc.modalTransitionStyle = .coverVertical
                         present(vc, animated: true,completion: nil)
            }
            else if arrFilterData[indexPath.row] == "Clothing a poor"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
               vc.modalTransitionStyle = .coverVertical
                vc.titleText = ClothingAPoor
                vc.id = clothingAPoorId
               present(vc, animated: true,completion: nil)
            }
            else if arrFilterData[indexPath.row] == "Food basket"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
                vc.BasketId = foodBasketID
               vc.modalTransitionStyle = .coverVertical
               present(vc, animated: true,completion: nil)
            }
            else if arrFilterData[indexPath.row] == "Public sadaqat"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = "Public Charity"
                vc.imgView = "daily_sadqa"
                vc.sadaquId = "\(publicSadaqatId!)"
                vc.descriptionString = "On the authority of Abu Hurairah, may God be pleased with him, that the Messenger of God, may God bless him and grant him peace He said (What charity lacks in money). narrated by Muslim"
                present(vc, animated: true,completion: nil)
            }
            
            else if arrFilterData[indexPath.row] == "Home for them"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
               vc.modalTransitionStyle = .coverVertical
                vc.titleText = HomeforThemlbl
                vc.id = HomeforThemId
               present(vc, animated: true,completion: nil)
            }
            else if arrFilterData[indexPath.row] == "School bag project"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
               vc.modalTransitionStyle = .coverVertical
                vc.titleText = SchoolBagProjectlbl
                vc.id = schoolBagId
               present(vc, animated: true,completion: nil)
            }
            else if arrFilterData[indexPath.row] == "Detress Relief"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
               vc.modalTransitionStyle = .coverVertical
                vc.titleText = distresslbl
                vc.id = distressId
               present(vc, animated: true,completion: nil)
            }
            else if arrFilterData[indexPath.row] == "Housing project"{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = "Housing Projects"
                vc.imgView = ""
                vc.sadaquId = "\(HousingprojectId!)"
                vc.descriptionString = "Nothing compares to a safe heaven for a happy family with the aim of improving the standard of living for families and achieving social stability. The team seeks, in partnership with various agencies and individuals, to build housing project for homeless families with limited income and to provide the basic requirements for safe and comfortable housing. By building and maintaning housing units for low-income citizens in which basis facilites and services aer available taking into account the number of family members."
                present(vc, animated: true,completion: nil)
            }
            
            
        }
    else{
        isSearchingSelecting == ""
            if indexPath.row == 0{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = "Daily Sadaqa"
                vc.imgView = "daily_sadqa"
                vc.sadaquId = String(dailysadaquID)
                vc.descriptionString = "On the authority of Abu Hurairah, may God be pleased with him, that the Messenger of God, may God bless him and grant him peace He said (What charity lacks in money). narrated by Muslim"
                present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 1{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = "Neighbours in Village"
                vc.imgView = "neighbours"
                vc.sadaquId = String(nextDoorNeighborID)
                vc.descriptionString = "On the authority of Abdulla bin Omar, may God be pleased with him, that the Messenger of God, may God's prayers and peace be upon him, said Gabriel still advised me about the neighbour, until I thought that he would inherit it. Narrated by Al-Bukhari"
                present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 2{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = "Detress Relief"
                vc.imgView = "DetressRelief"
                vc.sadaquId = String(destressId)
                vc.descriptionString = "On the authority of Uqbah Aamer, may God be pleased with him, that the Messenger of God, may God bless him and grant him peace He said (A man is in the shade of his charity until it is decided betweeen the people). narrated by Ahmed"
                present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 3{
                
            }
            if indexPath.row == 4{
                
            }
            if indexPath.row == 5{
                
            }
            if indexPath.row == 6{
                
            }
            if indexPath.row == 7{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = "Friday Charity"
                vc.imgView = "FridayCharity"
                vc.sadaquId = String(charityId)
                vc.descriptionString = "On the authority of Uqbah Aamer, may God be pleased with him, that the Messenger of God, may God bless him and grant him peace He said (A man is in the shade of his charity until it is decided betweeen the people). narrated by Ahmed"
                present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 8{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
                vc.expirationId = AqiqahId
                vc.isAquiuah = "Aqiuah"
               vc.modalTransitionStyle = .coverVertical
               present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 9{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
                vc.modalTransitionStyle = .coverVertical
                vc.isVow = "Vow"
                vc.sacrificeId = vowId
                present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 10{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
                vc.modalTransitionStyle = .coverVertical
                vc.isSacrifice = "Sacrifice"
                vc.sacrificeId = SacrificeId
                present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 11{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = orphanLbl
                vc.id = orphanID
                present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 12{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
                vc.modalTransitionStyle = .coverVertical
                vc.isFastingRansom = "IsFastingRansom"
                vc.sacrificeId = FastingId
                present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 13{
                let vc = storyboard?.instantiateViewController(withIdentifier: "GiftVC") as! GiftVC
                vc.modalTransitionStyle = .coverVertical
                present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 14{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = conditionsElectroincs
                vc.id = conditionsElectroincsID
                self.present(vc, animated: true)
            }
            if indexPath.row == 15{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
               vc.modalTransitionStyle = .coverVertical
                vc.titleText = EconmimcEmpowermentLbl
                vc.id = EconmimcEmpowermentId
               present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 16{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = houseMaintenanceLbl
                vc.id = houseMaintenanceId
                present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 17{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = "Housing Projects"
                vc.imgView = ""
                vc.sadaquId = "\(HousingprojectId!)"
                vc.descriptionString = "Nothing compares to a safe heaven for a happy family with the aim of improving the standard of living for families and achieving social stability. The team seeks, in partnership with various agencies and individuals, to build housing project for homeless families with limited income and to provide the basic requirements for safe and comfortable housing. By building and maintaning housing units for low-income citizens in which basis facilites and services aer available taking into account the number of family members."
                present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 18{
                let vc = storyboard?.instantiateViewController(withIdentifier: "SponserShipVC") as! SponserShipVC
               vc.modalTransitionStyle = .coverVertical
                vc.titleText = StudentsLbl
                vc.id = studentsID
               present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 19{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = specialNeedslbl
                vc.id = specialNeedsId
                present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 20{
                let vc = storyboard?.instantiateViewController(withIdentifier: "SponserShipVC") as! SponserShipVC
               vc.modalTransitionStyle = .coverVertical
                vc.titleText = familyInNeedlbl
                vc.id = familyInNeedId
               present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 21{
                
            }
            if indexPath.row == 22{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
                vc.expirationId = expirationAuthId
                vc.isExpirationAuth = "expirationFromDashboard"
               vc.modalTransitionStyle = .coverVertical
               present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 23{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
               vc.modalTransitionStyle = .coverVertical
                vc.titleText = ClothingAPoor
                vc.id = clothingAPoorId
               present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 24{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
                vc.BasketId = foodBasketID
               vc.modalTransitionStyle = .coverVertical
               present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 25{
                let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
                vc.modalTransitionStyle = .coverVertical
                vc.titleText = "Public Charity"
                vc.imgView = "daily_sadqa"
                vc.sadaquId = "\(publicSadaqatId!)"
                vc.descriptionString = "On the authority of Abu Hurairah, may God be pleased with him, that the Messenger of God, may God bless him and grant him peace He said (What charity lacks in money). narrated by Muslim"
                present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 26{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
               vc.modalTransitionStyle = .coverVertical
                vc.titleText = HomeforThemlbl
                vc.id = HomeforThemId
               present(vc, animated: true,completion: nil)

            }
            if indexPath.row == 27{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
               vc.modalTransitionStyle = .coverVertical
                vc.titleText = SchoolBagProjectlbl
                vc.id = schoolBagId
               present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 28{
                let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
               vc.modalTransitionStyle = .coverVertical
                vc.titleText = distresslbl
                vc.id = distressId
               present(vc, animated: true,completion: nil)
            }
            if indexPath.row == 29{
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

        
    
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true,completion: nil)
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
                            DispatchQueue.main.async {
                                let data = response["data"] as! Array<Any>
                                print(data.count)
                                for i in 0 ..< data.count{
                                    let x = data[i] as! [String:AnyObject]
                                    let id = x["id"] as? Int ?? 0
                                    let title = x["title"] as? String ?? ""
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
                                self.tblVieww.reloadData()
                                
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


}



