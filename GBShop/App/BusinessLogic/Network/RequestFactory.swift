//
//  RequestFactory.swift
//  GBShop
//
//  Created by macbook on 22.06.2021.
//

import Alamofire

class RequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAuthRequestFatory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeLogoutRequestFactory() -> LogoutRequestFactory {
        let errorParser = makeErrorParser()
        return Exit(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeRegistrationRequestFactory() -> RegistrationRequestFactory {
        let errorParser = makeErrorParser()
        return Registration(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeUserUpdateRequestFactory() -> UserUpdateRequestFactory {
        let errorParser = makeErrorParser()
        return UserUpdate(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeGetCatalogRequestFactory() -> CatalogRequestFactory {
        let errorParser = makeErrorParser()
        return Catalog(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeGetProductByIdRequestFactory() -> ProductRequestFactory {
        let errorParser = makeErrorParser()
        return ProductInfo(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeGetFeedbacksRequestFactory() -> GetFeedbacksRequestFactory {
        let errorParser = makeErrorParser()
        return GetFeedbacksInfo(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeAddFeedbackRequestFactory() -> AddFeedbackRequestFactory {
        let errorParser = makeErrorParser()
        return AddFeedbackInfo(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeDeleteFeedbackRequestFactory() -> DeleteFeedbackRequestFactory {
        let errorParser = makeErrorParser()
        return DeleteFeedbackInfo(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeAddToBasketRequestFactory() -> AddToBasketRequestFactory {
        let errorParser = makeErrorParser()
        return AddToBasket(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeDeleteFromBasketRequestFactory() -> DeleteFromBasketRequestFactory {
        let errorParser = makeErrorParser()
        return DeleteFromBasket(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makePayBasketRequestFactory() -> PayBasketRequestFactory {
        let errorParser = makeErrorParser()
        return PayBasket(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
}
