//
//  ProductScreenRouter.swift
//  GBShop
//
//  Created by macbook on 17.07.2021.
//

protocol ProductScreenRouterProtocol: AnyObject {
    func openFeedBackScreen()
}

class ProductScreenRouter: ProductScreenRouterProtocol {
    
    weak var viewController: ProductScreenViewController!
    
    init(viewController: ProductScreenViewController) {
        self.viewController = viewController
    }
    
    func openFeedBackScreen() {
        let viewController = FeedbackScreenAssembler().assemble()
        self.viewController.show(viewController, sender: nil)
    }
}
