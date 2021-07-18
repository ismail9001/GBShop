//
//  ProductScreenAssembler.swift
//  GBShop
//
//  Created by macbook on 17.07.2021.
//

import UIKit

class ProductScreenAssembler {
    func assemble(productId: Int) -> ProductScreenViewController {
        let storyboard = UIStoryboard(name: "ProductScreen", bundle: Bundle.main)
        // swiftlint:disable force_cast
        let viewController = storyboard.instantiateViewController(withIdentifier: "ProductScreenViewController") as! ProductScreenViewController
        // swiftlint:enable force_cast

        let presenter = ProductScreenPresenter(view: viewController)
        let interactor = ProductScreenInteractor(presenter: presenter)
        let router = ProductScreenRouter(viewController: viewController)
        viewController.presenter = presenter
        viewController.productId = productId
        presenter.interactor = interactor
        presenter.router = router

        return viewController
    }
}
