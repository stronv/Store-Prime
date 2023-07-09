//
//  LoginViewController.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 04.07.2023.
//

import UIKit
import SnapKit

protocol LoginViewControllerProtocol: AnyObject {
    func showAlertWithError(title: String, alertMessage: String)    
}

class LoginViewController: UIViewController, LoginViewControllerProtocol {
    // MARK: - UI
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 50
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    private let signInLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.signInLabel
        label.font = UIFont(name: Fonts.exo2Bold, size: 40)
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.emailLabel
        label.font = UIFont(name: Fonts.exo2Bold, size: 20)
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = L10n.emailTextfield
        textField.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        return textField
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.passwordLabel
        label.font = UIFont(name: Fonts.exo2Bold, size: 20)
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = L10n.passwordTextfield
        textField.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        return textField
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 47
        button.setTitle(L10n.signInButton, for: .normal)
        button.titleLabel?.font = UIFont(name: Fonts.exo2Bold, size: 24)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(signInButtonAction), for: .touchUpInside)
        button.backgroundColor = UIColor.customBlack
        return button
    }()
    
    private let notRegisteredYetLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.notRegisteredYetLabel
        label.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        return label
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle(L10n.signUpButton, for: .normal)
        button.setTitleColor(.customOrange, for: .normal)
        button.titleLabel?.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        button.addTarget(self, action: #selector(signUpButtonAction), for: .touchUpInside)
        button.underline()
        return button
    }()
    
    private lazy var notRegisteredYetStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        return stackView
    }()
    
    private let orLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.orLabel
        label.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        return label
    }()
    
    private let signUpSellerButton: UIButton = {
        let button = UIButton()
        button.setTitle(L10n.signUpSellerButton, for: .normal)
        button.setTitleColor(.customOrange, for: .normal)
        button.addTarget(self, action: #selector(signUpSellerButtonAction), for: .touchUpInside)
        button.titleLabel?.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        button.underline()
        return button
    }()
    
    private let bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.alignment = .center
        return stackView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        emailTextField.setUnderLine()
        passwordTextField.setUnderLine()
    }
        
    // MARK: - MVP Properties
    var output: LoginPresenterProtocol!
    
    // MARK: - Private methods
    private func addInputToStackView(stackView: UIStackView, label: UILabel, textField: UITextField) {
        let inputStackView = UIStackView()
        inputStackView.spacing = 7
        inputStackView.axis = .vertical
        inputStackView.alignment = .leading
        
        inputStackView.addArrangedSubview(label)
        inputStackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(inputStackView)
        
        inputStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(38)
            make.trailing.equalToSuperview().inset(38)
        }
        
        textField.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(44)
        }
    }
    
    private func configure() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        scrollView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        stackView.addArrangedSubview(signInLabel)
        
        addInputToStackView(stackView: stackView, label: emailLabel, textField: emailTextField)
        addInputToStackView(stackView: stackView, label: passwordLabel, textField: passwordTextField)
        
        stackView.addArrangedSubview(signInButton)
        signInButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().inset(18)
            make.height.equalTo(93)
        }
        
        notRegisteredYetStackView.addArrangedSubview(notRegisteredYetLabel)
        notRegisteredYetStackView.addArrangedSubview(signUpButton)
        bottomStackView.addArrangedSubview(notRegisteredYetStackView)
        bottomStackView.addArrangedSubview(orLabel)
        bottomStackView.addArrangedSubview(signUpSellerButton)
        stackView.addArrangedSubview(bottomStackView)
        
        notRegisteredYetStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        bottomStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
        
        let customTitleView = createCustomTitleView(image: "bold-logo")
        navigationItem.titleView = customTitleView
        navigationItem.hidesBackButton = true
    }
}

extension LoginViewController {
    // MARK: - Objc Methods
    @objc func signUpButtonAction() {
        output.showSignUp()
    }
    
    @objc func signUpSellerButtonAction() {
        output.showSellerSignUp()
    }
    
    @objc func signInButtonAction() {
        output.authCustomer(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
    }
}

// MARK: - Public Methods
extension LoginViewController {
    func showAlertWithError(title: String, alertMessage: String) {
        showAlert(alertTitle: title, alertMessage: alertMessage)
    }
}
