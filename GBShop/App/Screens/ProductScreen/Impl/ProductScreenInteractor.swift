//
//  ProductScreenInteractor.swift
//  GBShop
//
//  Created by macbook on 17.07.2021.
//

protocol ProductScreenInteractorProtocol: class {
    func getProductById(productId: Int, completion: @escaping (ProductDetailResult) -> Void)
}

class ProductScreenInteractor: ProductScreenInteractorProtocol {
    
    weak var presenter: ProductScreenPresenterProtocol!
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
}
