//
//  LoginViewController.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 04.07.2023.
//

import UIKit
import SnapKit

protocol LoginViewControllerProtocol: AnyObject {
    
}

class LoginViewController: UIViewController, LoginViewControllerProtocol {
    // MARK: - UI
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.contentSize = contentSize
        scrollView.frame = view.bounds
        return scrollView
    }()
    
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.frame.size = contentSize
        return contentView
    }()
    
    private let signInLabel: UILabel = {
        let label = UILabel()
        label.text = "sign_in_label".localized
        label.font = UIFont(name: Fonts.exo2Bold, size: 40)
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "email_label".localized
        label.font = UIFont(name: Fonts.exo2Bold, size: 20)
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "email_textfield".localized
        textField.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        return textField
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "password_label".localized
        label.font = UIFont(name: Fonts.exo2Bold, size: 20)
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "password_textfield".localized
        textField.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        return textField
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 47
        button.setTitle("sign_in_button".localized, for: .normal)
        button.titleLabel?.font = UIFont(name: Fonts.exo2Bold, size: 24)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.customBlack
        return button
    }()
    
    private let notRegisteredYetLabel: UILabel = {
        let label = UILabel()
        label.text = "not_registered_yet_label".localized
        label.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        return label
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("sign_up_customer_button".localized, for: .normal)
        button.setTitleColor(.customOrange, for: .normal)
        button.titleLabel?.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        button.addTarget(self, action: #selector(signUpButtonAction), for: .touchUpInside)
        button.underline()
        return button
    }()
    
    private let orLabel: UILabel = {
        let label = UILabel()
        label.text = "or_label".localized
        label.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        return label
    }()
    
    private let signUpSellerButton: UIButton = {
        let button = UIButton()
        button.setTitle("sign_up_seller_button".localized, for: .normal)
        button.setTitleColor(.customOrange, for: .normal)
        button.addTarget(self, action: #selector(signUpSellerButtonAction), for: .touchUpInside)
        button.titleLabel?.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        button.underline()
        return button
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
    private func configure() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(signInLabel)
        signInLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(75)
            make.centerX.equalToSuperview()
        }
        
        contentView.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(signInLabel.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(38)
        }
        
        contentView.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(17)
            make.leading.equalToSuperview().offset(38)
            make.trailing.equalToSuperview().inset(38)
            make.height.equalTo(32)
        }
        
        contentView.addSubview(passwordLabel)
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(37)
            make.leading.equalToSuperview().offset(38)
        }
        
        contentView.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(17)
            make.leading.equalToSuperview().offset(38)
            make.trailing.equalToSuperview().inset(38)
            make.height.equalTo(32)
        }
        
        contentView.addSubview(signInButton)
        signInButton.snp.makeConstraints { make in
            make.height.equalTo(93)
            make.top.equalTo(passwordTextField.snp.bottom).offset(89)
            make.leading.equalToSuperview().offset(38)
            make.trailing.equalToSuperview().inset(38)
        }
        
        contentView.addSubview(notRegisteredYetLabel)
        notRegisteredYetLabel.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(73)
            make.leading.equalToSuperview().offset(38)
        }
        
        contentView.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(notRegisteredYetLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(38)
        }
        
        contentView.addSubview(orLabel)
        orLabel.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(27)
            make.centerX.equalToSuperview()
        }
        
        contentView.addSubview(signUpSellerButton)
        signUpSellerButton.snp.makeConstraints { make in
            make.top.equalTo(orLabel.snp.bottom).offset(27)
            make.leading.equalToSuperview().offset(38)
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
    
    // MARK: - Objc Methods
    @objc func signUpSellerButtonAction() {
        output.showSellerSignUp()
    }
}
