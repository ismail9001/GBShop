//
//  LoginScreenAssembler.swift
//  GBShop
//
//  Created by macbook on 11.07.2021.
//

import UIKit

class LoginScreenAssembler {
    func assemble() -> LoginScreenViewController {
        let storyboard = UIStoryboard(name: "LoginScreen", bundle: Bundle.main)
        // swiftlint:disable force_cast
        let viewController = storyboard.instantiateViewController(withIdentifier: "LoginScreenViewController") as! LoginScreenViewController
        // swiftlint:enable force_cast

        let presenter = LoginScreenPresenter(view: viewController)
        let interactor = LoginScreenInteractor(presenter: presenter)
        let router = LoginScreenRouter(viewController: viewController)
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router

        return viewController
    }
}
