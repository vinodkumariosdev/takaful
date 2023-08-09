//
//  DashboardViewController.swift
//  Tafakul
//
//  Created by VinodKatta on 22/04/22.
//

import UIKit
import Kingfisher
import L10n_swift


class DashboardViewController: UIViewController, SWRevealViewControllerDelegate {
   
    let numberOfCellsPerRow: CGFloat = 4
    var sliderModelList = [SliderDataModel]()

    
    @IBOutlet weak var collectionViewMenu: UICollectionView!
    
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    //    @IBOutlet weak var barBtnAction: UIBarButtonItem!{
//        didSet{
//            barBtnAction.target = self.revealViewController()
//            barBtnAction.action = #selector(SWRevealViewController.revealToggle(_:))
//        }
//}
    
    @IBOutlet weak var userProfile: UIImageView!
    @IBOutlet weak var publicSadaqatView: UIView!
    
    @IBOutlet weak var foodBasketView: UIView!
    
    @IBOutlet weak var clothingView: UIView!
    
    @IBOutlet weak var ExpiationView: UIView!
    
  //  @IBOutlet weak var moreView: UIView!
    
    
    
    var items = ["Daily Sadaqa".l10n(), "Friday Charity".l10n(), "Next door neighbor".l10n(), "Distress Relife".l10n(),"Give Gift".l10n()]
    
    
    
    var menuImage: [UIImage?] = [
        UIImage(named: "sadqa"),
        UIImage(named: "friday_charity"),
        UIImage(named: "neighbor"),
        UIImage(named: "detress"),
        UIImage(named: "gift")
      ]
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        sliderWebserviceCall()
            { response in
                self.sliderModelList = response
                self.sliderCollectionView.reloadData()
                // Do your stuff here
                print("Returned String Data is: \(response.count)")
            }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

        if Constant.isLoginView {
            if(Constant.isProfileView){
                Constant.isLoginView = false
                Constant.isProfileView = false
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "ProfileViewController")as! ProfileViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
            if(Constant.isDonationDetailsView){
                Constant.isDonationDetailsView = false
                Constant.isLoginView = false
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "DonationDetailsViewController")as! DonationDetailsViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
     
        
        //setUpNavigationBar()
        
        let buttonLeft = UIButton(type: .custom)
        buttonLeft.setImage(UIImage (named: "menu"), for: .normal)
        buttonLeft.frame = CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0)
        buttonLeft.addTarget(self, action: #selector(menuClick), for: .touchUpInside)

        let barButtonItemLeft = UIBarButtonItem(customView: buttonLeft)
       
        
    
//        if revealViewController() != nil {
//            self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
//            barButtonItemLeft.target = self
//            barButtonItemLeft.action = #selector(SWRevealViewController.revealToggle(_:))
//            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
//
//        }
        
        //view.addGestureRecognizer(revealViewController().panGestureRecognizer())
       // view.addGestureRecognizer(revealViewController().tapGestureRecognizer())

        let buttonLeft2 = UIButton(type: .custom)
        buttonLeft2.setImage(UIImage (named: "top_logo"), for: .normal)
        buttonLeft2.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        buttonLeft2.addTarget(self, action: #selector(fbButtonPressed1), for: .touchUpInside)
        let barButtonItemLeft2 = UIBarButtonItem(customView: buttonLeft2)
        
        
        self.navigationItem.leftBarButtonItems = [barButtonItemLeft, barButtonItemLeft2]

        
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0)
        button.setImage(UIImage (named: "web"), for: .normal)
        button.addTarget(self, action: #selector(fbButtonPressed), for: .touchUpInside)
        let barButtonItem = UIBarButtonItem(customView: button)

        let button2 = UIButton(type: .custom)
        button2.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        button2.setImage(UIImage (named: "search"), for: .normal)
        button2.addTarget(self, action: #selector(fbButtonPressed1), for: .touchUpInside)
        let barButtonItem2 = UIBarButtonItem(customView: button2)
        
        let button3 = UIButton(type: .custom)
        button3.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        button3.setImage(UIImage (named: (LocalizationSystem.sharedInstance.getLanguage() == "ar") ? "name":"en"), for: .normal)
        button3.addTarget(self, action: #selector(fbButtonPressed2), for: .touchUpInside)
        let barButtonItem3 = UIBarButtonItem(customView: button3)
        
        self.navigationItem.rightBarButtonItems = [barButtonItem3,barButtonItem2,barButtonItem]
        
        
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        //self.moreView.addGestureRecognizer(gesture)
        
        let gesture2 = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction2))
        self.publicSadaqatView.addGestureRecognizer(gesture2)
        
        let gesture3 = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction3))
        self.foodBasketView.addGestureRecognizer(gesture3)
        
