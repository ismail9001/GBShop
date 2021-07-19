//
//  RegistrationScreenPresenter.swift
//  GBShop
//
//  Created by macbook on 11.07.2021.
//

protocol RegistrationScreenPresenterProtocol: class {
    func sentData(newUser: UserData)
    func openProfileScreen(of user: UserData)
    func openLoginScreen()
}

class RegistrationScreenPresenter: RegistrationScreenPresenterProtocol {

    weak var view: RegistrationScreenViewControllerProtocol!
    var router: RegistrationScreenRouterProtocol!
    var interactor: RegistrationScreenInteractorProtocol!

    required init(view: RegistrationScreenViewControllerProtocol) {
        self.view = view
    }

    func sentData(newUser: UserData) {
        view.showActivityIndicator()
        interactor.register(newUser: newUser)
    }

    func openProfileScreen(of user: UserData) {
        view.hideActivityIndicator()
        router.openProfileScreen(of: user)
    }

    func openLoginScreen() {
        router.openLoginScreen()
    }
}
