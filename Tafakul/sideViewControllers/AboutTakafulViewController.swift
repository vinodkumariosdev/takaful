//
//  AboutTakafulViewController.swift
//  Tafakul
//
//  Created by VinodKatta on 06/05/22.
//

import UIKit

class AboutTakafulViewController: UIViewController {

    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var aboutTakafulLbl: UILabel!
    
    @IBOutlet weak var aboutH1Lbl: UILabel!
    @IBOutlet weak var userProfile: UIImageView!
    
    @IBOutlet weak var storyTxtLbl: UILabel!
    
    @IBOutlet weak var whoDescLbl: UILabel!
    
    @IBOutlet weak var whoH2Lbl: UILabel!
    
    @IBOutlet weak var visonHeadLbl: UILabel!
    @IBOutlet weak var missionStrengthLbl: UILabel!
    
    @IBOutlet weak var missionHeadLbl: UILabel!
    
    @IBOutlet weak var visonDescLbl: UILabel!
    
    @IBOutlet weak var objectHeadLbl: UILabel!
    
    @IBOutlet weak var pioneerDescLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            aboutH1Lbl.text = "عن فريق تكافل صحار"
            aboutTakafulLbl.text = "عن فريق تكافل صحار"
            backBtn.setImage(UIImage.init(named: "ArabicBackIcon"), for: .normal)
            storyTxtLbl.text =  "من حكاية مجتمع يشد بعضه البعض كالبنيان المرصوص، بدأت فصول فريق تكافل الخيري الاجتماعي عام￼￼ 2012 من بوابة التطوع رافعين شعار تكافلنا طريق سعادتنا ليكبر الحلم لواقع أجمل كأول فريق خيري يعمل تحت مظلة لجنة التنمية الاجتماعية بصحار، ليسند البنيان طوبة طوبة ويكمل الصورة الناقصة عظم الشعور بالمسؤولية، وبمساندة أياد خيرها لا ينضب علا البنيان واكتملت الصورة وتوسعت آفاق العمل لتشمل جوانب وقطاعات مختلفة من أوجه الخير تهدف لتمكين المعوزين ذاتيا وتوفير الحياة الكريمة لهم عبر مشاريع تنموية مستدامة في قطاعات الصحة، التعليم والرعاية الاجتماعية لمجتمع أكثر سعادة وعطاء ومحبة."
            whoH2Lbl.text = "من نحن"
            whoDescLbl.text = "تكافل صحار ، فريق خيري رائد في ولاية صحار يقدم خدمات خيرية إنسانية اجتماعية مستدامة وموثوقة للفئات المستحقة وفق قيم الشفافية، الإخلاص والعدالة الإنسانية لضمان الحياة الكريمة لجميع فئات المجتمع."
            missionHeadLbl.text = "المهمة"
            missionStrengthLbl.text = " تعزيز مبدأ التكافل الاجتماعي في ولاية صحار بالتعاون مع شركاء العطاء عبر توفير قنوات تبرع موثوقة تهدف لتمكين الفئات المستحقة وفق معايير الشفافية، الابتكار والتنوع."
            visonHeadLbl.text = "الرؤية"
            visonDescLbl.text = "نتطلع لبناء إنسان متمكن فعال منتج متمتع بحياة كريمة وسعيدة."
            objectHeadLbl.text = "الأهداف"
            
