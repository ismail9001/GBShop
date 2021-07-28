//
//  CatalogScreenPresenter.swift
//  GBShop
//
//  Created by macbook on 14.07.2021.
//

import UIKit
import FirebaseAnalytics

protocol CatalogScreenPresenterProtocol: AnyObject {
    func getCatalog(pageNumber: Int, categoryId: Int, completion: @escaping ([ProductShortResult]) -> Void)
    func openProductScreen(product: ProductShortResult)
}

class CatalogScreenPresenter: CatalogScreenPresenterProtocol {
    
    weak var view: CatalogScreenViewControllerProtocol?
    var router: CatalogScreenRouterProtocol?
    var interactor: CatalogScreenInteractorProtocol?
    
    required init(view: CatalogScreenViewControllerProtocol) {
        self.view = view
    }
    
    func getCatalog(pageNumber: Int, categoryId: Int, completion: @escaping ([ProductShortResult]) -> Void) {
        view?.showActivityIndicator()
        interactor?.getCatalog(pageNumber: pageNumber, categoryId: categoryId) { catalog in
            DispatchQueue.main.async {
                self.view?.hideActivityIndicator()
                completion(catalog)
            }
        }
    }
    
    func openProductScreen(product: ProductShortResult) {
        Analytics.logEvent(AnalyticsEventViewItem, parameters: [
            AnalyticsParameterItemID: "id-\(product.productId)",
            AnalyticsParameterItemName: "\(product.productName)",
          AnalyticsParameterContentType: "cont"
        ])
        router?.openProductScreen(product: product)
    }
}
