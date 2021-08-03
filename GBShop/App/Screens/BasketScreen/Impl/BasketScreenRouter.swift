//
//  BasketScreenRouter.swift
//  GBShop
//
//  Created by macbook on 24.07.2021.
//

protocol BasketScreenRouterProtocol: AnyObject {
}

class BasketScreenRouter: BasketScreenRouterProtocol {

    weak var viewController: BasketScreenViewController?

    init(viewController: BasketScreenViewController) {
        self.viewController = viewController
    }
}
