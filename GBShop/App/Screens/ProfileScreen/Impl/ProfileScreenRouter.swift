//
//  ProfileScreenRouter.swift
//  GBShop
//
//  Created by macbook on 11.07.2021.
//

import UIKit

protocol ProfileScreenRouterProtocol: AnyObject {
    func openLoginScreen()
}

class ProfileScreenRouter: ProfileScreenRouterProtocol {
    
    weak var viewController: ProfileScreenViewController?
    
    init(viewController: ProfileScreenViewController) {
        self.viewController = viewController
    }
    
    func openLoginScreen() {
        
        let navigator = UINavigationController()
        let viewController = LoginScreenAssembler().assemble()
        navigator.viewControllers = [viewController]
        let window = UIApplication.shared.currentWindow
        window?.rootViewController = navigator
        window?.makeKeyAndVisible()
    }
}
