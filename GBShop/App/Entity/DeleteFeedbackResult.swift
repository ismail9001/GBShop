//
//  DeleteFeedbackResult.swift
//  GBShop
//
//  Created by macbook on 04.07.2021.
//

struct DeleteFeedbackResult: Codable {
    let result: Int
    let errorMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case errorMessage =  "error_message"
    }
}
