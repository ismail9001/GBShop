//
//  FeedbackResult.swift
//  GBShop
//
//  Created by macbook on 04.07.2021.
//

import Foundation

struct FeedBackResult: Codable {
    let feedbackId: Int
    let text: String
    let userId: Int

    enum CodingKeys: String, CodingKey {
        case feedbackId = "id_feedback"
        case text = "text"
        case userId = "user_id"
    }
}
