//
//  SliderModel.swift
//  Tafakul
//
//  Created by Tariqul on 26/9/22.
//

import Foundation
struct SliderModel: Codable {
    let status: String
    let data: [SliderDataModel]
}

// MARK: - Datum
struct SliderDataModel: Codable {
    let id: Int
    let image: String
    let  titleEn, descriptionEn: String
    let titleAr, descriptionAr, donationID: String

    enum CodingKeys: String, CodingKey {
        case id, image
       // case createdAt = "created_at"
       // case updatedAt = "updated_at"
        case titleEn = "title_en"
        case descriptionEn = "description_en"
        case titleAr = "title_ar"
        case descriptionAr = "description_ar"
        case donationID = "donation_id"
    }
}
