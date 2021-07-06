//
//  DeleteFeedbackInfo.swift
//  GBShop
//
//  Created by macbook on 04.07.2021.
//

import Alamofire

class DeleteFeedbackInfo: AbstractRequestFactory {
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

extension DeleteFeedbackInfo: DeleteFeedbackRequestFactory {
    func deleteFeedback(feedbackId: Int, completionHandler: @escaping (AFDataResponse<DeleteFeedbackResult>) -> Void) {
        let requestModel = DeleteFeedbackData(baseUrl: baseUrl, feedbackId: feedbackId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension DeleteFeedbackInfo {
    struct DeleteFeedbackData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "removeFeedback"
        let feedbackId: Int
        var parameters: Parameters? {
            return [
                "id_comment": feedbackId
            ]
        }
    }
}
