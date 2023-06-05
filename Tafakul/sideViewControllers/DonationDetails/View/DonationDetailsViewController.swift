//
//  DonationDetailsViewController.swift
//  Tafakul
//
//  Created by Tariqul on 12/10/22.
//


import UIKit

class DonationDetailsViewController: UIViewController {

    @IBOutlet weak var donationDetailsLbl: UILabel!
    
    @IBOutlet weak var userProfile: UIImageView!
    
    var donationModelList = [DonationDetailsDataModel]()

    @IBOutlet weak var donationDetailsCV: UICollectionView!
    
    @IBOutlet weak var backBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            donationDetailsLbl.text = "تفاصيل التبرع"
            backBtn.setImage(UIImage.init(named: "ArabicBackIcon"), for: .normal)
            
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            donationDetailsLbl.text = "Donation Details"
            backBtn.setImage(UIImage.init(named: "BackButton"), for: .normal)
        }
        getDonationDetails(completion: { responce in
            
            self.donationModelList = responce
            self.donationDetailsCV.reloadData()
        })
        
        
        /*self.userProfile.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.UserProfile))
        self.userProfile.addGestureRecognizer(tap)*/
        
    }

    @IBOutlet weak var profileView: UIImageView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         setUpNavigationBar()
        
        if Constant.isProfileView {
            if(Constant.isLoginView){
                Constant.isLoginView = false
                Constant.isProfileView = false
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "ProfileViewController")as! ProfileViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
  
    func setUpNavigationBar(){
        

        UINavigationBar.appearance().backgroundColor = hexColor.navigationBarColor // backgorund color with gradient
        // or
        UINavigationBar.appearance().barTintColor =  hexColor.navigationBarColor  // solid color
            
        UIBarButtonItem.appearance().tintColor = hexColor.navigationBarColor
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.red]
        UITabBar.appearance().barTintColor = .red
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor =  hexColor.navigationBarColor
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
        self.navigationController?.navigationBar.barTintColor = hexColor.navigationBarColor

        navigationBtn()
    }
    
    func navigationBtn(){
        let buttonLeft = UIButton(type: .custom)
        buttonLeft.setImage(UIImage (named: "menu"), for: .normal)
        buttonLeft.frame = CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0)
        buttonLeft.addTarget(self, action: #selector(menuClick), for: .touchUpInside)

        let barButtonItemLeft = UIBarButtonItem(customView: buttonLeft)
       
        
    
        if revealViewController() != nil {
            self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
            barButtonItemLeft.target = self
            barButtonItemLeft.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
        //view.addGestureRecognizer(revealViewController().panGestureRecognizer())
       // view.addGestureRecognizer(revealViewController().tapGestureRecognizer())

        let buttonLeft2 = UIButton(type: .custom)
        buttonLeft2.setImage(UIImage (named: "top_logo"), for: .normal)
        buttonLeft2.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        buttonLeft2.addTarget(self, action: #selector(menuClick), for: .touchUpInside)
        let barButtonItemLeft2 = UIBarButtonItem(customView: buttonLeft2)
        
        
        self.navigationItem.leftBarButtonItems = [barButtonItemLeft, barButtonItemLeft2]

        
  

        let button2 = UIButton(type: .custom)
        button2.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        button2.setImage(UIImage (named: "search"), for: .normal)
        button2.addTarget(self, action: #selector(menuClick), for: .touchUpInside)
        let barButtonItem2 = UIBarButtonItem(customView: button2)
        
        let button3 = UIButton(type: .custom)
        button3.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        button3.setImage(UIImage (named: (LocalizationSystem.sharedInstance.getLanguage() == "ar") ? "name":"en"), for: .normal)
     //   button3.addTarget(self, action: #selector(fbButtonPressed2), for: .touchUpInside)
        let barButtonItem3 = UIBarButtonItem(customView: button3)
        
        self.navigationItem.rightBarButtonItems = [barButtonItem3,barButtonItem2]
        
        
    }
    
    @objc func menuClick()
    {
        self.revealViewController().revealToggle(self)
    }
    
    
    @IBAction func backBtn(_ sender: Any) {

       /* let firstVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
        let rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SWRevealViewController")

        let navigationController = UINavigationController()
           navigationController.viewControllers = [firstVC]
         UIApplication.shared.keyWindow?.rootViewController = navigationController
         UIApplication.shared.keyWindow?.rootViewController = rootVC*/
        
        self.dismiss(animated: true)
    }
    
    
    @objc func UserProfile()
    {
   
        if(UserDefaults.standard.isLoggedIn()){
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "ProfileViewController")as! ProfileViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            Constant.isProfileView = true
            showAlertLogin(requestView: "DashboardViewController", withMessage: "You need to login to view profile", completionHandler: {_ in
                
            })
        }
    
        
     }
}
extension DonationDetailsViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
      
            return donationModelList.count
      
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
     
            let cell = donationDetailsCV.dequeueReusableCell(withReuseIdentifier: "DonationDetailsCell", for: indexPath) as? DonationDetailsCell
        
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            cell?.layer.cornerRadius = 5
            cell?.layer.borderWidth = 0.3
            cell?.layer.borderColor = UIColor.lightGray.cgColor
            cell?.layer.backgroundColor = UIColor.white.cgColor
            cell?.layer.shadowColor = UIColor.lightGray.cgColor
            cell?.layer.shadowOffset = CGSize(width: 0.1, height: 0.2)
            cell?.layer.shadowRadius = 2.0
            cell?.layer.shadowOpacity = 1.0
            cell?.layer.masksToBounds = false
        
            cell?.donationId.text = "\(donationModelList[indexPath.row].id)"
            cell?.donationType.text = "\(donationModelList[indexPath.row].orderType ?? "")"
            cell?.donationDate.text = "\(donationModelList[indexPath.row].createdDate ?? "")"
            cell?.donationAmount.text = "\(donationModelList[indexPath.row].amount ?? 0)"
            cell?.invoice.text = "\(donationModelList[indexPath.row].orderID ?? 0)"
            cell?.status.text = "\(donationModelList[indexPath.row].status ?? "")"
            cell?.donateIDLblHeading.text = "معرّف التبرع"
            cell?.DonationStatusHeadingLbl.text = "حالة التبرع"
            cell?.donationDateHeadingLbl.text = "تاريخ التبرع"
            cell?.DonationAmountHeadingLbl.text = "مبلغ التبرع"
            cell?.DonationInvoiceHeadingLbl.text = "فاتورة"
            cell?.DonationTypeHeadingLbl.text = "نوع التبرع"
            
            
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            cell?.layer.cornerRadius = 5
            cell?.layer.borderWidth = 0.3
            cell?.layer.borderColor = UIColor.lightGray.cgColor
            cell?.layer.backgroundColor = UIColor.white.cgColor
            cell?.layer.shadowColor = UIColor.lightGray.cgColor
            cell?.layer.shadowOffset = CGSize(width: 0.1, height: 0.2)
            cell?.layer.shadowRadius = 2.0
            cell?.layer.shadowOpacity = 1.0
            cell?.layer.masksToBounds = false
        
            cell?.donationId.text = "\(donationModelList[indexPath.row].id)"
            cell?.donationType.text = "\(donationModelList[indexPath.row].orderType ?? "")"
            cell?.donationDate.text = "\(donationModelList[indexPath.row].createdDate ?? "")"
            cell?.donationAmount.text = "\(donationModelList[indexPath.row].amount ?? 0)"
            cell?.invoice.text = "\(donationModelList[indexPath.row].orderID ?? 0)"
            cell?.status.text = "\(donationModelList[indexPath.row].status ?? "")"
            
            cell?.donateIDLblHeading.text = "Donation Id"
            cell?.DonationStatusHeadingLbl.text = "Donation Status"
            cell?.donationDateHeadingLbl.text = "Donation Date"
            cell?.DonationAmountHeadingLbl.text = "Donation Amount"
            cell?.DonationInvoiceHeadingLbl.text = "Invoice"
            cell?.DonationTypeHeadingLbl.text = "Donation Type"
        }
            
            return cell!
       
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        if(collectionView == self.donationDetailsCV) {
        }
    }


    

}
