//
//  NewsV2CollectionViewController.swift
//  Tafakul
//
//  Created by Yousuf A Almawli on 25/02/2024.
//

import UIKit
import Kingfisher
import Alamofire

private let reuseIdentifier = "NewsPostCell"

class NewsV2CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    @IBOutlet var collectonView: UICollectionView!
    

    var newsData = [[String:Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getNews()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.newsData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! NewsPost
        let dict = newsData[indexPath.row]
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            cell.title.text = dict["ar_name"] as? String ?? ""
//            cell.descriptionNews.text = dict["ar_description"] as? String ?? ""
            let image = dict["image"] as! [String:AnyObject]
            let img_url = image["img_url"] as! String
            let url = URL(string: img_url)
//            cell.image.kf.setImage(with: url)
//            cell.selectionStyle = .none
            
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            cell.title.text = dict["name"] as? String ?? ""
//            cell.descriptionNews.text = dict["description"] as? String ?? ""
            let image = dict["image"] as! [String:AnyObject]
            let img_url = image["img_url"] as! String
            let url = URL(string: img_url)
//            cell.image.kf.setImage(with: url)
//            cell.selectionStyle = .none
        }
        
        return cell

    }
    
    func getNews(){
        self.loadinHubShow()
        if Reachability.isConnectedToNetwork(){
            AF.request("http://takafulsuhar.om/api/news?api_token=WNi3oumvqu8ADhvWLqhPN18FhGplwwYgVYuWaHfrFInZcgI2J7o0obuWIIO5", method: .get, encoding: JSONEncoding.default)
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
                                self.collectonView.reloadData()
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
