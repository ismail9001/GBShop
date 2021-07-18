//
//  MainTabBarViewController.swift
//  GBShop
//
//  Created by macbook on 14.07.2021.
//

import UIKit

class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let catalogNavigator = UINavigationController()
        let catalogScreen = CatalogScreenAssembler().assemble()
        let catalogImage = UIImage(systemName: "square.grid.2x2")
        catalogNavigator.viewControllers = [catalogScreen]
        catalogScreen.tabBarItem = UITabBarItem(title: "Каталог", image: catalogImage, tag: 0)
        
        let profileScreen = ProfileScreenAssembler().assemble(user: user)
        let profileImage = UIImage(systemName: "person")
        
        profileScreen.tabBarItem = UITabBarItem(title: "Профиль", image: profileImage, tag: 1)
        self.viewControllers = [catalogNavigator, profileScreen]
    }
}
