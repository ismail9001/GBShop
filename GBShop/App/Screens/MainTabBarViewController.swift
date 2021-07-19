//
//  MainTabBarViewController.swift
//  GBShop
//
//  Created by macbook on 14.07.2021.
//

import UIKit

class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let catalogScreen = CatalogScreenAssembler().assemble()
        let catalogImage = UIImage(systemName: "square.grid.2x2")
        catalogScreen.tabBarItem = UITabBarItem(title: "Каталог", image: catalogImage, tag: 0)
        
        let profileScreen = ProfileScreenAssembler().assemble(user: UserData(username: "Iskander",
                                                                             password: "111111",
                                                                             email: "test@test.ru",
                                                                             gender: "Male",
                                                                             creditCard: "5555-5555-5555-5555",
                                                                             bio: "Im junior swift programmer"))
        let profileImage = UIImage(systemName: "person")
        
        profileScreen.tabBarItem = UITabBarItem(title: "Профиль", image: profileImage, tag: 1)
        self.viewControllers = [catalogScreen, profileScreen]
    }
}
