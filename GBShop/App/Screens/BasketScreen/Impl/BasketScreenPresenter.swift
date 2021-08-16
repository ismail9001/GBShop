//
//  BasketScreenPresenter.swift
//  GBShop
//
//  Created by macbook on 24.07.2021.
//

import UIKit
import FirebaseAnalytics

protocol BasketScreenPresenterProtocol: AnyObject {
    func payBasket(basketId: Int)
}

class BasketScreenPresenter: BasketScreenPresenterProtocol {

    weak var view: BasketScreenViewControllerProtocol?
    var router: BasketScreenRouterProtocol?
    var interactor: BasketScreenInteractorProtocol?
    
    required init(view: BasketScreenViewControllerProtocol) {
        self.view = view
    }
    
    func payBasket(basketId: Int) {
        interactor?.payBasket(basketId: basketId) { [self] result in
            DispatchQueue.main.async { [self] in
                view?.hideActivityIndicator()
                if result {
                    Analytics.logEvent(AnalyticsEventPurchase, parameters: [
                        AnalyticsParameterItemName: "cartId - \(basketId)",
                        AnalyticsParameterContentType: "cont"
                    ])
                    view?.showAlert(value: "Оплата произведена успешно", title: "Спасибо за покупку")
                    view?.clearBasket()
                } else {
                    view?.showAlert(value: "Не удалось провести оплату", title: "Ошибка")
                }
            }
        }
    }
}
