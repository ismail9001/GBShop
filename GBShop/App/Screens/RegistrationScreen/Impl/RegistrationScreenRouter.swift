//
//  RegistrationScreenRouter.swift
//  GBShop
//
//  Created by macbook on 11.07.2021.
//

import UIKit

protocol RegistrationScreenRouterProtocol: class {
    func openProfileScreen(of user: User)
    func openLoginScreen()
}

class RegistrationScreenRouter: RegistrationScreenRouterProtocol {
    weak var viewController: RegistrationScreenViewController!

    init(viewController: RegistrationScreenViewController) {
        self.viewController = viewController
    }

    func openProfileScreen(of user: User) {
        DispatchQueue.main.async {
            let viewController = ProfileScreenAssembler().assemble(user: user)
            self.viewController.show(viewController, sender: nil)
        }
    }

    func openLoginScreen() {
        viewController.navigationController?.popToRootViewController(animated: true)
    }
}
