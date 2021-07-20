//
//  GetFeedbacksRequestFactory.swift
//  GBShop
//
//  Created by macbook on 04.07.2021.
//

import Foundation
import Alamofire

protocol GetFeedbacksRequestFactory {
    func getFeedbacks(pageNumber: Int,
                      productId: Int,
                      completionHandler: @escaping (AFDataResponse<GetFeedbacksResult>) -> Void)
}
