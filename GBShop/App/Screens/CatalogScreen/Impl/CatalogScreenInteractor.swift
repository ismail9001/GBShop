//
//  CatalogScreenInteractor.swift
//  GBShop
//
//  Created by macbook on 14.07.2021.
//

protocol CatalogScreenInteractorProtocol: AnyObject {
    func getCatalog(pageNumber: Int, categoryId: Int, completion: @escaping ([ProductShortResult]) -> Void)
}

class CatalogScreenInteractor: CatalogScreenInteractorProtocol {

    weak var presenter: CatalogScreenPresenterProtocol?
    let requestFactory = RequestFactory()

    required init(presenter: CatalogScreenPresenterProtocol) {
        self.presenter = presenter
    }
    
    func getCatalog(pageNumber: Int, categoryId: Int, completion: @escaping ([ProductShortResult]) -> Void) {
        let getCatalog = requestFactory.makeGetCatalogRequestFactory()

        getCatalog.getCatalog(pageNumber: pageNumber, categoryId: pageNumber) { response in
            switch response.result {
            case .success(let result):
                completion(result.catalog)
            case .failure(let error):
                completion([])
                print(String(describing: error))
                print(error.localizedDescription)
            }
        }
    }
}
