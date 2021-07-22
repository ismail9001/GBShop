//
//  RegistrationScreenAssembler.swift
//  GBShop
//
//  Created by macbook on 11.07.2021.
//

import UIKit

class RegistrationScreenAssembler {
    func assemble() -> RegistrationScreenViewController {
        let storyboard = UIStoryboard(name: "RegistrationScreen", bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(
                withIdentifier: "RegistrationScreenViewController") as?
                RegistrationScreenViewController else { return RegistrationScreenViewController() }

        let presenter = RegistrationScreenPresenter(view: viewController)
        let interactor = RegistrationScreenInteractor(presenter: presenter)
        let router = RegistrationScreenRouter(viewController: viewController)
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router

        return viewController
    }
}
