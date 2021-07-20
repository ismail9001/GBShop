//
//  LoginScreenViewController.swift
//  GBShop
//
//  Created by macbook on 11.07.2021.
//

import UIKit
import SnapKit
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import MaterialComponents.MaterialButtons
import MaterialComponents.MaterialButtons_Theming

protocol LoginScreenViewControllerProtocol: AnyObject {
    func showAlert(value: String, title: String)
    func showActivityIndicator()
    func hideActivityIndicator()
}

class LoginScreenViewController: BaseViewController, LoginScreenViewControllerProtocol {
    var presenter: LoginScreenPresenterProtocol?
    
    let scrollView = UIScrollView()
    let logotypeOffset: CGFloat = 100.0
    let buttonHeight: CGFloat = 60.0
    let verticalOffset: CGFloat = 20.0
    let horizontalOffset: CGFloat = 40.0
    let containerScheme = MDCContainerScheme()
    
    lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var logoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 30)
        label.text = "GB SHOP"
        return label
    }()
    
    lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "online-shopping.png")
        imageView.contentMode = .scaleAspectFit
        return imageView
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
    
    lazy var loginButton: MDCButton = {
        let button = MDCButton()
        button.applyOutlinedTheme(withScheme: containerScheme)
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var registrationButton: MDCButton = {
        let button = MDCButton()
        button.applyTextTheme(withScheme: containerScheme)
        button.setTitle("Registration", for: .normal)
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        self.navigationController?.isNavigationBarHidden = true
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func configureViews() {
        scrollView.isScrollEnabled = true
        scrollView.delaysContentTouches = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.width.centerX.bottom.top.equalToSuperview()
        }
        
        scrollView.addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.centerX.width.top.bottom.equalToSuperview()
        }
        
        containerView.addSubview(logoLabel)
        logoLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(logotypeOffset)
        }
        
        containerView.addSubview(logoImage)
        logoImage.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoLabel.snp.bottom).offset(horizontalOffset)
            make.width.height.equalTo(logotypeOffset * 2)
        }
        
        containerView.addSubview(loginTextField)
        loginTextField.snp.makeConstraints { (make) in
            make.top.equalTo(logoImage.snp.bottom)
            make.trailing.leading.equalToSuperview().inset(horizontalOffset)
        }
        
        containerView.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { (make) in
            make.trailing.leading.equalToSuperview().inset(horizontalOffset)
            make.top.equalTo(loginTextField.snp.bottom).offset(verticalOffset / 2)
        }
        
        containerView.addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) in
            make.trailing.leading.equalToSuperview().inset(horizontalOffset)
            make.height.equalTo(buttonHeight)
            make.top.equalTo(passwordTextField.snp.bottom).offset(verticalOffset)
        }
        
        containerView.addSubview(registrationButton)
        registrationButton.snp.makeConstraints { (make) in
            make.trailing.leading.equalToSuperview().inset(horizontalOffset)
            make.height.equalTo(buttonHeight)
            make.top.equalTo(loginButton.snp.bottom).offset(verticalOffset)
            make.bottom.equalToSuperview().inset(verticalOffset)
        }
    }
    
    @objc func loginButtonTapped() {
        let fieldsFilled = loginTextField.text != "" && passwordTextField.text != ""
        if let login = loginTextField.text, let password = passwordTextField.text, fieldsFilled {
            presenter?.sentData(login: login, password: password)
        } else {
            showAlert(value: "заполните все поля", title: "Внимание")
        }
    }
    
    @objc func registerButtonTapped() {
        presenter?.openRegisterScreen()
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        guard let keyboardFrameValue = userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else { return }
        var keyboardFrame: CGRect = keyboardFrameValue.cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)

        var contentInset: UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 40
        scrollView.contentInset = contentInset
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        let contentInset: UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
}
