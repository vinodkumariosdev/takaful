//
//  CartVC.swift
//  Tafakul
//
//  Created by apple on 20/12/22.
//

import UIKit
import Alamofire
var titleCart:String!
var cartIconImg:String!
var cartAmount:String!
var donateCartID:Int!
var amountDonate:String!
var donateAmountBtnTitle:String!

class CartVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var cartLbl: UILabel!
    @IBOutlet weak var cartDonateTB: UITableView!
    var userid:String!
    var countriesData = [[String:Any]]()
    var titleArray = [String]()
    var imgArray = [String]()
    var idArray = [Int]()
    var amountArray = [String]()
    var DonateamountArray = [String]()
    var donateAmountBtnTitleArray = [String]()
    var titleArrayElements = [String]()
    
    @IBOutlet weak var backBtn: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            cartLbl.text = "عربة التسوق"
            backBtn.setImage(UIImage.init(named: "ArabicBackIcon"), for: .normal)
            
            userid = UserDefaults.standard.string(forKey: "id")
            if userid == nil{
                self.cartDonateTB.isHidden = true
                let alert = UIAlertController(title: "", message:"Please Login For Access Profile".l10n(), preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok".l10n(), style: .default, handler: {(_ action: UIAlertAction) -> Void in
                    Constant.isLoginView = true
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "PhoneSignUpViewController") as! PhoneSignUpViewController
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }))
                self.present(alert, animated: true, completion: nil)
            }else{
                
                self.cartDonateTB.isHidden = false
            }
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            cartLbl.text = "Cart"
            backBtn.setImage(UIImage.init(named: "BackButton"), for: .normal)
            userid = UserDefaults.standard.string(forKey: "id")
            if userid == nil{
                self.cartDonateTB.isHidden = true
                let alert = UIAlertController(title: "", message:"Please Login For Access Profile".l10n(), preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok".l10n(), style: .default, handler: {(_ action: UIAlertAction) -> Void in
                    Constant.isLoginView = true
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "PhoneSignUpViewController") as! PhoneSignUpViewController
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }))
                self.present(alert, animated: true, completion: nil)
            }else{
                
                self.cartDonateTB.isHidden = false
            }
        }
        
      
    }
    
    @IBAction func cartDismissBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if isbackCart == "backCart" {
            if(donateAmountBtnTitle != nil) {
                self.donateAmountBtnTitleArray.append(donateAmountBtnTitle)
            }
            
            self.titleArray.append(titleCart)
            self.titleArrayElements = titleArray.uniquelements()
            self.amountArray.append(cartAmount)
            self.imgArray.append(cartIconImg)
            self.idArray.append(donateCartID)
            self.DonateamountArray.append(amountDonate)
            self.cartDonateTB.delegate = self
            self.cartDonateTB.dataSource = self
            self.cartDonateTB.reloadData()
        }else{
            if titleCart == nil{
                if LocalizationSystem.sharedInstance.getLanguage() == "en"{
                    let alertController = UIAlertController(title: "", message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "لاتوجد بيانات", comment: ""), preferredStyle: .alert)
                    let confirmButton = UIAlertAction(title: "نعم", style: .default) { _ in
                    }
                    alertController.addAction(confirmButton)
                    self.present(alertController, animated: true, completion: nil)
                }else{
                    let alertController = UIAlertController(title: "", message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "No Data Found", comment: ""), preferredStyle: .alert)
                    let confirmButton = UIAlertAction(title: "OK", style: .default) { _ in
                    }
                    alertController.addAction(confirmButton)
                    self.present(alertController, animated: true, completion: nil)
                }
                
            }else{
                self.titleArray.append(titleCart)
                self.titleArrayElements = titleArray.uniquelements()
            }
            if cartAmount == nil{
                
            }else{
                self.amountArray.append(cartAmount)
            }
            if cartIconImg == nil{
                
            }else{
                self.imgArray.append(cartIconImg)
            }
            if donateCartID == nil{
                
            }else{
                self.idArray.append(donateCartID)
            }
            if amountDonate == nil{
                
            }else{
                self.DonateamountArray.append(amountDonate)
            }
            if donateAmountBtnTitle == nil{
                
            }else{
            self.donateAmountBtnTitleArray.append(donateAmountBtnTitle)
            }
            self.cartDonateTB.delegate = self
            self.cartDonateTB.dataSource = self
            self.cartDonateTB.reloadData()
        }
        
        self.cartDonateTB.separatorStyle = .none
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArrayElements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartDonateTB.dequeueReusableCell(withIdentifier: "cell") as! CartDonationTableViewCell
        if titleArrayElements[indexPath.row] == "" && imgArray[indexPath.row] == "" && amountArray[indexPath.row] == "" && donateAmountBtnTitleArray[indexPath.row] == ""{
            cell.cardView.backgroundColor = UIColor.white
            cell.donateBtn.backgroundColor = UIColor.clear
            cell.titleLabel.text = ""
            cell.amountLbl.text = ""
            cell.donateBtn.setTitle("", for: .normal)
            cell.imgVieww.image = UIImage.init(named: "")
        }else{
            cell.titleLabel.text = titleArrayElements[indexPath.row]
            cell.imgVieww.image = UIImage.init(named: imgArray[indexPath.row])
            cell.amountLbl.text = "\(amountArray[indexPath.row])"
            cell.donateBtn.setTitle(donateAmountBtnTitleArray[indexPath.row], for: .normal)
            cell.donateBtn.tag = indexPath.row
            cell.donateBtn.addTarget(self, action: #selector(donateBtn), for: .touchUpInside)
            cell.cardView.backgroundColor = UIColor.systemGray5
            cell.donateBtn.backgroundColor = UIColor(hexString: "3E529C")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 91
    }
    
    @objc func donateBtn(_sender:UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        let index = _sender.tag
        vc.cartID = (self.idArray[index])
        vc.amount = self.DonateamountArray[index]
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
       /* titleCart = ""
        cartIconImg = ""
        cartAmount = ""*/
    }
   
}

extension UIView {

    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
    }
}

extension Array where Element: Hashable {
    func uniquelements() -> Array {
        var temp = Array()
        var s = Set<Element>()
        for i in self {
            if !s.contains(i) {
                temp.append(i)
                s.insert(i)
            }
        }
        return temp
    }
}
