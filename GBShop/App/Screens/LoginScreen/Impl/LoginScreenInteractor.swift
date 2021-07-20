//
//  LoginScreenInteractor.swift
//  GBShop
//
//  Created by macbook on 11.07.2021.
//

protocol LoginScreenInteractorProtocol: AnyObject {
    func login(login: String, password: String)
}

class LoginScreenInteractor: LoginScreenInteractorProtocol {

    weak var presenter: LoginScreenPresenterProtocol?
    let requestFactory = RequestFactory()

    required init(presenter: LoginScreenPresenterProtocol) {
        self.presenter = presenter
    }

    func login(login: String, password: String) {
        let auth = requestFactory.makeAuthRequestFatory()

        auth.login(userName: login, password: password) { response in
            switch response.result {
            case .success(let result):
                self.presenter?.checkServerResult(with: result)
            case .failure(let error):
                print(String(describing: error))
                print(error.localizedDescription)
            }
        }
    }
}
