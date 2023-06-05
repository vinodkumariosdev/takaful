//
//  ProfileController.swift
//  Tafakul
//
//  Created by Tariqul on 5/10/22.
//

import Foundation
extension ProfileViewController{
    func useProfileData(completion: @escaping ([UserProfileData]) -> Void) {

        NetworkManager.shared.dataTaskWithGetRequest(urlrequest: "https://takafulsuhar.om/api/get-user?api_token=WNi3oumvqu8ADhvWLqhPN18FhGplwwYgVYuWaHfrFInZcgI2J7o0obuWIIO5&user_id=\(UserDefaults.standard.getUserID())") { (result, status) in
            DispatchQueue.main.async {
                print("status:   useProfileData \(status) \(result)")

                if status{
                    let response = result.dictionaryObject!
                    do {
                        
               
                        let json = try JSONSerialization.data(withJSONObject: response)
                        let decoder = JSONDecoder()
                       // decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let decodedSlider = try decoder.decode(UserProfileModel.self, from: json)
                    //    self.userProfile = decodedSlider.data
                        print("decodedSlider:    \(decodedSlider.data.count)")

                        completion(decodedSlider.data)
                        
                    } catch {
                        print("error:    \(error)")
                        completion([])

                    }
                    
                    //we can parse this response same as 'getWebserviceCall' response
                }}}}
    
    func useProfileUpdate(name: String,email:String, phone:String,city:String, country:String, completion: @escaping (UserProfileUpdateModel) -> Void) {

        let url = "https://takafulsuhar.om/api/update-user?name=\(name)&email=\(email)&phone=\(phone)&state=&api_token=WNi3oumvqu8ADhvWLqhPN18FhGplwwYgVYuWaHfrFInZcgI2J7o0obuWIIO5&city=\(city)&country=\(country)&zipcode=krjf&address=Main%20Road&id=\(UserDefaults.standard.getUserID())"
        NetworkManager.shared.dataTaskWithGetRequest(urlrequest: url.replacingOccurrences(of: " ", with: "%20")) { (result, status) in
            DispatchQueue.main.async {
                print("status:   useProfileData \(status) \(result)")

                if status{
                    let response = result.dictionaryObject!
                    do {
                        
               
                        let json = try JSONSerialization.data(withJSONObject: response)
                        let decoder = JSONDecoder()
                       // decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let decodedSlider = try decoder.decode(UserProfileUpdateModel.self, from: json)
                    //    self.userProfile = decodedSlider.data
                       // print("decodedSlider:    \(decodedSlider.data.count)")

                        completion(decodedSlider)
                        
                    } catch {
                        print("error:    \(error)")
                        completion(UserProfileUpdateModel(message: "", status: ""))

                    }
                    
                    //we can parse this response same as 'getWebserviceCall' response
                }}}}
}
