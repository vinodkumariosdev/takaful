//
//  UserProfileModel.swift
//  Takaful
//
//  Created by Tariqul on 5/10/22.
//

import Foundation
struct UserProfileModel: Codable {
    let message: String
    let data: [UserProfileData]
    let status: String
}

// MARK: - Datum
struct UserProfileData: Codable {
    let id: Int
    let name, email, username, emailVerified: String?
    let emailVerifyToken: String?
    let otp, phone, address, state: String?
    let city, zipcode, country, password: String?
    let rememberToken: String?
    let image: String?
    let createdAt, updatedAt: String?
    let facebookID, googleID: String?

    enum CodingKeys: String, CodingKey {
        case id, name, email, username
        case emailVerified = "email_verified"
        case emailVerifyToken = "email_verify_token"
        case otp, phone, address, state, city, zipcode, country, password
        case rememberToken = "remember_token"
        case image
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case facebookID = "facebook_id"
        case googleID = "google_id"
    }
}
