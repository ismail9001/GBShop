//
//  FeedbackRequestFactory.swift
//  GBShop
//
//  Created by macbook on 04.07.2021.
//

import Foundation
import Alamofire

protocol AddFeedbackRequestFactory {
    func addFeedback(userId: Int, feedbackText: String, completionHandler: @escaping (AFDataResponse<AddFeedbackResult>) -> Void)
}
