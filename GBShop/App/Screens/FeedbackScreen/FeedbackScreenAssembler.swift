//
//  FeedbackScreenAssembler.swift
//  GBShop
//
//  Created by macbook on 18.07.2021.
//

import UIKit

class FeedbackScreenAssembler {
    func assemble() -> FeedbackScreenViewController {
        let storyboard = UIStoryboard(name: "FeedbackScreen", bundle: Bundle.main)
        // swiftlint:disable force_cast
        let viewController = storyboard.instantiateViewController(withIdentifier: "FeedbackScreenViewController") as! FeedbackScreenViewController
        // swiftlint:enable force_cast

        let presenter = FeedbackScreenPresenter(view: viewController)
        let interactor = FeedbackScreenInteractor(presenter: presenter)
        let router = FeedbackScreenRouter(viewController: viewController)
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router

        return viewController
    }
}
