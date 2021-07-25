//
//  MainTabBarViewController.swift
//  GBShop
//
//  Created by macbook on 14.07.2021.
//

import UIKit

class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    deinit {
        let newNotificationRecieve = Notification.Name("newGoodRecieve")
        NotificationCenter.default.removeObserver(self, name: newNotificationRecieve, object: nil)
    }
    
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
        
        let basketScreen = BasketScreenAssembler().assemble()
        let basketImage = UIImage(systemName: "cart")
        basketScreen.tabBarItem = UITabBarItem(title: "Корзина", image: basketImage, tag: 1)
        
        let profileScreen = ProfileScreenAssembler().assemble()
        let profileImage = UIImage(systemName: "person")
        profileScreen.tabBarItem = UITabBarItem(title: "Профиль", image: profileImage, tag: 2)
        
        self.viewControllers = [catalogNavigator, basketScreen, profileScreen]
        
        observeNotifications()
    }
    
    func observeNotifications() {
        let newNotificationRecieve = Notification.Name("newGoodRecieve")
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateTabBarBasketGoods),
                                               name: newNotificationRecieve, object: nil)
    }
    
    @objc func updateTabBarBasketGoods() {
        DispatchQueue.main.async {
            let tabBarController = self
            guard let tabItem = tabBarController.tabBar.items?[1] else { return }
            tabItem.badgeColor = .magenta
            guard let basketCount = UserDefaultsWrapper.userInfo()?.basket?.count else { return }
            switch basketCount {
            case 1...99:
                tabItem.badgeValue = "\(basketCount)"
            case 100...:
                tabItem.badgeValue = "99+"
            default:
                tabItem.badgeValue = nil
            }
        }
    }
}
