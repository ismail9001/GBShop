//
//  LoginScreenRouter.swift
//  GBShop
//
//  Created by macbook on 11.07.2021.
//

import UIKit

protocol LoginScreenRouterProtocol: AnyObject {
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
            if let window = UIApplication.shared.currentWindow {
                let viewController = MainTabBarViewController()
                window.rootViewController = viewController
                window.makeKeyAndVisible()
            }
        }
    }

    func openRegisterScreen() {
        let viewController = RegistrationScreenAssembler().assemble()
        self.viewController.show(viewController, sender: nil)
    }
}
