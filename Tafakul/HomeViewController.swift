//
//  HomeViewController.swift
//  Tafakul
//
//  Created by apple on 21/12/22.
//

import UIKit

class HomeViewController: UITabBarController,UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            self.tabBar.items?[2].selectedImage = UIImage(named: "quick_donation_arabic")?.withRenderingMode(.alwaysOriginal)
            self.tabBar.items?[2].image = UIImage(named: "quick_donation_arabic")?.withRenderingMode(.alwaysOriginal)
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            self.tabBar.items?[2].selectedImage = UIImage(named: "quick_donation_eng")?.withRenderingMode(.alwaysOriginal)
            self.tabBar.items?[2].image = UIImage(named: "quick_donation_eng")?.withRenderingMode(.alwaysOriginal)
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {

            let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController)!
            if selectedIndex == 0 {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }
        }
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
      // you need a reference to your nav controller
      if let navController = tabBarController.selectedViewController as? UINavigationController {
        navController.popToRootViewController(animated: false)
      }

      return true
    }

}
