//
//  ProfileScreenRouter.swift
//  GBShop
//
//  Created by macbook on 11.07.2021.
//

protocol ProfileScreenRouterProtocol: class {
}

class ProfileScreenRouter: ProfileScreenRouterProtocol {

    weak var viewController: ProfileScreenViewController!

    init(viewController: ProfileScreenViewController) {
        self.viewController = viewController
    }
}
