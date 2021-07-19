//
//  FeedbackInfo.swift
//  GBShop
//
//  Created by macbook on 04.07.2021.
//

import Alamofire

class AddFeedbackInfo: AbstractRequestFactory {
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

extension AddFeedbackInfo: AddFeedbackRequestFactory {
    func addFeedback(userId: Int, feedbackText: String, completionHandler: @escaping (AFDataResponse<AddFeedbackResult>) -> Void) {
        let requestModel = AddFeedbackData(baseUrl: baseUrl, userId: userId, feedbackText: feedbackText)
        self.request(request: requestModel, completionHandler: completionHandler)
    }

}

extension AddFeedbackInfo {
    struct AddFeedbackData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "addFeedback"
        let userId: Int
        let feedbackText: String
        var parameters: Parameters? {
            return [
                "id_user": userId,
                "text": feedbackText
            ]
        }
    }
}
