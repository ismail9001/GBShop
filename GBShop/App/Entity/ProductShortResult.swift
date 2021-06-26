//
//  ProductShortResult.swift
//  GBShop
//
//  Created by macbook on 26.06.2021.
//

import Foundation

struct ProductShortResult: Codable {
    let id : Int
    let productName: String
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case productName = "product_name"
        case price = "price"
    }
}

