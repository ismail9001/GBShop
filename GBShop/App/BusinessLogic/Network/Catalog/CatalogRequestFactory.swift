//
//  CatalogRequestFactory.swift
//  GBShop
//
//  Created by macbook on 26.06.2021.
//

import Foundation
import Alamofire

protocol CatalogRequestFactory {
    func getCatalog(pageNumber: Int, categoryId: Int, completionHandler: @escaping (AFDataResponse<CatalogDataResult>) -> Void)
}
