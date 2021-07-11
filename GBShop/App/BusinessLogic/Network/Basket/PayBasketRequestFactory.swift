//
//  PayBasketRequestFactory.swift
//  GBShop
//
//  Created by macbook on 10.07.2021.
//

import Foundation
import Alamofire

protocol PayBasketRequestFactory {
    func payBasket(basketId: Int, completionHandler: @escaping (AFDataResponse<PayBasketResult>) -> Void)
}
