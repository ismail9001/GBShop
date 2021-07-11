//
//  ProfileScreenViewController.swift
//  GBShop
//
//  Created by macbook on 11.07.2021.
//

import UIKit

protocol ProfileScreenViewControllerProtocol: class {
    func showAlert(value: String, title: String)
    func showActivityIndicator()
    func hideActivityIndicator()
}

class ProfileScreenViewController: BaseViewController, ProfileScreenViewControllerProtocol {

    var presenter: ProfileScreenPresenterProtocol!
    var user: UserData!

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var cardTextField: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var bioTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    func setupViews() {
        loginTextField.text = user.username
        passwordTextField.text = user.password
        emailTextField.text = user.email
        cardTextField.text = user.creditCard
        if user.gender == "Male" {
            gender.selectedSegmentIndex = 0
        } else {
            gender.selectedSegmentIndex = 1
        }
        bioTextView.text = user.bio
    }

    @IBAction func updateUserButtonTapped(_ sender: Any) {
        guard let login = loginTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let email = emailTextField.text else { return }
        guard let cardNumber = cardTextField.text else { return }
        guard let gender = gender.titleForSegment(at: gender.selectedSegmentIndex) else { return }
        guard let bio = bioTextView.text else { return }

        let fieldsFilled = login != "" && password != "" && email != "" && cardNumber != "" && bio != "" && gender != ""

        if fieldsFilled {
            let updatedUser = UserData(username: login, password: password, email: email, gender: gender, creditCard: cardNumber, bio: bio)
            presenter.updateUser(updatedUser: updatedUser)
        } else {
            showAlert(value: "заполните все поля", title: "Внимание")
        }
    }
}
