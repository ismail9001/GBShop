//
//  ProfileScreenViewController.swift
//  GBShop
//
//  Created by macbook on 11.07.2021.
//

import UIKit
import MaterialComponents.MaterialButtons_Theming
import MaterialComponents.MaterialButtons

protocol ProfileScreenViewControllerProtocol: AnyObject {
    func showAlert(value: String, title: String)
    func showActivityIndicator()
    func hideActivityIndicator()
}

class ProfileScreenViewController: BaseViewController, ProfileScreenViewControllerProtocol {

    var presenter: ProfileScreenPresenterProtocol?
    var user = UserDefaultsWrapper.userInfo()
    let containerScheme = MDCContainerScheme()
    
    let scrollView = UIScrollView()
    
    lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var logoLabel: UILabel = {
        let label = UILabel()
        label.font = UIConfig.titleTextFont
        label.text = "GB SHOP"
        return label
    }()
    
    lazy var loginTextField: UITextField = {
        let textField = MDCOutlinedTextField()
        textField.label.text = "Login"
        textField.placeholder = "1"
        textField.leadingAssistiveLabel.text = "Your username"
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = MDCOutlinedTextField()
        textField.label.text = "Password"
        textField.placeholder = "1"
        textField.leadingAssistiveLabel.text = "Your password"
        return textField
    }()

    lazy var emailTextField: UITextField = {
        let textField = MDCOutlinedTextField()
        textField.label.text = "Email"
        textField.placeholder = "1"
        textField.leadingAssistiveLabel.text = "Your E-mail"
        return textField
    }()

    lazy var cardTextField: UITextField = {
        let textField = MDCOutlinedTextField()
        textField.label.text = "Card number"
        textField.placeholder = "1"
        textField.leadingAssistiveLabel.text = "Your card"
        return textField
    }()

    lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.font = UIConfig.mediumTextFont
        label.text = "Gender"
        return label
    }()

    lazy var gender: UISegmentedControl = {
        let items = ["Male", "Female"]
        let segmentControl = UISegmentedControl(items: items)
        segmentControl.selectedSegmentIndex = 0
        return segmentControl
    }()

    lazy var bioTextField: MDCOutlinedTextArea = {
        let textArea = MDCOutlinedTextArea()
        textArea.label.text = "Biography"
        textArea.textView.text = "1"
        textArea.leadingAssistiveLabel.text = "Your biography"
        return textArea
    }()

    lazy var exitButton: MDCButton = {
        let button = MDCButton()
        button.applyTextTheme(withScheme: containerScheme)
        button.setTitle("Exit", for: .normal)
        button.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
        return button
    }()

    lazy var saveButton: MDCButton = {
        let button = MDCButton()
        button.applyOutlinedTheme(withScheme: containerScheme)
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureConstraints() 
        fillViews()
    }

    func fillViews() {
        guard let user = user else { return }
        loginTextField.text = user.login
        passwordTextField.text = user.password
        emailTextField.text = user.email
        cardTextField.text = user.creditCard
        if user.gender == "Male" {
            gender.selectedSegmentIndex = 0
        } else {
            gender.selectedSegmentIndex = 1
        }
        bioTextField.textView.text = user.bio
    }
    
    func configureViews() {
        scrollView.isScrollEnabled = true
        scrollView.delaysContentTouches = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(logoLabel)
        containerView.addSubview(loginTextField)
        containerView.addSubview(passwordTextField)
        containerView.addSubview(emailTextField)
        containerView.addSubview(cardTextField)
        containerView.addSubview(genderLabel)
        containerView.addSubview(gender)
        containerView.addSubview(bioTextField)
        containerView.addSubview(saveButton)
        containerView.addSubview(exitButton)
    }
    
    func configureConstraints() {
        scrollView.snp.makeConstraints { (make) in
            make.width.centerX.bottom.top.equalToSuperview()
        }
        containerView.snp.makeConstraints { (make) in
            make.centerX.width.top.bottom.equalToSuperview()
        }
        logoLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(UIConfig.logotypeOffset / 2)
        }
        loginTextField.snp.makeConstraints { (make) in
            make.top.equalTo(logoLabel.snp.bottom).offset(UIConfig.horizontalOffset)
            make.trailing.leading.equalToSuperview().inset(UIConfig.horizontalOffset)
        }
        passwordTextField.snp.makeConstraints { (make) in
            make.trailing.leading.equalToSuperview().inset(UIConfig.horizontalOffset)
            make.top.equalTo(loginTextField.snp.bottom).offset(UIConfig.verticalOffset / 2)
        }
        emailTextField.snp.makeConstraints { (make) in
            make.trailing.leading.equalToSuperview().inset(UIConfig.horizontalOffset)
            make.top.equalTo(passwordTextField.snp.bottom).offset(UIConfig.verticalOffset / 2)
        }
        cardTextField.snp.makeConstraints { (make) in
            make.trailing.leading.equalToSuperview().inset(UIConfig.horizontalOffset)
            make.top.equalTo(emailTextField.snp.bottom).offset(UIConfig.verticalOffset / 2)
        }
        genderLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(UIConfig.horizontalOffset)
            make.top.equalTo(cardTextField.snp.bottom).offset(UIConfig.verticalOffset)
        }
        gender.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().inset(UIConfig.horizontalOffset)
            make.centerY.equalTo(genderLabel.snp.centerY)
        }
        bioTextField.snp.makeConstraints { (make) in
            make.trailing.leading.equalToSuperview().inset(UIConfig.horizontalOffset)
            make.top.equalTo(gender.snp.bottom).offset(UIConfig.verticalOffset)
        }
        saveButton.snp.makeConstraints { (make) in
            make.trailing.leading.equalToSuperview().inset(UIConfig.horizontalOffset)
            make.height.equalTo(UIConfig.buttonHeight)
            make.top.equalTo(bioTextField.snp.bottom).offset(UIConfig.verticalOffset)
        }
        exitButton.snp.makeConstraints { (make) in
            make.trailing.leading.equalToSuperview().inset(UIConfig.horizontalOffset)
            make.height.equalTo(UIConfig.buttonHeight)
            make.top.equalTo(saveButton.snp.bottom).offset(UIConfig.verticalOffset)
            make.bottom.equalToSuperview().inset(UIConfig.verticalOffset)
        }
    }

    @IBAction func updateUserButtonTapped(_ sender: Any) {
        guard let login = loginTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let email = emailTextField.text else { return }
        guard let cardNumber = cardTextField.text else { return }
        guard let gender = gender.titleForSegment(at: gender.selectedSegmentIndex) else { return }
        guard let bio = bioTextField.textView.text else { return }

        let fieldsFilled = login != "" && password != "" && email != "" && cardNumber != "" && bio != "" && gender != ""

        if fieldsFilled {
            let updatedUser = UserData(username: login,
                                       password: password,
                                       email: email,
                                       gender: gender,
                                       creditCard: cardNumber,
                                       bio: bio)
            presenter?.updateUser(updatedUser: updatedUser)
        } else {
            showAlert(value: "заполните все поля", title: "Внимание")
        }
    }
    
    @objc func exitButtonTapped() {
        presenter?.openLoginScreen()
    }
    
    @objc func saveButtonTapped() {
        guard let login = loginTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let email = emailTextField.text else { return }
        guard let cardNumber = cardTextField.text else { return }
        guard let gender = gender.titleForSegment(at: gender.selectedSegmentIndex) else { return }
        guard let bio = bioTextField.textView.text else { return }

        let fieldsFilled = login != "" && password != ""
            && email != "" && cardNumber != "" && bio != "" && gender != ""

        if fieldsFilled {
            let newUser = UserData(username: login,
                                   password: password,
                                   email: email,
                                   gender: gender,
                                   creditCard: cardNumber,
                                   bio: bio)
            presenter?.updateUser(updatedUser: newUser)
        } else {
            showAlert(value: "заполните все поля", title: "Внимание")
        }
    }
}
