//
//  Model.swift
//  Tafakul
//
//  Created by apple on 12/01/23.
//

import Foundation

struct Result: Codable{
    let data: [ResultItem]
}

struct ResultItem: Codable{
    let title:String
}
