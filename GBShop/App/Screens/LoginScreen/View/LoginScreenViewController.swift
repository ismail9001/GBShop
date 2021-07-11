//
//  LoginScreenViewController.swift
//  GBShop
//
//  Created by macbook on 11.07.2021.
//

import UIKit

protocol LoginScreenViewControllerProtocol: class {
    func showAlert(value: String, title: String)
    func showActivityIndicator()
    func hideActivityIndicator()
}

class LoginScreenViewController: BaseViewController, LoginScreenViewControllerProtocol {
    var presenter: LoginScreenPresenterProtocol!

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registrationButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        let fieldsFilled = loginTextField.text != "" && passwordTextField.text != ""
        if let login = loginTextField.text, let password = passwordTextField.text, fieldsFilled {
            presenter.sentData(login: login, password: password)
        } else {
            showAlert(value: "заполните все поля", title: "Внимание")
        }
    }

    @IBAction func registerButtonTapped(_ sender: Any) {
        presenter.openRegisterScreen()
    }
}
