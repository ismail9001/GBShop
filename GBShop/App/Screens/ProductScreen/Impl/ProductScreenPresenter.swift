//
//  ProductScreenPresenter.swift
//  GBShop
//
//  Created by macbook on 17.07.2021.
//

import UIKit
import FirebaseAnalytics

protocol ProductScreenPresenterProtocol: AnyObject {
    func addToBasket(product: ProductShortResult)
    func getProductById(productId: Int, completion: @escaping (ProductDetailResult) -> Void)
    func openFeedbackScreen()
}

class ProductScreenPresenter: ProductScreenPresenterProtocol {
    
    weak var view: ProductScreenViewControllerProtocol?
    var router: ProductScreenRouterProtocol?
    var interactor: ProductScreenInteractorProtocol?
    
    required init(view: ProductScreenViewControllerProtocol) {
        self.view = view
    }
    
    func getProductById(productId: Int, completion: @escaping (ProductDetailResult) -> Void) {
        interactor?.getProductById(productId: productId) { product in
            DispatchQueue.main.async {
                completion(product)
            }
        }
    }
    
    func openFeedbackScreen() {
        router?.openFeedBackScreen()
    }
    
    func addToBasket(product: ProductShortResult) {
        interactor?.addToBasket(productId: product.productId) { result in
            let title = result ? "Успешно" : "Ошибка"
            let value = result ? "товар добавлен в корзину" : "товар не удалось поместить в корзину"
            DispatchQueue.main.async {
                self.view?.hideActivityIndicator()
                self.view?.showAlert(value: value, title: title)
            }
            if result {
                self.addToUserBasket(product: product)
            }
        }
    }
    
    func addToUserBasket(product: ProductShortResult) {
        guard let savedUser = UserDefaultsWrapper.userInfo() else { return }
        var user = savedUser
        if user.basket != nil {
            user.basket?.append(product)
            let newNotificationRecieve = Notification.Name("newGoodRecieve")
            NotificationCenter.default.post(name: newNotificationRecieve, object: nil)
            Analytics.logEvent(AnalyticsEventAddToCart, parameters: [
                AnalyticsParameterItemID: "id-\(product.productId)",
                AnalyticsParameterItemName: "\(product.productName)",
              AnalyticsParameterContentType: "cont"
            ])
        } else {
            user.basket = [product]
        }
        
        UserDefaultsWrapper.saveUserInfo(user: user)
    }
}
