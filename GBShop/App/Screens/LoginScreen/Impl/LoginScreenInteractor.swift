//
//  LoginScreenInteractor.swift
//  GBShop
//
//  Created by macbook on 11.07.2021.
//

protocol LoginScreenInteractorProtocol: class {
    func login(login: String, password: String)
}

class LoginScreenInteractor: LoginScreenInteractorProtocol {

    weak var presenter: LoginScreenPresenterProtocol!
    let requestFactory = RequestFactory()

    required init(presenter: LoginScreenPresenterProtocol) {
        self.presenter = presenter
    }

    func login(login: String, password: String) {
        let auth = requestFactory.makeAuthRequestFatory()

        auth.login(userName: login, password: password) { response in
            switch response.result {
            case .success:
                // TODO на беке сделать отправку юзера
                self.presenter.openProfile(of: UserData(username: "Iskander",
                                                        password: "111111",
                                                        email: "test@test.ru",
                                                        gender: "Male",
                                                        creditCard: "5555-5555-5555-5555",
                                                        bio: "Im junior swift programmer"))
            case .failure(let error):
                self.presenter.showError()
                print(String(describing: error))
                print(error.localizedDescription)
            }
        }
    }
}
