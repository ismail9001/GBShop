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
        registration()
        updateUser()
        auth()
        getCatalog()
        getProductByID()
    }
    
    func registration() {
        let registration = requestFactory.makeRegistrationRequestFactory()
        
        registration.register(userId: 123, username: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
            switch response.result {
            case .success(let result):
                print (result)
            case .failure(let error):
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
                print(error.localizedDescription)
                print(String(describing: error))
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
                print(error.localizedDescription)
                print(String(describing: error))
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
                print(error.localizedDescription)
                print(String(describing: error))
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
                print(error.localizedDescription)
                print(String(describing: error))
            }
        }
    }
    
}

