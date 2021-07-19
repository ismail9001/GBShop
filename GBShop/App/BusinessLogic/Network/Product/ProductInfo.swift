//
//  ProductInfo.swift
//  GBShop
//
//  Created by macbook on 26.06.2021.
//

import Alamofire

class ProductInfo: AbstractRequestFactory {
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

extension ProductInfo: ProductRequestFactory {
    func getProductById(productId: Int, completionHandler: @escaping (AFDataResponse<ProductDetailResult>) -> Void) {
        let requestModel = ProductData(baseUrl: baseUrl, productId: productId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ProductInfo {
    struct ProductData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "getGoodById"
        let productId: Int
        var parameters: Parameters? {
            return [
                "id_product": productId
            ]
        }
    }
}
