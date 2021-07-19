//
//  RegistrationScreenViewController.swift
//  GBShop
//
//  Created by macbook on 11.07.2021.
//

import UIKit

protocol RegistrationScreenViewControllerProtocol: class {
    func showAlert(value: String, title: String)
    func showActivityIndicator()
    func hideActivityIndicator()
}

class RegistrationScreenViewController: BaseViewController, RegistrationScreenViewControllerProtocol {

    var presenter: RegistrationScreenPresenterProtocol!

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var cardTextField: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var bioTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func registerButtonTapped(_ sender: Any) {

        guard let login = loginTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let email = emailTextField.text else { return }
        guard let cardNumber = cardTextField.text else { return }
        guard let gender = gender.titleForSegment(at: gender.selectedSegmentIndex) else { return }
        guard let bio = bioTextView.text else { return }

        let fieldsFilled = login != "" && password != "" && email != "" && cardNumber != "" && bio != "" && gender != ""

        if fieldsFilled {
            let newUser = UserData(username: login, password: password, email: email, gender: gender, creditCard: cardNumber, bio: bio)
            presenter.sentData(newUser: newUser)
        } else {
            showAlert(value: "заполните все поля", title: "Внимание")
        }
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        presenter.openLoginScreen()
    }
}
