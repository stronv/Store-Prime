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
        return scrollView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 50
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
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
    
    private lazy var alreadyRegisterStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
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
        titleTextField.setUnderLine()
        innTextField.setUnderLine()
        addressTextField.setUnderLine()
        emailTextField.setUnderLine()
        passwordTextField.setUnderLine()
    }
    
    // MARK: - MVP Properties
    var output: SellerRegistrationPresenterProtocol!
    
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
        
        stackView.addArrangedSubview(signUpLabel)
        
        addInputToStackView(stackView: stackView, label: titleLabel, textField: titleTextField)
        addInputToStackView(stackView: stackView, label: innLabel, textField: innTextField)
        addInputToStackView(stackView: stackView, label: addressLabel, textField: addressTextField)
        addInputToStackView(stackView: stackView, label: emailLabel, textField: emailTextField)
        addInputToStackView(stackView: stackView, label: passwordLabel, textField: passwordTextField)
        
        stackView.addArrangedSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().inset(18)
            make.height.equalTo(93)
        }
        
        alreadyRegisterStackView.addArrangedSubview(alreadyRegisterLabel)
        alreadyRegisterStackView.addArrangedSubview(signInButton)
        bottomStackView.addArrangedSubview(alreadyRegisterStackView)
        bottomStackView.addArrangedSubview(orLabel)
        bottomStackView.addArrangedSubview(signUpSellerButton)
        stackView.addArrangedSubview(bottomStackView)
        
        alreadyRegisterStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
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
