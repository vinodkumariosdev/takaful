//
//  NewsVC.swift
//  Tafakul
//
//  Created by apple on 21/12/22.
//

import UIKit
import Alamofire
import Kingfisher
private let reuseIdentifier = "NewsPostCell"

class NewsVC: UIViewController
{
//
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var newsLbl: UILabel!
    
    @IBOutlet weak var newsGridView: UICollectionView!
//    @IBOutlet weak var newsTB: UITableView!
//    
//    
    var newsData = [[String:Any]]()
//    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        newsGridView.delegate = self
        newsGridView.dataSource = self
        backBtn.isHidden = true
        self.getNews()
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            newsLbl.text = "أخبار"
            backBtn.setImage(UIImage.init(named: "ArabicBackIcon"), for: .normal)
            
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            newsLbl.text = "News"
            backBtn.setImage(UIImage.init(named: "BackButton"), for: .normal)
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
                                self.newsGridView.reloadData()
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
//
extension NewsVC: UICollectionViewDelegate, UICollectionViewDataSource
{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.newsData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! NewsPost
        let dict = newsData[indexPath.row]
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            cell.title.text =  dict["ar_name"] as? String ?? ""
//            cell.descriptionNews.text =  "اقرأ المزيد"
            let image = dict["image"] as! [String:AnyObject]
            let img_url = image["img_url"] as! String
            let url = URL(string: img_url)
            cell.image.kf.setImage(with: url)
            
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            cell.title.text = dict["name"] as? String ?? ""
//            cell.descriptionNews.text = "Read More"
            let image = dict["image"] as! [String:AnyObject]
            let img_url = image["img_url"] as! String
            let url = URL(string: img_url)
            cell.image.kf.setImage(with: url)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
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

class NewsPost: UICollectionViewCell {
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
//    @IBOutlet weak var descriptionNews: UILabel!
    
    override func awakeFromNib() {
        background.layer.cornerRadius = 10
        background.layer.borderWidth = 1
        background.layer.borderColor = UIColor.gray.cgColor
        image.layer.cornerRadius = 10
    }
}
