//
//  BasketScreenAssembler.swift
//  GBShop
//
//  Created by macbook on 24.07.2021.
//

import UIKit

class BasketScreenAssembler {
    func assemble() -> BasketScreenViewController {
        let storyboard = UIStoryboard(name: "BasketScreen", bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "BasketScreenViewController")
                as? BasketScreenViewController else { return BasketScreenViewController() }

        let presenter = BasketScreenPresenter(view: viewController)
        let interactor = BasketScreenInteractor(presenter: presenter)
        let router = BasketScreenRouter(viewController: viewController)
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router

        return viewController
    }
}
