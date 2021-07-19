//
//  CatalogScreenPresenter.swift
//  GBShop
//
//  Created by macbook on 14.07.2021.
//

import  UIKit

protocol CatalogScreenPresenterProtocol: class {
    func getCatalog(pageNumber: Int, categoryId: Int, completion: @escaping ([ProductShortResult]) -> Void)
}

class CatalogScreenPresenter: CatalogScreenPresenterProtocol {
    
    weak var view: CatalogScreenViewControllerProtocol!
    var router: CatalogScreenRouterProtocol!
    var interactor: CatalogScreenInteractorProtocol!
    
    required init(view: CatalogScreenViewControllerProtocol) {
        self.view = view
    }
    
    func getCatalog(pageNumber: Int, categoryId: Int, completion: @escaping ([ProductShortResult]) -> Void) {
        view.showActivityIndicator()
        self.interactor.getCatalog(pageNumber: pageNumber, categoryId: categoryId) { catalog in
            DispatchQueue.main.async {
                self.view.hideActivityIndicator()
                completion(catalog)
            }
        }
    }
}