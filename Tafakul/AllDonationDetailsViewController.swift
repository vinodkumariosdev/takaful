//
//  AllDonationDetailsViewController.swift
//  Tafakul
//
//  Created by apple on 19/01/23.
//

import UIKit
import Alamofire

class AllDonationDetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var cartTB: UITableView!
    
    var userid:String!
    
    var countriesData = [[String:Any]]()
    
    @IBOutlet weak var backBtn: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        userid = UserDefaults.standard.string(forKey: "id")
        if userid == nil{
            self.cartTB.isHidden = true
            let alert = UIAlertController(title: "", message:"Please Login For Access Profile".l10n(), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok".l10n(), style: .default, handler: {(_ action: UIAlertAction) -> Void in
                Constant.isLoginView = true
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
        }else{
            self.cartTB.isHidden = false
            
        }
        cartTB.delegate = self
        cartTB.dataSource = self
        self.getpaymentDetails()
        self.backBtn.addTarget(self, action: #selector(backBtnDismiss), for: .touchUpInside)
    }
    
    @objc func backBtnDismiss(){
        self.dismiss(animated: true)
    }
    

    func getpaymentDetails(){
        //self.loadinHubShow()
        let url = "\(Constants.Common.finalURL)get-payment/\(userid!)?api_token=WNi3oumvqu8ADhvWLqhPN18FhGplwwYgVYuWaHfrFInZcgI2J7o0obuWIIO5"
        AF.request(url, method: .get, encoding: JSONEncoding.default)
                .responseJSON { response in
                    switch response.result {
                    case .success(let json):
                        let response = json as! [String:AnyObject]
                        self.countriesData.removeAll()
                        if let data = response["data"] as? [[String:Any]]{
                            self.countriesData = data
                            //self.loadinHubDismiss()
                        }
                        DispatchQueue.main.async {
                            self.cartTB.reloadData()
                            //self.loadinHubDismiss()
                        }
                        
                    case .failure(let error):
                        print(error)
                        let alert = UIAlertController(title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "", comment: ""), message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "Unable To Connect Server", comment: ""), preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "Ok", comment: ""), style: UIAlertAction.Style.default, handler: { action in
                            self.loadinHubDismiss()
                        }))
                        self.present(alert, animated: true, completion: nil)
                    }
            }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countriesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartTB.dequeueReusableCell(withIdentifier: "CartTVCell", for: indexPath) as! CartTVCell
        let dict = countriesData[indexPath.row]
        cell.invoiceLbl.text = "1"
        let id = "\(String(describing: dict["id"] as! Int))"
        cell.donateIdLbl.text = id
        cell.donateTypeLbl.text = dict["order_type"] as? String ?? ""
        cell.DonateAmountLbl.text = dict["created_date"] as? String ?? ""
        cell.DonationStatusLbl.text = dict["status"] as? String ?? ""
        cell.DonateAmountLbl.text = "\(String(describing: dict["amount"]as! Int)) OMR"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 333
    }
    
}

