//
//  DeleteFeedBackRequestFactory.swift
//  GBShop
//
//  Created by macbook on 04.07.2021.
//

import Foundation
import Alamofire

protocol DeleteFeedbackRequestFactory {
    func deleteFeedback(feedbackId: Int, completionHandler: @escaping (AFDataResponse<DeleteFeedbackResult>) -> Void)
}
