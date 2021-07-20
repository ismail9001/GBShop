//
//  AddToBasketRequestFactory.swift
//  GBShop
//
//  Created by macbook on 10.07.2021.
//

import Foundation
import Alamofire

protocol AddToBasketRequestFactory {
    func addToBasket(productId: Int,
                     quantity: Int,
                     completionHandler: @escaping (AFDataResponse<AddToBasketResult>) -> Void)
}
