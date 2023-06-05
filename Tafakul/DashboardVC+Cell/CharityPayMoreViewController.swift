//
//  CharityPayMoreViewController.swift
//  Tafakul
//
//  Created by apple on 17/05/23.
//

import UIKit
import Alamofire

class CharityPayMoreViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    

    @IBOutlet weak var morelbl: UILabel!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var charityCollVC: UICollectionView!
    
    var CharityPaysArray = ["Orphan charity","Sacrifice","Fasting ransom","Friday Sadaqa","Vow","Sacrifice","Special Needs","Student Support","Aqiqah"]
    
    var charityPaysImages = ["head","sacrifice","masque","friday_charity","vow","goat","need","student","aqiqah"]
    
    var titleArray = [String]()
    var idArray = [Int]()
    var orphanLbl:String?
    var oprphanID:Int?
    var sacrifice:String?
    var sacrificeID:Int?
    var fastingRansom:String?
    var fastingRansomId:Int?
    var FridayCharity:String?
    var FridayCharityID:Int?
    var Vow:String?
    var VowID:Int?
    var SacrificeTwo:String?
    var SacrificeTwoId:Int?
    var SpecialNeeds:String?
    var SpeicalNeedsId:Int?
    var studentSupport:String?
    var studentSupportID:Int?
    var Aquiah:String?
    var AquiahId:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        charityCollVC.delegate = self
        charityCollVC.dataSource = self
        
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            self.getArabicCauses()
            self.morelbl.text = "أكثر"
            backBtn.setImage(UIImage.init(named: "ArabicBackIcon"), for: .normal)
            
        }
        else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            self.getCauses()
            self.morelbl.text = "More"
            backBtn.setImage(UIImage.init(named: "BackButton"), for: .normal)
        }
    }
    
    @IBAction func backDismissAct(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    func getArabicCauses(){
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
                                    let title = x["ar_title"] as? String ?? ""
                                    self.idArray.append(id)
                                    self.titleArray.append(title)
                                    if title == "Orphan"{
                                        self.orphanLbl = title
                                    }
                                    if id == 73{
                                        self.oprphanID = id
                                    }
                                    if title == "Sacrifice"{
                                        self.sacrifice = title
                                    }
                                    if id == 85{
                                        self.sacrificeID = id
                                    }
                                    if title == "Fasting Ransom"{
                                        self.fastingRansom = title
                                    }
                                    if id == 83{
                                        self.fastingRansomId = id
                                    }
                                    if title == "Friday charity"{
                                        self.FridayCharity = title
                                    }
                                    if id == 89{
                                        self.FridayCharityID = id
                                    }
                                    if title == "Vow"{
                                        self.Vow = title
                                    }
                                    if id == 86{
                                        self.VowID = id
                                    }
                                    if title == "Special Needs"{
                                        self.SpecialNeeds = title
                                    }
                                    if id == 75{
                                        self.SpeicalNeedsId = id
                                    }
                                    if title == "Students"{
                                        self.studentSupport = title
                                    }
                                    if id == 76{
                                        self.studentSupportID = id
                                    }
                                    if title == "Aqiqah"{
                                        self.Aquiah = title
                                    }
                                    if id == 87{
                                        self.AquiahId = id
                                    }
                                    
                                }
                                self.charityCollVC.reloadData()
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
                                    if title == "Orphan"{
                                        self.orphanLbl = title
                                    }
                                    if id == 73{
                                        self.oprphanID = id
                                    }
                                    if title == "Sacrifice"{
                                        self.sacrifice = title
                                    }
                                    if id == 85{
                                        self.sacrificeID = id
                                    }
                                    if title == "Fasting Ransom"{
                                        self.fastingRansom = title
                                    }
                                    if id == 83{
                                        self.fastingRansomId = id
                                    }
                                    if title == "Friday charity"{
                                        self.FridayCharity = title
                                    }
                                    if id == 89{
                                        self.FridayCharityID = id
                                    }
                                    if title == "Vow"{
                                        self.Vow = title
                                    }
                                    if id == 86{
                                        self.VowID = id
                                    }
                                    if title == "Special Needs"{
                                        self.SpecialNeeds = title
                                    }
                                    if id == 75{
                                        self.SpeicalNeedsId = id
                                    }
                                    if title == "Students"{
                                        self.studentSupport = title
                                    }
                                    if id == 76{
                                        self.studentSupportID = id
                                    }
                                    if title == "Aqiqah"{
                                        self.Aquiah = title
                                    }
                                    if id == 87{
                                        self.AquiahId = id
                                    }
                                    
                                }
                                self.charityCollVC.reloadData()
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
           return 9
        }
        else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            return CharityPaysArray.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            let cell = charityCollVC.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CharityPayMoreCollectionViewCell
            if indexPath.row == 0{
                cell?.nameLbl.text = "صدقة ليتيم"
                cell?.imgVieww.image = UIImage.init(named: "head")
            }else if indexPath.row == 1{
                cell?.nameLbl.text = "الأضاحي"
                cell?.imgVieww.image = UIImage.init(named: "sacrifice")
            }else if indexPath.row == 2{
                cell?.nameLbl.text = "فدية الصيام"
                cell?.imgVieww.image = UIImage.init(named: "masque")
            }else if indexPath.row == 3{
                cell?.nameLbl.text = "صدقة الجمعة"
                cell?.imgVieww.image = UIImage.init(named: "friday_charity")
            }else if indexPath.row == 4{
                cell?.nameLbl.text =  "نذر"
                cell?.imgVieww.image = UIImage.init(named: "vow")
            }else if indexPath.row == 5{
                cell?.nameLbl.text = "الأضاحي"
                cell?.imgVieww.image = UIImage.init(named: "goat")
            }else if indexPath.row == 6{
                cell?.nameLbl.text =  "دعم ذوي الإحتياجات الخاصة"
                cell?.imgVieww.image = UIImage.init(named: "need")
            }else if indexPath.row == 7{
                cell?.nameLbl.text = "دعم طالب علم"
                cell?.imgVieww.image = UIImage.init(named: "student")
            }else if indexPath.row == 8{
                cell?.nameLbl.text = "العقيقة"
                cell?.imgVieww.image = UIImage.init(named: "aqiqah")
            }
            return cell!
        }
        else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            let cell = charityCollVC.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CharityPayMoreCollectionViewCell
            cell?.nameLbl.text = CharityPaysArray[indexPath.item]
            cell?.imgVieww.image = UIImage.init(named: charityPaysImages[indexPath.item])
            return cell!
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
        {
           return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let noOfCellsInRow = 2

        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        let cellHeightSize = 60
        return CGSize(width: size, height: cellHeightSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0{
            let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
            vc.modalTransitionStyle = .coverVertical
            vc.titleText = orphanLbl
            vc.id = oprphanID
            present(vc, animated: true,completion: nil)
        }
        if indexPath.row == 1{
            let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
            vc.modalTransitionStyle = .coverVertical
            vc.isSacrifice = "Sacrifice"
            vc.sacrificeId = sacrificeID
            self.definesPresentationContext = true
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: true, completion: nil)
        }
        if indexPath.row == 2{
            let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
            vc.modalTransitionStyle = .coverVertical
            vc.isFastingRansom = "IsFastingRansom"
            vc.sacrificeId = fastingRansomId
            self.definesPresentationContext = true
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: true, completion: nil)
        }
        if indexPath.row == 3{
            let vc = storyboard?.instantiateViewController(withIdentifier: "DailySadaqaVC") as! DailySadaqaVC
            vc.modalTransitionStyle = .coverVertical
            vc.titleText = "Friday Charity"
            vc.imgView = "FridayCharity"
            vc.descriptionString = "On the authority of Uqbah Aamer, may God be pleased with him, that the Messenger of God, may God bless him and grant him peace He said (A man is in the shade of his charity until it is decided betweeen the people). narrated by Ahmed"
            vc.sadaquId = "\(FridayCharityID!)"
            present(vc, animated: true,completion: nil)
        }
        if indexPath.row == 4{
            let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
            vc.modalTransitionStyle = .coverVertical
            vc.isVow = "Vow"
            vc.sacrificeId = VowID
            present(vc, animated: true,completion: nil)
        }
        if indexPath.row == 5{
            let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
            vc.modalTransitionStyle = .coverVertical
            vc.isSacrificeMore = "isSacrificeMore"
            vc.sacrificeId = sacrificeID
            present(vc, animated: true,completion: nil)
        }
        if indexPath.row == 6{
            let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
            vc.modalTransitionStyle = .coverVertical
            vc.titleText = SpecialNeeds
            vc.id = SpeicalNeedsId
            present(vc, animated: true,completion: nil)
        }
        if indexPath.row == 7{
            let vc = storyboard?.instantiateViewController(withIdentifier: "ContributeVC") as! ContributeVC
            vc.modalTransitionStyle = .coverVertical
            vc.titleText = studentSupport
            vc.id = studentSupportID
            present(vc, animated: true,completion: nil)
        }
        if indexPath.row == 8{
            let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardFoodBasketViewController") as! DashboardFoodBasketViewController
            vc.expirationId = AquiahId
            vc.isAquiuah = "Aqiuah"
           vc.modalTransitionStyle = .coverVertical
           present(vc, animated: true,completion: nil)
        }
    }

}
