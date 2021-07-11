//
//  CatalogDataResult.swift
//  GBShop
//
//  Created by macbook on 26.06.2021.
//

import Foundation

struct CatalogDataResult: Codable {
    let catalog: [ProductShortResult]
    let pageNumber: Int

    enum CodingKeys: String, CodingKey {
        case catalog = "catalog"
        case pageNumber = "page_number"
    }

}
