//
//  LoginScreenPresenter.swift
//  GBShop
//
//  Created by macbook on 11.07.2021.
//

import UIKit

protocol LoginScreenPresenterProtocol: AnyObject {
    func checkServerResult(with result: LoginResult)
    func sentData(login: String, password: String)
    func openRegisterScreen()
}

class LoginScreenPresenter: LoginScreenPresenterProtocol {

    weak var view: LoginScreenViewControllerProtocol?
    var router: LoginScreenRouterProtocol?
    var interactor: LoginScreenInteractorProtocol?

    required init(view: LoginScreenViewControllerProtocol) {
        self.view = view
    }

    func sentData(login: String, password: String) {
        view?.showActivityIndicator()
        interactor?.login(login: login, password: password)
    }

    func checkServerResult(with result: LoginResult) {
        DispatchQueue.main.async { [self] in
            if result.result == 1,
               let user = result.user,
               let window = UIApplication.shared.currentWindow {
                UserDefaultsWrapper.saveUserInfo(user: user)
                let viewController = MainTabBarControllerAssembler().assemble()
                    window.rootViewController = viewController
                    window.makeKeyAndVisible()
            } else if result.result == 0, let errorMessage = result.errorMessage {
                view?.hideActivityIndicator()
                view?.showAlert(value: errorMessage, title: "Ошибка")
            }
        }
    }

    func openRegisterScreen() {
        router?.openRegisterScreen()
    }
}
