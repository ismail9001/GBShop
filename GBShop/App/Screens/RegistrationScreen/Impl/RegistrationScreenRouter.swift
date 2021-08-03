//
//  RegistrationScreenRouter.swift
//  GBShop
//
//  Created by macbook on 11.07.2021.
//

import UIKit

protocol RegistrationScreenRouterProtocol: AnyObject {
    func openLoginScreen()
    func openCatalogScreen()
}

class RegistrationScreenRouter: RegistrationScreenRouterProtocol {
    weak var viewController: RegistrationScreenViewController!

    init(viewController: RegistrationScreenViewController) {
        self.viewController = viewController
    }
    
    func openCatalogScreen() {
        guard let window = UIApplication.shared.currentWindow else { return }
        let viewController = MainTabBarControllerAssembler().assemble()
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }

    func openLoginScreen() {
        viewController.navigationController?.popToRootViewController(animated: true)
    }
}
