//
//  LoginScreenInteractor.swift
//  GBShop
//
//  Created by macbook on 11.07.2021.
//

import FirebaseAnalytics

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
                Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
                  AnalyticsParameterItemID: "id-\(login.hash)",
                  AnalyticsParameterItemName: login,
                  AnalyticsParameterContentType: "cont"
                ])
                self.presenter?.checkServerResult(with: result)
            case .failure(let error):
                Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
                  AnalyticsParameterItemName: error,
                  AnalyticsParameterContentType: "cont"
                ])
                print(String(describing: error))
                print(error.localizedDescription)
            }
        }
    }
}
