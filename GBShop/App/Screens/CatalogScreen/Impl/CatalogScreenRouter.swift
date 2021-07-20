//
//  CatalogScreenRouter.swift
//  GBShop
//
//  Created by macbook on 14.07.2021.
//

protocol CatalogScreenRouterProtocol: AnyObject {
    func openProductScreen(productId: Int)
}

class CatalogScreenRouter: CatalogScreenRouterProtocol {

    weak var viewController: CatalogScreenViewController!

    init(viewController: CatalogScreenViewController) {
        self.viewController = viewController
    }
    
    func openProductScreen(productId: Int) {
        let viewController = ProductScreenAssembler().assemble(productId: productId)
        self.viewController.show(viewController, sender: nil)
    }
}
