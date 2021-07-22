//
//  FeedbackScreenInteractor.swift
//  GBShop
//
//  Created by macbook on 18.07.2021.
//

protocol FeedbackScreenInteractorProtocol: AnyObject {
    func getFeedbacks(completion: @escaping ([FeedBackResult]) -> Void)
}

class FeedbackScreenInteractor: FeedbackScreenInteractorProtocol {
    
    weak var presenter: FeedbackScreenPresenterProtocol?
    let requestFactory = RequestFactory()

    required init(presenter: FeedbackScreenPresenterProtocol) {
        self.presenter = presenter
    }
    
    func getFeedbacks(completion: @escaping ([FeedBackResult]) -> Void) {
        let getFeedbacksRequest = requestFactory.makeGetFeedbacksRequestFactory()
        getFeedbacksRequest.getFeedbacks(pageNumber: 1, productId: 123) { response in
            switch response.result {
            case .success(let result):
                completion(result.feedbacks)
            case .failure(let error):
                print(String(describing: error))
                print(error.localizedDescription)
            }
        }
    }
}
