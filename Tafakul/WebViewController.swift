//
//  WebViewController.swift
//  Tafakul
//
//  Created by apple on 23/12/22.
//

import UIKit
import WebKit
var isbackCart:String!

class WebViewController: UIViewController,WKNavigationDelegate {

    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var loadingVieww: UIView!
    
    var userid:String!
    
    var cartID:Int!
    
    var amount:String!
    
    var webviewBlock:Double!
    
    var area:String = ""
    
    
    var giftMessage = ""
    var giftName = ""
    var giftPhone = ""
    
    
    @IBOutlet weak var donationDetailsLbl: UILabel!
    
    @IBOutlet weak var webVieww: WKWebView!
    
    @IBOutlet weak var loadingImg: UIImageView!
    
    var Activity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(amount == "" || amount == "0") {
            amount = "1"
        }
        let numberStr: String = amount
        let formatter: NumberFormatter = NumberFormatter()
        formatter.locale = NSLocale(localeIdentifier: "EN") as Locale?
        let final = formatter.number(from: numberStr)
//        let doubleNumber = Double(final!)
        amount = final?.stringValue

        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            donationDetailsLbl.text = "تفاصيل التبرع"
            userid = UserDefaults.standard.string(forKey: "id")
            backBtn.setImage(UIImage.init(named: "ArabicBackIcon"), for: .normal)
            loadingVieww.isHidden = true
            let jeremyGif = UIImage.gifImageWithName("load-loading (1)")
            let imageView = UIImageView(image: jeremyGif)
            imageView.frame = CGRect(x: 160.0, y: 270.0, width: 60, height: 60)
            loadingVieww.addSubview(imageView)
            if userid == nil{
                self.backBtn.addTarget(self, action: #selector(back), for: .touchUpInside)
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "PhoneSignUpViewController") as! PhoneSignUpViewController
                UserDefaults.standard.removeObject(forKey: "id")
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }else{
                self.backBtn.addTarget(self, action: #selector(back), for: .touchUpInside)
                
                var urlStr = "http://takafulsuhar.om/mobile/ar/donation-cart/\(cartID!)?donation_amt=\(amount!)&uid=\(userid!)"
                if self.area != "" {
                    urlStr = urlStr + "&area=\(self.area)"
                }

                if self.giftMessage != "" {
                    urlStr = urlStr + "&isGift=true&name=\(self.giftName)&number=\(self.giftPhone)&hide=\(true)&msg=\(self.giftMessage)"
                }
                
                urlStr = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!

                let url = URL(string: urlStr)
                print(urlStr)
                let requestObj = URLRequest(url: url! as URL)
                webVieww.load(requestObj)
                webVieww.allowsBackForwardNavigationGestures = true
                webVieww.navigationDelegate = self
            }
        }else{
            donationDetailsLbl.text = "Donation"
            backBtn.setImage(UIImage.init(named: "BackButton"), for: .normal)
            userid = UserDefaults.standard.string(forKey: "id")
            loadingVieww.isHidden = true
            let jeremyGif = UIImage.gifImageWithName("load-loading (1)")
            let imageView = UIImageView(image: jeremyGif)
            imageView.frame = CGRect(x: 160.0, y: 270.0, width: 60, height: 60)
            loadingVieww.addSubview(imageView)
            if userid == nil{
                self.backBtn.addTarget(self, action: #selector(back), for: .touchUpInside)
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "PhoneSignUpViewController") as! PhoneSignUpViewController
                UserDefaults.standard.removeObject(forKey: "id")
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }else{
                self.backBtn.addTarget(self, action: #selector(back), for: .touchUpInside)
                
                var urlStr = "http://takafulsuhar.om/mobile/en/donation-cart/\(cartID!)?donation_amt=\(amount!)&uid=\(userid!)"
                if self.area != "" {
                    urlStr = urlStr + "&area=\(self.area)"
                }
                if self.giftMessage != "" {
                    urlStr = urlStr + "&isGift=true&name=\(self.giftName)&number=\(self.giftPhone)&hide=\(true)&msg=\(self.giftMessage)"
                }
                

                urlStr = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
                print(urlStr)
                let url = URL(string: urlStr)

                
                let requestObj = URLRequest(url: url! as URL)
                webVieww.load(requestObj)
                webVieww.allowsBackForwardNavigationGestures = true
                webVieww.navigationDelegate = self

//                webVieww.addObserver(self, forKeyPath: #keyPath(WKWebView.title), options: .new, context: nil)
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        isbackCart = "backCart"
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    if keyPath == "title" {
            title = webVieww.title
        if title == "Takaful"{
            loadingVieww.isHidden = true
            self.webVieww.isHidden = false
        }
        
        if title == ""{
            self.webVieww.isHidden = true
            loadingVieww.isHidden = false
        }
        
        if title == "checkout"{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.loadingVieww.isHidden = true
                self.webVieww.isHidden = false
            }
        }
        
        }
    }
    
    @objc func back(){
        self.dismiss(animated: true)
        self.amount = ""
    }
    

    func webViewDidStartLoad(_ : WKWebView) {
        self.loadinHubShow()
    }

    func webViewDidFinishLoad(_ : WKWebView) {
        self.loadinHubDismiss()
    }
    
    
func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if navigationAction.navigationType == .linkActivated  {
            if let url = navigationAction.request.url,
                UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url)
                    decisionHandler(.cancel)
            } else {
                // Open in web view
                decisionHandler(.allow)
            }
        } else {
            // other navigation type, such as reload, back or forward buttons
            decisionHandler(.allow)
        }
    }


}


