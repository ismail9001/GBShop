//
//  ProductRequestFactory.swift
//  GBShop
//
//  Created by macbook on 26.06.2021.
//

import Foundation
import Alamofire

protocol ProductRequestFactory {
    func getProductById(productId: Int, completionHandler: @escaping (AFDataResponse<ProductDetailResult>) -> Void)
}
