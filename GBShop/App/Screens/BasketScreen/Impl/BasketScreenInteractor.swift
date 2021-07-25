//
//  BasketScreenInteractor.swift
//  GBShop
//
//  Created by macbook on 24.07.2021.
//

protocol BasketScreenInteractorProtocol: AnyObject {
    func payBasket(basketId: Int, completion: @escaping (Bool) -> Void)
}

class BasketScreenInteractor: BasketScreenInteractorProtocol {
    
    weak var presenter: BasketScreenPresenterProtocol?
    let requestFactory = RequestFactory()

    required init(presenter: BasketScreenPresenterProtocol) {
        self.presenter = presenter
    }
    
    func payBasket(basketId: Int, completion: @escaping (Bool) -> Void) {
        let payBasketRequest = requestFactory.makePayBasketRequestFactory()
        payBasketRequest.payBasket(basketId: basketId) { response in
            switch response.result {
            case .success:
                completion(true)
            case .failure(let error):
                print(String(describing: error))
                print(error.localizedDescription)
                completion(false)
            }
        }
    }
}
