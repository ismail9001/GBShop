//
//  DeleteFromBasketRequestFactory.swift
//  GBShop
//
//  Created by macbook on 10.07.2021.
//

import Alamofire

protocol DeleteFromBasketRequestFactory {
    func deleteFromBasket(productId: Int, completionHandler: @escaping (AFDataResponse<DeleteFromBasketResult>) -> Void)
}
