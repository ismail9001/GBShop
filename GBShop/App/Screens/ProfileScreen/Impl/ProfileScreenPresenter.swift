//
//  ProfileScreenPresenter.swift
//  GBShop
//
//  Created by macbook on 11.07.2021.
//

import  UIKit

protocol ProfileScreenPresenterProtocol: AnyObject {
    func updateUser(updatedUser: UserData)
    func openLoginScreen()
    func showAlert(value: String, title: String)
}

class ProfileScreenPresenter: ProfileScreenPresenterProtocol {

    weak var view: ProfileScreenViewControllerProtocol?
    var router: ProfileScreenRouterProtocol?
    var interactor: ProfileScreenInteractorProtocol?

    required init(view: ProfileScreenViewControllerProtocol) {
        self.view = view
    }

    func updateUser(updatedUser: UserData) {
        view?.showActivityIndicator()
        interactor?.updateUser(updatedUser: updatedUser) { [weak self] updatedUser in
            self?.saveUserInMemory(user: updatedUser)
            self?.showAlert(value: "Данные успешно обновлены", title: "Внимание")
        }
    }
    
    func saveUserInMemory(user: UserData) {
        guard let savedUser = UserDefaultsWrapper.userInfo() else { return }
        let newUser = User(userId: savedUser.userId,
                           login: user.username ,
                           password: user.password,
                           name: user.username ,
                           lastname: user.username,
                           email: user.email,
                           gender: user.gender,
                           creditCard: user.creditCard,
                           bio: user.bio,
                           basket: nil)
        UserDefaultsWrapper.saveUserInfo(user: newUser)
    }

    func showAlert(value: String, title: String) {
        DispatchQueue.main.async { [self] in
            view?.hideActivityIndicator()
            view?.showAlert(value: value, title: title)
        }
    }
    
    func openLoginScreen() {
        UserDefaultsWrapper.deleteUserData()
        router?.openLoginScreen()
    }
}
