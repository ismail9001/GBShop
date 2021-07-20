//
//  GetFeedbacksInfo.swift
//  GBShop
//
//  Created by macbook on 04.07.2021.
//

import Alamofire

class GetFeedbacksInfo: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = Config.url

    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension GetFeedbacksInfo: GetFeedbacksRequestFactory {
    func getFeedbacks(pageNumber: Int,
                      productId: Int,
                      completionHandler: @escaping (AFDataResponse<GetFeedbacksResult>) -> Void) {
        let requestModel = GetFeedbacksData(baseUrl: baseUrl, pageNumber: pageNumber, productId: productId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension GetFeedbacksInfo {
    struct GetFeedbacksData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "getFeedbacks"
        let pageNumber: Int
        let productId: Int
        var parameters: Parameters? {
            return [
                "page_number": pageNumber,
                "product_id": productId
            ]
        }
    }
}
