//
//  ProductDetailResult.swift
//  GBShop
//
//  Created by macbook on 26.06.2021.
//

import Foundation

struct ProductDetailResult: Codable {
    let productName: String
    let price: Int
    let description: String

    enum CodingKeys: String, CodingKey {
        case productName = "product_name"
        case price = "product_price"
        case description = "product_description"
    }
}
