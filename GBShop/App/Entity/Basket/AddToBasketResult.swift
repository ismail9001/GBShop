//
//  AddToBasketResult.swift
//  GBShop
//
//  Created by macbook on 10.07.2021.
//

struct AddToBasketResult: Codable {
    let result: Int
    let errorMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case errorMessage =  "error_message"
    }
}
