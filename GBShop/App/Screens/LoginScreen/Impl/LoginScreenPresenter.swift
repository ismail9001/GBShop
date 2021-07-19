//
//  LoginScreenPresenter.swift
//  GBShop
//
//  Created by macbook on 11.07.2021.
//

protocol LoginScreenPresenterProtocol: class {
    func sentData(login: String, password: String)
    func openProfile(of user: UserData)
    func openRegisterScreen()
    func showError()
}

class LoginScreenPresenter: LoginScreenPresenterProtocol {

    weak var view: LoginScreenViewControllerProtocol!
    var router: LoginScreenRouterProtocol!
    var interactor: LoginScreenInteractorProtocol!

    required init(view: LoginScreenViewControllerProtocol) {
        self.view = view
    }

    func sentData(login: String, password: String) {
        view.showActivityIndicator()
        interactor.login(login: login, password: password)
    }

    func openProfile(of user: UserData) {
        view.hideActivityIndicator()
        router.openProfileScreen(of: user)
    }

    func openRegisterScreen() {
        router.openRegisterScreen()
    }

    func showError() {
        view.hideActivityIndicator()
        view.showAlert(value: "Пользователь не найден", title: "Ошибка")
    }
}
