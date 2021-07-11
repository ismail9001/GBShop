//
//  Catalog.swift
//  GBShop
//
//  Created by macbook on 26.06.2021.
//

import Alamofire

class Catalog: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = Config.url

    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension Catalog: CatalogRequestFactory {
    func getCatalog(pageNumber: Int, categoryId: Int, completionHandler: @escaping (AFDataResponse<CatalogDataResult>) -> Void) {
        let requestModel = CatalogData(baseUrl: baseUrl, pageNumber: pageNumber, categoryId: categoryId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Catalog {
    struct CatalogData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "catalog"
        let pageNumber: Int
        let categoryId: Int
        var parameters: Parameters? {
            return [
                "page_number": pageNumber,
                "id_category": categoryId
            ]
        }
    }
}
