//
//  RegistrationScreenRouter.swift
//  GBShop
//
//  Created by macbook on 11.07.2021.
//

import UIKit

protocol RegistrationScreenRouterProtocol: class {
    func openProfileScreen(of user: UserData)
    func openLoginScreen()
}

class RegistrationScreenRouter: RegistrationScreenRouterProtocol {

    weak var viewController: RegistrationScreenViewController!

    init(viewController: RegistrationScreenViewController) {
        self.viewController = viewController
    }

    func openProfileScreen(of user: UserData) {
        DispatchQueue.main.async {
            let vc = ProfileScreenAssembler().assemble(user: user)
            self.viewController.show(vc, sender: nil)
        }
    }

    func openLoginScreen() {
        viewController.navigationController?.popToRootViewController(animated: true)
    }
}
