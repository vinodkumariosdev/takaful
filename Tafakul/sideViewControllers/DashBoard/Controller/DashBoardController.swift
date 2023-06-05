//
//  DashBoardController.swift
//  Tafakul
//
//  Created by Tariqul on 27/9/22.
//

import Foundation
extension DashboardViewController{
    func sliderWebserviceCall(completion: @escaping ([SliderDataModel]) -> Void) {

        //Provide your request 'body' here in Dictionary format
        let parameterDictionary = ["api_token": "WNi3oumvqu8ADhvWLqhPN18FhGplwwYgVYuWaHfrFInZcgI2J7o0obuWIIO5"]
        NetworkManager.shared.dataTaskWithPostRequest(urlrequest: "https://www.takafulsuhar.om/api/slider",
                                                      params: parameterDictionary) { (result, status) in
            DispatchQueue.main.async {
                print("status:   sliderWebserviceCall \(status) \(result)")

                if status{
                    let response = result.dictionaryObject!
                    do {
                        
               
                        let json = try JSONSerialization.data(withJSONObject: response)
                        let decoder = JSONDecoder()
                       // decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let decodedSlider = try decoder.decode(SliderModel.self, from: json)
                        self.sliderModelList = decodedSlider.data
                        print("decodedSlider:    \(decodedSlider.data.count)")

                        completion(decodedSlider.data)
                        
                    } catch {
                        print("error:    \(error)")
                        completion([])

                    }
                    
                    //we can parse this response same as 'getWebserviceCall' response
                }}}}
}
