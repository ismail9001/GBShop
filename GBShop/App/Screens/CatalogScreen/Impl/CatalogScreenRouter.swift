//
//  CatalogScreenRouter.swift
//  GBShop
//
//  Created by macbook on 14.07.2021.
//

protocol CatalogScreenRouterProtocol: class {
}

class CatalogScreenRouter: CatalogScreenRouterProtocol {

    weak var viewController: CatalogScreenViewController!

    init(viewController: CatalogScreenViewController) {
        self.viewController = viewController
    }
}
