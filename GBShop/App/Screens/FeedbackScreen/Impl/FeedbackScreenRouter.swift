//
//  FeedbackScreenRouter.swift
//  GBShop
//
//  Created by macbook on 18.07.2021.
//

protocol FeedbackScreenRouterProtocol: AnyObject {
}

class FeedbackScreenRouter: FeedbackScreenRouterProtocol {

    weak var viewController: FeedbackScreenViewController!

    init(viewController: FeedbackScreenViewController) {
        self.viewController = viewController
    }
}
