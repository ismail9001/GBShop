//
//  PayBasketResult.swift
//  GBShop
//
//  Created by macbook on 10.07.2021.
//

struct PayBasketResult: Codable {
    let result: Int
    let balance: Int?
    let errorMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case balance = "balance"
        case errorMessage =  "error_message"
    }
}
