//
//  UIViewController+Extention.swift
//  Tafakul
//
//  Created by Tariqul on 2/10/22.
//

import Foundation
import L10n_swift
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

func showToast(message : String, font: UIFont) {

    let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.white
    toastLabel.font = font
    toastLabel.textAlignment = .center;
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 4.0, delay: 1, options: .curveEaseOut, animations: {
         toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
}
    func showAlertLogin(requestView: String, withMessage message:String, completionHandler: @escaping (Bool) -> Void) {
       // var returnData : String = ""
        
    
        let alert = UIAlertController(title: "", message: message.l10n(), preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK".l10n(), style: .default, handler: { action in
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
                vc.requestView = requestView
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated:true, completion:nil)
                completionHandler(true)
            })
           
        let cancel = UIAlertAction(title: "Cancel".l10n(), style: .default, handler: { action in
                    alert.dismiss(animated: true)
                    completionHandler(false)

                })
               alert.addAction(cancel)
               alert.addAction(ok)

               DispatchQueue.main.async(execute: {
                   self.present(alert, animated: true)
               })

         //   return returnData

        }
    
}
