//
//  MainTabBarControllerAssembler.swift
//  GBShop
//
//  Created by macbook on 18.07.2021.
//

import UIKit

class MainTabBarControllerAssembler {
    func assemble(user: User) -> MainTabBarViewController {
        let viewController = MainTabBarViewController()
        viewController.user = user

        return viewController
    }
}
