//
//  LoginScreenRouter.swift
//  GBShop
//
//  Created by macbook on 11.07.2021.
//

import UIKit

protocol LoginScreenRouterProtocol: class {
    func openProfileScreen(of user: UserData)
    func openRegisterScreen()
}

class LoginScreenRouter: LoginScreenRouterProtocol {

    weak var viewController: LoginScreenViewController!

    init(viewController: LoginScreenViewController) {
        self.viewController = viewController
    }

    func openProfileScreen(of user: UserData) {
        DispatchQueue.main.async {
            let viewController = ProfileScreenAssembler().assemble(user: user)
            self.viewController.show(viewController, sender: nil)
        }
    }

    func openRegisterScreen() {
        let viewController = RegistrationScreenAssembler().assemble()
        self.viewController.show(viewController, sender: nil)
    }
}
