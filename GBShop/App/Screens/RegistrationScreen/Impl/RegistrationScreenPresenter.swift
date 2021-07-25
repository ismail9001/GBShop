//
//  RegistrationScreenPresenter.swift
//  GBShop
//
//  Created by macbook on 11.07.2021.
//

import UIKit

protocol RegistrationScreenPresenterProtocol: AnyObject {
    func sentData(newUser: UserData)
    func checkServerResult(with result: RegistrationResult)
    func openLoginScreen()
}

class RegistrationScreenPresenter: RegistrationScreenPresenterProtocol {
    
    weak var view: RegistrationScreenViewControllerProtocol?
    var router: RegistrationScreenRouterProtocol?
    var interactor: RegistrationScreenInteractorProtocol?
    
    required init(view: RegistrationScreenViewControllerProtocol) {
        self.view = view
    }
    
    func sentData(newUser: UserData) {
        view?.showActivityIndicator()
        interactor?.register(newUser: newUser)
    }
    
    func checkServerResult(with result: RegistrationResult) {
        DispatchQueue.main.async { [self] in
            if result.result == 1, let user = result.user {
                UserDefaultsWrapper.saveUserInfo(user: user)
                router?.openCatalogScreen()
            } else if result.result == 0, let errorMessage = result.errorMessage {
                view?.hideActivityIndicator()
                view?.showAlert(value: errorMessage, title: "Ошибка")
            }
        }
    }
    
    func openLoginScreen() {
        router?.openLoginScreen()
    }
}
