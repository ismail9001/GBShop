//
//  ViewController.swift
//  GBShop
//
//  Created by macbook on 20.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let requestFactory = RequestFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        deleteFeedback()
        getFeedbacks()
        addFeedback()
        getCatalog()
        registration()
        updateUser()
        auth()
        getProductByID()
        addToBasket()
        deleteFromBasket()
        payBasket()
    }
    
    func registration() {
        let registration = requestFactory.makeRegistrationRequestFactory()
        
        registration.register(userId: 123, username: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
            switch response.result {
            case .success(let result):
                print (result)
            case .failure(let error):
                print(String(describing: error))
                print(error.localizedDescription)
            }
        }
    }
    
    func updateUser() {
        let updateUser = requestFactory.makeUserUpdateRequestFactory()
        
        updateUser.updateUser(userId: 123, username: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
            switch response.result {
            case .success(let result):
                print (result)
            case .failure(let error):
                print(String(describing: error))
                print(error.localizedDescription)
            }
        }
    }
    
    func auth() {
        let auth = requestFactory.makeAuthRequestFatory()
        let exit = requestFactory.makeLogoutRequestFactory()
        
        auth.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                print(login)
                exit.logout(userId: 123) { response in
                    switch response.result {
                    case .success(let result):
                        print(result)
                    case .failure(let error):
                        print(error.localizedDescription)
                        print(String(describing: error))
                    }
                }
            case .failure(let error):
                print(String(describing: error))
                print(error.localizedDescription)
            }
        }
    }
    
    func getCatalog() {
        
        let getCatalog = requestFactory.makeGetCatalogRequestFactory()
        
        getCatalog.getCatalog(pageNumber: 1, categoryId: 1) { response in
            switch response.result {
            case .success(let result):
                print (result)
            case .failure(let error):
                print(String(describing: error))
                print(error.localizedDescription)
            }
        }
    }
    
    func getProductByID() {
        
        let getProductById = requestFactory.makeGetProductByIdRequestFactory()
        
        getProductById.getProductById(productId: 123) { response in
            switch response.result {
            case .success(let result):
                print (result)
            case .failure(let error):
                print(String(describing: error))
                print(error.localizedDescription)
            }
        }
    }
    
    func getFeedbacks() {
        let getFeedbacksRequest = requestFactory.makeGetFeedbacksRequestFactory()
        getFeedbacksRequest.getFeedbacks(pageNumber: 1, productId: 123) { response in
            switch response.result {
            case .success(let result):
                print (result)
            case .failure(let error):
                print(String(describing: error))
                print(error.localizedDescription)
            }
        }
    }
    
    func addFeedback() {
        let addFeedbackRequest = requestFactory.makeAddFeedbackRequestFactory()
        addFeedbackRequest.addFeedback(userId: 123, feedbackText: "My feedback") { response in
            switch response.result {
            case .success(let result):
                print (result)
            case .failure(let error):
                print(String(describing: error))
                print(error.localizedDescription)
            }
        }
    }
    
    func deleteFeedback() {
        let deleteFeedbackRequest = requestFactory.makeDeleteFeedbackRequestFactory()
        deleteFeedbackRequest.deleteFeedback(feedbackId: 123) { response in
            switch response.result {
            case .success(let result):
                print (result)
            case .failure(let error):
                print(String(describing: error))
                print(error.localizedDescription)
            }
        }
    }
    
    func addToBasket() {
        let addToBasketRequest = requestFactory.makeAddToBasketRequestFactory()
        addToBasketRequest.addToBasket(productId: 123, quantity: 1) { response in
            switch response.result {
            case .success(let result):
                print (result)
            case .failure(let error):
                print(String(describing: error))
                print(error.localizedDescription)
            }
        }
    }
    
    func deleteFromBasket() {
        let deleteFromBasketRequest = requestFactory.makeDeleteFromBasketRequestFactory()
        deleteFromBasketRequest.deleteFromBasket(productId: 123) { response in
            switch response.result {
            case .success(let result):
                print (result)
            case .failure(let error):
                print(String(describing: error))
                print(error.localizedDescription)
            }
        }
    }
    
    func payBasket() {
        let payBasketRequest = requestFactory.makePayBasketRequestFactory()
        payBasketRequest.payBasket(basketId: 123) { response in
            switch response.result {
            case .success(let result):
                print (result)
            case .failure(let error):
                print(String(describing: error))
                print(error.localizedDescription)
            }
        }
    }
}
