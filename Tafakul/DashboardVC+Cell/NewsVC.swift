//
//  NewsVC.swift
//  Tafakul
//
//  Created by apple on 21/12/22.
//

import UIKit
import Alamofire
import Kingfisher

class NewsVC: UIViewController
{

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var newsLbl: UILabel!
    
    @IBOutlet weak var newsTB: UITableView!
    
    @IBOutlet weak var newsTxtLbl: UILabel!
    
    var newsData = [[String:Any]]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        newsTB.delegate = self
        newsTB.dataSource = self
        self.getNews()
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            newsLbl.text = "أخبار"
            newsTxtLbl.text = "أخبار"
            backBtn.setImage(UIImage.init(named: "ArabicBackIcon"), for: .normal)
            
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            newsLbl.text = "News"
            backBtn.setImage(UIImage.init(named: "BackButton"), for: .normal)
            newsTxtLbl.text = "News"
        }
    }
    
    
    func getNews(){
        self.loadinHubShow()
        if Reachability.isConnectedToNetwork(){
            AF.request("https://takafulsuhar.om/api/news?api_token=WNi3oumvqu8ADhvWLqhPN18FhGplwwYgVYuWaHfrFInZcgI2J7o0obuWIIO5", method: .get, encoding: JSONEncoding.default)
                .responseJSON { [self] response in
                        switch response.result {
                        case .success(let json):
                            let response = json as! [String:AnyObject]
                            self.newsData.removeAll()
                            if let data = response["data"] as? [[String:Any]]{
                                self.newsData = data
                            }
                            DispatchQueue.main.async {
                                self.loadinHubDismiss()
                                self.newsTB.reloadData()
                            }
                        case .failure(let error):
                            print(error)
                            let alert = UIAlertController(title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "", comment: ""), message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "Unable To Connect Server", comment: ""), preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "Okay", comment: ""), style: UIAlertAction.Style.default, handler: { action in
                                
                            }))
                            self.present(alert, animated: true, completion: nil)
                        }
                }
        }else{
            let alert = UIAlertController(title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "", comment: ""), message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "Okay", comment: "Please Check Internet Connection"), preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "OK", comment: ""), style: UIAlertAction.Style.default, handler: { action in
            }))
            self.present(alert, animated: true, completion: nil)
        }
       
    }
    

}

extension NewsVC: UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTVCell", for: indexPath) as! NewsTVCell
        let dict = newsData[indexPath.row]
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            cell.nameLbl.text = dict["ar_name"] as? String ?? ""
            cell.descriptionLbl.text = dict["ar_description"] as? String ?? ""
            let image = dict["image"] as! [String:AnyObject]
            let img_url = image["img_url"] as! String
            let url = URL(string: img_url)
            cell.newsImg.kf.setImage(with: url)
            cell.selectionStyle = .none
            
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            cell.nameLbl.text = dict["name"] as? String ?? ""
            cell.descriptionLbl.text = dict["description"] as? String ?? ""
            let image = dict["image"] as! [String:AnyObject]
            let img_url = image["img_url"] as! String
            let url = URL(string: img_url)
            cell.newsImg.kf.setImage(with: url)
            cell.selectionStyle = .none
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "NewsDetailsVC") as! NewsDetailsVC
        vc.modalPresentationStyle = .fullScreen
        let dict = newsData[indexPath.row]
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            vc.namelbl = dict["ar_name"] as? String ?? ""
            vc.descriptionText = dict["ar_description"] as? String ?? ""
            let image = dict["image"] as! [String:AnyObject]
            let img_url = image["img_url"] as! String
            vc.imageUrl = img_url
            self.present(vc, animated: true)
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            vc.namelbl = dict["name"] as? String ?? ""
            vc.descriptionText = dict["description"] as? String ?? ""
            let image = dict["image"] as! [String:AnyObject]
            let img_url = image["img_url"] as! String
            vc.imageUrl = img_url
            self.present(vc, animated: true)
        }
        
       
    }
    
  
}
