//
//  FeedbackResult.swift
//  GBShop
//
//  Created by macbook on 04.07.2021.
//

import Foundation

struct FeedBackResult: Codable {
    let id : Int
    let text: String
    let userId: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id_feedback"
        case text = "text"
        case userId = "user_id"
    }
}
