//
//  ProductScreenPresenter.swift
//  GBShop
//
//  Created by macbook on 17.07.2021.
//

import  UIKit

protocol ProductScreenPresenterProtocol: class {
    func getProductById(productId: Int, completion: @escaping (ProductDetailResult) -> Void)
    func openFeedbackScreen()
}

class ProductScreenPresenter: ProductScreenPresenterProtocol {
    
    weak var view: ProductScreenViewControllerProtocol!
    var router: ProductScreenRouterProtocol!
    var interactor: ProductScreenInteractorProtocol!
    
    required init(view: ProductScreenViewControllerProtocol) {
        self.view = view
    }
    
    func getProductById(productId: Int, completion: @escaping (ProductDetailResult) -> Void) {
        interactor.getProductById(productId: productId) { product in
            DispatchQueue.main.async {
                completion(product)
            }
        }
    }
    
    func openFeedbackScreen() {
        router.openFeedBackScreen()
    }
}
