//
//  CatalogScreenRouter.swift
//  GBShop
//
//  Created by macbook on 14.07.2021.
//

protocol CatalogScreenRouterProtocol: AnyObject {
    func openProductScreen(product: ProductShortResult)
}

class CatalogScreenRouter: CatalogScreenRouterProtocol {

    weak var viewController: CatalogScreenViewController?

    init(viewController: CatalogScreenViewController) {
        self.viewController = viewController
    }
    
    func openProductScreen(product: ProductShortResult) {
        let viewController = ProductScreenAssembler().assemble(product: product)
        self.viewController?.show(viewController, sender: nil)
    }
}
