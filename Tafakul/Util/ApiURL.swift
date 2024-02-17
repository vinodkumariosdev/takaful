//
//  Constant.swift
//  Tafakul
//
//  Created by VinodKatta on 10/05/22.
//

import Foundation


struct APIURL
{
    static let baseUrl = "http://takafulsuhar.om/api/"
    static var login = baseUrl + "login"
    static var phoneLogin = baseUrl + "otp-login-check"
    static var sendOTPphone = baseUrl + "otp-login"
    static var register = baseUrl  + "register"
    static var products = baseUrl + "otp-login-check"
    static var categories = baseUrl + "categories"
    static var addfav = baseUrl + "wishlist"
    static var addcart = baseUrl + "cart"
    static var otp = baseUrl + "otp-login"

}
