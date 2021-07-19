//
//  ProfileScreenPresenter.swift
//  GBShop
//
//  Created by macbook on 11.07.2021.
//

import  UIKit

protocol ProfileScreenPresenterProtocol: class {
    func updateUser(updatedUser: UserData)
    func showAlert(value: String, title: String)
}

class ProfileScreenPresenter: ProfileScreenPresenterProtocol {

    weak var view: ProfileScreenViewControllerProtocol!
    var router: ProfileScreenRouterProtocol!
    var interactor: ProfileScreenInteractorProtocol!

    required init(view: ProfileScreenViewControllerProtocol) {
        self.view = view
    }

    func updateUser(updatedUser: UserData) {
        view.showActivityIndicator()
        interactor.updateUser(updatedUser: updatedUser)
    }

    func showAlert(value: String, title: String) {
        DispatchQueue.main.async { [self] in
            view.hideActivityIndicator()
            view.showAlert(value: value, title: title)
        }
    }
}