            pioneerDescLbl.text = "الريادة في العمل الخيري المؤسسي الاحترافي.\nترسيخ وتعزيز مبادئ التكافل الاجتماعي عبر التطوع في برامج الفريق واستثمار طاقات الشباب.\nتقديم برامج ومشاريع مستدامة تقضي لبناء إنسان مكتفي ذاتيا يعيش حياة كريمة وفق أسس ودراسات ممنهجة.\nتفعيل الشراكات الاستراتيجية مع المؤسسات الحكومية والخاصة .\nقياس الأثر الاجتماعي لمساهمات الأفراد والشركات لضمان فاعليته.\nتحقيق التميز والابتكار في الأداء وتطوير الكفاءات البشرية في الفريق."
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            aboutH1Lbl.text = "About Takaful"
            aboutTakafulLbl.text = "About Takaful"
            storyTxtLbl.text = "From the story of a community that pulls each other together like a solid structure, the chapters of the Sohar Takaful Social Charitable Team started in 2012 from the volunteer portal, raising the slogan of our solidarity through our happiness to grow the dream to a more beautiful reality as a charitable team working under the umbrella of the Social Development Committee in Sohar, to support the structure brick by brick and complete the missing picture. The sense of responsibility has grown, and with the support of the hands of its inexhaustible benevolence, the structure is complete, and the horizons of work have expanded to include various aspects and sectors of charitable aspects aimed at empowering the needy and providing them with a decent life through sustainable development projects for a happier, giving and loving society"
            whoH2Lbl.text = "Who We Are"
            whoDescLbl.text = "Takaful, a leading charitable team in Sohar that provides sustainable and reliable social, humanitarian and charitable services to the deserving groups in accordance with the values of transparency, sincerity and human justice to ensure a decent life for all segments of society"
            missionHeadLbl.text = "The Mission"
            missionStrengthLbl.text = "Strengthening the principle of social solidarity in the state of Sohar in cooperation with giving partners by providing reliable donation channels aimed at empowering eligible groups according to standards of transparency, innovation and diversity."
            visonHeadLbl.text = "Vision"
            visonDescLbl.text = "Pioneering the provision of charitable services and social programs that enhance community solidarity in the state"
            backBtn.setImage(UIImage.init(named: "BackButton"), for: .normal)
            objectHeadLbl.text = "Objectives"
            pioneerDescLbl.text = " Pioneering professional institutional charitable work\n Pioneering professional institutional charitable work\n Pioneering professional institutional charitable work\n Pioneering professional institutional charitable work\n Providing and developing voluntary programs concerned with the social aspect\n Providing and developing voluntary programs concerned with the social aspect.\n Achieving excellence and innovation in performance and developing human competencies in the team"
        }
        self.userProfile.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.UserProfile))
        self.userProfile.addGestureRecognizer(tap)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpNavigationBar()
       /* if Constant.isProfileView {
            if(Constant.isLoginView){
                Constant.isLoginView = false
                Constant.isProfileView = false
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "ProfileViewController")as! ProfileViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }*/
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true)
       /* let firstVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
        let rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SWRevealViewController")
        let navigationController = UINavigationController()
           navigationController.viewControllers = [firstVC]
         UIApplication.shared.keyWindow?.rootViewController = navigationController
         UIApplication.shared.keyWindow?.rootViewController = rootVC*/
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


        let buttonLeft2 = UIButton(type: .custom)
        buttonLeft2.setImage(UIImage (named: "top_logo"), for: .normal)
        buttonLeft2.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        buttonLeft2.addTarget(self, action: #selector(fbButtonPressed1), for: .touchUpInside)
        let barButtonItemLeft2 = UIBarButtonItem(customView: buttonLeft2)
        
        
        self.navigationItem.leftBarButtonItems = [barButtonItemLeft, barButtonItemLeft2]


        let button2 = UIButton(type: .custom)
        button2.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        button2.setImage(UIImage (named: "search"), for: .normal)
        button2.addTarget(self, action: #selector(fbButtonPressed1), for: .touchUpInside)
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
    
    @objc func fbButtonPressed() {

           print("Share to fb")
       }
    
    @objc func fbButtonPressed1() {

           print("Share to fb")
       }
   
    @IBAction func instagramClick(_ sender: Any) {
        openInstagramApp()
    }
    @IBAction func tweterClick(_ sender: Any) {
        twitter()
    }
    @IBAction func youTubeClick(_ sender: Any) {
        playInYoutube(youtubeId: "channel/UCdlvl8pOmkW3YdK8Dv4Hq5A")
    }
    
    func openInstagramApp(){
        
        let Username =  "takaful_suhar" // Your Instagram Username here
        let appURL = URL(string: "instagram://user?username=\(Username)")!
        let application = UIApplication.shared

        if application.canOpenURL(appURL) {
            application.open(appURL)
        } else {
            // if Instagram app is not installed, open URL inside Safari
            let webURL = URL(string: "https://instagram.com/\(Username)")!
            application.open(webURL)
        }
            
    }
    func openTwitterApp(){
        
        let Username =  "takaful_suhar" // Your Instagram Username here
        let appURL = URL(string: "instagram://user?username=\(Username)")!
        let application = UIApplication.shared

        if application.canOpenURL(appURL) {
            application.open(appURL)
        } else {
            // if Instagram app is not installed, open URL inside Safari
            let webURL = URL(string: "https://instagram.com/\(Username)")!
            application.open(webURL)
        }
            
    }

    func twitter() {
     
    
        let screenName =  "takaful_suhar"
          let appURL = NSURL(string: "twitter://user?screen_name=\(screenName)")!
          let webURL = NSURL(string: "https://twitter.com/\(screenName)")!

          let application = UIApplication.shared

          if application.canOpenURL(appURL as URL) {
               application.open(appURL as URL)
          } else {
               application.open(webURL as URL)
          }
     
    }
    
    func playInYoutube(youtubeId: String) {
        if let youtubeURL = URL(string: "youtube://\(youtubeId)"),
            UIApplication.shared.canOpenURL(youtubeURL) {
            // redirect to app
            UIApplication.shared.open(youtubeURL, options: [:], completionHandler: nil)
        } else if let youtubeURL = URL(string: "https://www.youtube.com/\(youtubeId)") {
            // redirect through safari
            UIApplication.shared.open(youtubeURL, options: [:], completionHandler: nil)
        }
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
