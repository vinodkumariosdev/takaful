//
//  DonationDetailsModel.swift
//  Tafakul
//
//  Created by Tariqul Islam on 16/10/22.
//

import Foundation
struct DonationDetailsModel: Codable {
    let message, status: String
    let data: [DonationDetailsDataModel]
}

// MARK: - Datum
struct DonationDetailsDataModel: Codable {
    let id, userID: Int
    let causeID: Int?
    let orderType: String?
    let orderPeriod: String?
    let orderID, amount: Int?
    let currency, response: String?
    let responseAPI: String?
    let status, createdDate: String?

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case causeID = "cause_id"
        case orderType = "order_type"
        case orderPeriod = "order_period"
        case orderID = "order_id"
        case amount, currency, response
        case responseAPI = "response_api"
        case status
        case createdDate = "created_date"
    }
}
