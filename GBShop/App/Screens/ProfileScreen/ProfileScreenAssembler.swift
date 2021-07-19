//
//  ProfileScreenAssembler.swift
//  GBShop
//
//  Created by macbook on 11.07.2021.
//

import UIKit

class ProfileScreenAssembler {
    func assemble(user: UserData) -> ProfileScreenViewController {
        let storyboard = UIStoryboard(name: "ProfileScreen", bundle: Bundle.main)
        // swiftlint:disable force_cast
        let viewController = storyboard.instantiateViewController(withIdentifier: "ProfileScreenViewController") as! ProfileScreenViewController
        // swiftlint:enable force_cast

        let presenter = ProfileScreenPresenter(view: viewController)
        let interactor = ProfileScreenInteractor(presenter: presenter)
        let router = ProfileScreenRouter(viewController: viewController)
        viewController.presenter = presenter
        viewController.user = user
        presenter.interactor = interactor
        presenter.router = router

        return viewController
    }
}
