//
//  GetFeedbacksResult.swift
//  GBShop
//
//  Created by macbook on 04.07.2021.
//

import Foundation

struct GetFeedbacksResult :Codable {
    let feedbacks: [FeedBackResult]
    let pageNumber: Int
    let result: Int
    
    enum CodingKeys: String, CodingKey {
        case feedbacks = "feedbacks"
        case pageNumber = "page_number"
        case result = "result"
    }
}