        let gesture4 = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction4))
        self.clothingView.addGestureRecognizer(gesture4)
        
        let gesture5 = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction5))
        self.ExpiationView.addGestureRecognizer(gesture5)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.UserProfile))
        self.userProfile.addGestureRecognizer(tap)
        self.userProfile.isUserInteractionEnabled = true
    }
    @objc func menuClick()
    {
        print("menuClick")
        self.revealViewController().revealToggle(self)
    }
    
    @objc func UserProfile()
    {
        
        print("menuClick UserProfile")

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
    @objc func fbButtonPressed()
       {
           if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
               LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
              UIView.appearance().semanticContentAttribute = .forceLeftToRight
               L10n.shared.language = "en"
           } else {
               LocalizationSystem.sharedInstance.setLanguage(languageCode: "ar")
               UIView.appearance().semanticContentAttribute = .forceLeftToRight
               L10n.shared.language = "ar"


           }
      
           
           let vc1 = self.storyboard?.instantiateViewController(identifier: "SWRevealViewController") as! SWRevealViewController
           vc1.modalPresentationStyle = .fullScreen
           self.present(vc1, animated: true, completion: nil)
           
           
//
//           let firstVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
//           let rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SWRevealViewController")
//
//           let navigationController = UINavigationController()
//              navigationController.viewControllers = [firstVC]
//            UIApplication.shared.keyWindow?.rootViewController = navigationController
//            UIApplication.shared.keyWindow?.rootViewController = rootVC

           
         //  let scene = UIApplication.shared.connectedScenes.first
           
         
       }
    
    @objc func fbButtonPressed1()
       {

           print("Share to fb")
       }
    @objc func fbButtonPressed2()
       {

           print("Share to fb")
       }

    @objc func fbButtonPressed4()
       {

       print ("Share to fb")
           
       }

    @objc func fbButtonPressed5()
       {

           print("Share to fb")
       }

    
    
    @objc func checkAction(sender : UITapGestureRecognizer) {
        let vc = self.storyboard?.instantiateViewController(identifier: "MoreViewController") as! MoreViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func checkAction2(sender : UITapGestureRecognizer) {

        donateNow(requestType: "Public Sadaqa", categoryId: 69)

    }
    
    
    @objc func checkAction3(sender : UITapGestureRecognizer) {
        donateNow(requestType: "Friday Charity", categoryId: 89)

    }
    
    @objc func checkAction4(sender : UITapGestureRecognizer) {

        donateNow(requestType: "Clothing A Poor", categoryId: 71)

    }
    
    @objc func checkAction5(sender : UITapGestureRecognizer) {

        donateNow(requestType: "Expiation for a broken Oath", categoryId: 72)
    }
    
    
    func donateNow(requestType: String, categoryId: Int){
        
        
//        let vc = self.storyboard?.instantiateViewController(identifier: "DailySadaqaValueViewController") as! DailySadaqaValueViewController
//        let navigationController = UINavigationController(rootViewController: vc)
//
//        vc.modalPresentationStyle = .fullScreen
//        vc.requestType = requestType
//      //  self.present(navigationController, animated: true, completion: nil)
//        self.navigationController?.present(navigationController, animated: true, completion: nil)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "DailySadaqaValueViewController")as! DailySadaqaValueViewController
            vc.requestType = requestType
            vc.categoryId = categoryId
        self.navigationController?.pushViewController(vc, animated: true)

    }
    @objc func donateNowbtn(sender : UIButton) {
        donateNow(requestType: (LocalizationSystem.sharedInstance.getLanguage() == "ar") ? sliderModelList[sender.tag].titleAr : sliderModelList[sender.tag].titleEn, categoryId: Int(sliderModelList[sender.tag].donationID ) ?? 0)

        
    }
    
}


extension DashboardViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if(collectionView == self.collectionViewMenu) {
            return items.count
        }else{
            return sliderModelList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if(collectionView == self.collectionViewMenu) {
            
            let cell = collectionViewMenu.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MenuCollectionViewCell
            cell?.menuLbl.text = items[indexPath.row]
            cell?.MenuImageViews.image = menuImage[indexPath.item]
            return cell!
        }else{
            let cell = sliderCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? SliderCollectionViewCell
            //cell?.image.image = menuImage[indexPath.item]
            //cell?.image.kf.setImage(with: "", placeholder: "")
            let url = URL(string: sliderModelList[indexPath.row].image )
            cell?.image.kf.setImage(with: url)
            cell?.donateNow.tag = indexPath.row
            cell?.donateNow.addTarget(self, action: #selector(donateNowbtn), for: .touchUpInside)

            return cell!
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        if(collectionView == self.collectionViewMenu) {
            

            print("Selected Cell: \(indexPath.row)")
            if indexPath.row == 0{

                donateNow(requestType: "Daily Sadaqa", categoryId: 88 )

            }
            if indexPath.row == 1{

                donateNow(requestType: "Friday Charity", categoryId: 89)

            }
            if indexPath.row == 2{

                donateNow(requestType: "Next door neighbor", categoryId: 90)

            }
            if indexPath.row == 3{

                donateNow(requestType: "Distress Relife", categoryId: 91)

            }
            if indexPath.row == 4{
 
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "GiveGiftViewController")as! GiveGiftViewController
                  // vc.requestType = requestType
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }else{
            let cell = sliderCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? SliderCollectionViewCell
            
      //     cell?.donateNow.addTarget(self, action: #selector(donateNow), for: .touchUpInside)

        }
        
  
        
    }
    
    
    
    func setUpNavigationBar(){
        UINavigationBar.appearance().backgroundColor = hexColor.navigationBarColor // backgorund color with gradient
        // or
        UINavigationBar.appearance().barTintColor =  hexColor.navigationBarColor  // solid color
            
        UIBarButtonItem.appearance().tintColor = hexColor.navigationBarColor
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        UITabBar.appearance().barTintColor = .white
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor =  hexColor.navigationBarColor
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
    }
    

    
}




