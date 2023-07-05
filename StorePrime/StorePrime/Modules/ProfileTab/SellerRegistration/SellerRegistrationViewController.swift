//
//  SellerRegistrationViewController.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 05.07.2023.
//

import Foundation

import UIKit
import SnapKit

protocol SellerRegistrationViewControllerProtocol: AnyObject {
    
}

class SellerRegistrationViewController: UIViewController, SellerRegistrationViewControllerProtocol {
    
    // MARK: - UI
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.contentSize = contentSize
        scrollView.frame = view.bounds
        
        return scrollView
    }()
    
    private var contentSize: CGSize {
        CGSize(width: view.bounds.width, height: view.bounds.height + 600)
    }
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.frame.size = contentSize
        return contentView
    }()
    
    private let signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "sign_up_label".localized
        label.font = UIFont(name: Fonts.exo2Bold, size: 40)
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "title_label".localized
        label.font = UIFont(name: Fonts.exo2Bold, size: 20)
        return label
    }()
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "title_textfield".localized
        textField.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        textField.isUserInteractionEnabled = true
        return textField
    }()
    
    private let innLabel: UILabel = {
        let label = UILabel()
        label.text = "inn_label".localized
        label.font = UIFont(name: Fonts.exo2Bold, size: 20)
        return label
    }()
    
    private let innTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "inn_textfield".localized
        textField.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        textField.isUserInteractionEnabled = true
        return textField
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.text = "address_label".localized
        label.font = UIFont(name: Fonts.exo2Bold, size: 20)
        return label
    }()
    
    private let addressTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "address_textfield".localized
        textField.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        return textField
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
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 47
        button.setTitle("sign_up_button".localized, for: .normal)
        button.titleLabel?.font = UIFont(name: Fonts.exo2Bold, size: 24)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.customBlack
        return button
    }()
    
    private let alreadyRegisterLabel: UILabel = {
        let label = UILabel()
        label.text = "already_register_label".localized
        label.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        return label
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("sign_in_button".localized, for: .normal)
        button.setTitleColor(.customOrange, for: .normal)
        button.titleLabel?.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        button.addTarget(self, action: #selector(signInButtonAction), for: .touchUpInside)
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
        button.setTitle("sign_up_customer_button".localized, for: .normal)
        button.setTitleColor(.customOrange, for: .normal)
        button.titleLabel?.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        button.addTarget(self, action: #selector(signUpSellerButtonAction), for: .touchUpInside)
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
        titleTextField.setUnderLine()
        innTextField.setUnderLine()
        addressTextField.setUnderLine()
        emailTextField.setUnderLine()
        passwordTextField.setUnderLine()
    }
    
    // MARK: - MVP Properties
    var output: SellerRegistrationPresenterProtocol!
    
    // MARK: - Private methods
    private func configure() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(signUpLabel)
        signUpLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
        }
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(signUpLabel.snp.bottom).offset(75)
            make.leading.equalToSuperview().inset(38)
        }
        
        contentView.addSubview(titleTextField)
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(17)
            make.leading.equalToSuperview().offset(38)
            make.trailing.equalToSuperview().inset(38)
            make.height.equalTo(32)
        }
        
        contentView.addSubview(innLabel)
        innLabel.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(37)
            make.leading.equalToSuperview().inset(38)
        }
        
        contentView.addSubview(innTextField)
        innTextField.snp.makeConstraints { make in
            make.top.equalTo(innLabel.snp.bottom).offset(17)
            make.leading.equalToSuperview().offset(38)
            make.trailing.equalToSuperview().inset(38)
            make.height.equalTo(32)
        }
        
        contentView.addSubview(addressLabel)
        addressLabel.snp.makeConstraints { make in
            make.top.equalTo(innTextField.snp.bottom).offset(37)
            make.leading.equalToSuperview().offset(38)
        }
        
        contentView.addSubview(addressTextField)
        addressTextField.snp.makeConstraints { make in
            make.top.equalTo(addressLabel.snp.bottom).offset(17)
            make.leading.equalToSuperview().offset(38)
            make.trailing.equalToSuperview().inset(38)
            make.height.equalTo(32)
        }
        
        contentView.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(addressTextField.snp.bottom).offset(37)
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
        
        contentView.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.height.equalTo(93)
            make.top.equalTo(passwordTextField.snp.bottom).offset(55)
            make.leading.equalToSuperview().offset(38)
            make.trailing.equalToSuperview().inset(38)
        }
        
        contentView.addSubview(alreadyRegisterLabel)
        alreadyRegisterLabel.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(88)
            make.leading.equalToSuperview().offset(38)
        }

        contentView.addSubview(signInButton)
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(81)
            make.leading.equalTo(alreadyRegisterLabel.snp.trailing).offset(10)
        }
        
        contentView.addSubview(orLabel)
        orLabel.snp.makeConstraints { make in
            make.top.equalTo(alreadyRegisterLabel.snp.bottom).offset(33)
            make.centerX.equalToSuperview()
        }
        
        contentView.addSubview(signUpSellerButton)
        signUpSellerButton.snp.makeConstraints { make in
            make.top.equalTo(orLabel.snp.bottom).offset(23)
            make.leading.equalToSuperview().offset(38)
        }
        
        let customTitleView = createCustomTitleView(image: "bold-logo")
        navigationItem.titleView = customTitleView
    }
}

extension SellerRegistrationViewController {
    // MARK: - Objc Methods
    @objc func signInButtonAction() {
        output.showSignIn()
    }
    
    @objc func signUpSellerButtonAction() {
        output.showCustomerSignUp()
    }
}
