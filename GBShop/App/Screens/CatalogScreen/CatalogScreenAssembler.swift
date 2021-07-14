//
//  CatalogScreenAssembler.swift
//  GBShop
//
//  Created by macbook on 14.07.2021.
//

import UIKit

class CatalogScreenAssembler {
    func assemble() -> CatalogScreenViewController {
        let storyboard = UIStoryboard(name: "CatalogScreen", bundle: Bundle.main)
        // swiftlint:disable force_cast
        let viewController = storyboard.instantiateViewController(withIdentifier: "CatalogScreenViewController") as! CatalogScreenViewController
        // swiftlint:enable force_cast

        let presenter = CatalogScreenPresenter(view: viewController)
        let interactor = CatalogScreenInteractor(presenter: presenter)
        let router = CatalogScreenRouter(viewController: viewController)
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router

        return viewController
    }
}
