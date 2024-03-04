//
//  DonationDetailsC.swift
//  Tafakul
//
//  Created by Tariqul on 15/10/22.
//

import Foundation

import Foundation
extension DonationDetailsViewController{
    func getDonationDetails(completion: @escaping ([DonationDetailsDataModel]) -> Void) {

        //Provide your request 'body' here in Dictionary format
        let parameterDictionary = ["api_token": "WNi3oumvqu8ADhvWLqhPN18FhGplwwYgVYuWaHfrFInZcgI2J7o0obuWIIO5"]
        NetworkManager.shared.dataTaskWithPostRequest(urlrequest: "https://takafulsuhar.om/api/get-payment/\(UserDefaults.standard.getUserID())",
                                                      params: parameterDictionary) { (result, status) in
            DispatchQueue.main.async {
                print("status:   getDonationDetails \(status) \(result)")

                if status{
                    let response = result.dictionaryObject!
                    do {
                        
                        let json = try JSONSerialization.data(withJSONObject: response)
                        let decoder = JSONDecoder()
                       // decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let decodedSlider = try decoder.decode(DonationDetailsModel.self, from: json)
                       // self.sliderModelList = decodedSlider.data
                        print("getDonationDetails:    \(decodedSlider.data.count)")

                        completion(decodedSlider.data)
                        
                    } catch {
                        print("error:    \(error)")
                        completion([])

                    }
                    
                    //we can parse this response same as 'getWebserviceCall' response
                }}}}
}
