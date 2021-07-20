//
//  RegistrationScreenInteractor.swift
//  GBShop
//
//  Created by macbook on 11.07.2021.
//

protocol RegistrationScreenInteractorProtocol: AnyObject {
    func register(newUser: UserData)
}

class RegistrationScreenInteractor: RegistrationScreenInteractorProtocol {

    weak var presenter: RegistrationScreenPresenterProtocol?
    let requestFactory = RequestFactory()

    required init(presenter: RegistrationScreenPresenterProtocol) {
        self.presenter = presenter
    }

    func register(newUser: UserData) {
        let registration = requestFactory.makeRegistrationRequestFactory()

        registration.register(userId: 123,
                              username: newUser.username,
                              password: newUser.password,
                              email: newUser.email,
                              gender: newUser.gender,
                              creditCard: newUser.creditCard,
                              bio: newUser.bio) { response in
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
