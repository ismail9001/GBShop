//
//  FeedbackScreenPresenter.swift
//  GBShop
//
//  Created by macbook on 18.07.2021.
//

import  UIKit

protocol FeedbackScreenPresenterProtocol: AnyObject {
    func getFeedbacks(completion: @escaping ([FeedBackResult]) -> Void)
}

class FeedbackScreenPresenter: FeedbackScreenPresenterProtocol {
    
    weak var view: FeedbackScreenViewControllerProtocol?
    var router: FeedbackScreenRouterProtocol?
    var interactor: FeedbackScreenInteractorProtocol?
    
    required init(view: FeedbackScreenViewControllerProtocol) {
        self.view = view
    }
    
    func getFeedbacks(completion: @escaping ([FeedBackResult]) -> Void) {
        interactor?.getFeedbacks { feedbacks in
            DispatchQueue.main.async {
                completion(feedbacks)
            }
        }
    }
}
