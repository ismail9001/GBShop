//
//  CatalogScreenPresenter.swift
//  GBShop
//
//  Created by macbook on 14.07.2021.
//

import  UIKit

protocol CatalogScreenPresenterProtocol: class {
    func getCatalog(completion: @escaping ([ProductShortResult]) -> Void)
}

class CatalogScreenPresenter: CatalogScreenPresenterProtocol {
    
    weak var view: CatalogScreenViewControllerProtocol!
    var router: CatalogScreenRouterProtocol!
    var interactor: CatalogScreenInteractorProtocol!
    
    required init(view: CatalogScreenViewControllerProtocol) {
        self.view = view
    }
    
    func getCatalog(completion: @escaping ([ProductShortResult]) -> Void) {
        self.interactor.getCatalog() { catalog in
            DispatchQueue.main.async {
                completion(catalog)
            }
        }
    }
}
