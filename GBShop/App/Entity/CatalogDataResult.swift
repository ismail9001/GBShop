//
//  CatalogDataResult.swift
//  GBShop
//
//  Created by macbook on 26.06.2021.
//

import Foundation

struct CatalogDataResult :Codable {
    let products: [ProductShortResult]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        products = try container.decode([ProductShortResult].self)
    }
}


