//
//  PaymentWebView.swift
//  Tafakul
//
//  Created by Tariqul Islam on 28/6/22.
//

import UIKit
import WebKit
import Foundation // or UIKit

class PaymentWebView: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    
    var webView: WKWebView!
    
    //var activityIndicator: UIActivityIndicatorView!
    var activity = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
    var webViewObserver: NSKeyValueObservation?

    var donationAmount: String = ""
    var donationType: String?
    var categoryId: Int?
   // var myURL = URL(string: "https://takafulsuhar.om")

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(UserDefaults.standard.isLoggedIn()){
           
            print("donation \(donationAmount)  \(donationType)")
            DispatchQueue.main.async {
                
                var myURL = URL(string:  (LocalizationSystem.sharedInstance.getLanguage() == "ar") ? "https://takafulsuhar.om/mobile/ar/donation-cart/\(self.categoryId ?? 71)?donation_amt=\(self.donationAmount.replacingOccurrences(of: " \(Constant.paymentMethod)", with: ""))&uid=\(UserDefaults.standard.getUserID())":"https://takafulsuhar.om/mobile/en/donation-cart/\(self.categoryId ?? 71)?donation_amt=\(self.donationAmount.replacingOccurrences(of: " \(Constant.paymentMethod)", with: ""))&uid=\(UserDefaults.standard.getUserID())")
                
                let myRequest = URLRequest(url: myURL!)
                self.webView.load(myRequest)
            }
           


            setNavigationBar()
            
            
            activity = UIActivityIndicatorView()
            activity.center = self.view.center
            activity.hidesWhenStopped = true
            activity.style = .medium
            view.addSubview(activity)
            
            
            webViewObserver = webView?.observe(\.url, options: .new, changeHandler: {
                   (currentWebView, _) in
                   //      Here you go the new path
                
                   
                if currentWebView.url?.absoluteString.contains("payment-success") == true{
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                   
                        self.dismiss(animated: true,completion: nil)
                    }
                }
                print("calling currentWebView   \(currentWebView.url)")
               })
        }else{
            showAlertLogin(requestView: "DashboardViewController", withMessage: "You need to login to complete payment"){isSuccess in
                if !isSuccess {
                    self.dismiss(animated: true,completion: nil)
                }
            }
        }
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        webViewObserver?.invalidate()
    }
    
    func showActivityIndicator(show: Bool) {
        if show {
            DispatchQueue.main.async {
                self.activity.startAnimating()
            }

        } else {
            DispatchQueue.main.async {
                self.activity.stopAnimating()
             }
            
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("calling didFinish")
        showActivityIndicator(show: false)
    }
    

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("calling didFail")

        showActivityIndicator(show: false)
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!){
        print("calling didStartProvisionalNavigation")

    }
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        print("calling didReceiveServerRedirectForProvisionalNavigation")

        if let url = webView.url?.absoluteString{
            print("url = \(url)")
        }
    }
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Swift.Void) {
        print("calling decidePolicyFor")

            if(navigationAction.navigationType == .other) {
                if let redirectedUrl = navigationAction.request.url {
                    //do what you need with url
                   ///  self.delegate?.openURL(url: redirectedUrl)
                }
                decisionHandler(.cancel)
                return
            }
            decisionHandler(.allow)
        }

    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        print("calling createWebViewWith")

            if navigationAction.targetFrame == nil {
             //   webView.load(navigationAction.request)
            }
            return nil
        }
    
    override func loadView() {
        
        let preferences = WKWebpagePreferences()
            preferences.allowsContentJavaScript = true
            let configuration = WKWebViewConfiguration()
            configuration.defaultWebpagePreferences = preferences
     //   let webConfiguration = WKWebViewConfiguration()
        configuration.dataDetectorTypes = [.all]
        webView = WKWebView(frame: .zero, configuration: configuration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.isUserInteractionEnabled = true
        webView.allowsLinkPreview = false
        view = webView
        
    }
    
    
    func setNavigationBar()
    
    {
        
        let screenSize: CGRect = UIScreen.main.bounds
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 50))
        view.backgroundColor = hexColor.navigationBarColor
        
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 50, width: screenSize.width, height: 50))
        let navItem = UINavigationItem(title: "Takaful")
        
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.backgroundColor = hexColor.navigationBarColor
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
        navBar.backgroundColor = hexColor.navigationBarColor
        
        
        let buttonLeft2 = UIButton(type: .custom)
        buttonLeft2.setImage(UIImage (named: "back"), for: .normal)
        buttonLeft2.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        buttonLeft2.addTarget(self, action: #selector(done), for: .touchUpInside)
        let barButtonItemLeft2 = UIBarButtonItem(customView: buttonLeft2)
        
        navItem.leftBarButtonItem = barButtonItemLeft2
        navBar.setItems([navItem], animated: false)
        
        self.view.addSubview(view)
        self.view.addSubview(navBar)
    }
    @objc func done() { // remove @objc for Swift 3
        print("done")
        self.dismiss(animated: true,completion: nil)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        print("backBtn")
        self.dismiss(animated: true,completion: nil)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
}
