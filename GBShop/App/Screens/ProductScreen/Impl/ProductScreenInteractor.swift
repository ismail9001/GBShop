//
//  ProductScreenInteractor.swift
//  GBShop
//
//  Created by macbook on 17.07.2021.
//

protocol ProductScreenInteractorProtocol: AnyObject {
    func getProductById(productId: Int, completion: @escaping (ProductDetailResult) -> Void)
    func addToBasket(productId: Int, completion: @escaping (Bool) -> Void)
}

class ProductScreenInteractor: ProductScreenInteractorProtocol {
    
    weak var presenter: ProductScreenPresenterProtocol?
    let requestFactory = RequestFactory()

    required init(presenter: ProductScreenPresenterProtocol) {
        self.presenter = presenter
    }
    
    func getProductById(productId: Int, completion: @escaping (ProductDetailResult) -> Void) {
        let getProductById = requestFactory.makeGetProductByIdRequestFactory()

        getProductById.getProductById(productId: productId) { response in
            switch response.result {
            case .success(let result):
                completion(result)
            case .failure(let error):
                print(String(describing: error))
                print(error.localizedDescription)
            }
        }
    }
    func addToBasket(productId: Int, completion: @escaping (Bool) -> Void) {
        let addToBasketRequest = requestFactory.makeAddToBasketRequestFactory()
        addToBasketRequest.addToBasket(productId: productId, quantity: 1) { response in
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
