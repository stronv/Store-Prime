//
//  RegistrationViewController.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 02.07.2023.
//

import UIKit
import SnapKit

protocol RegistrationViewControllerProtocol: AnyObject {
    
}

class RegistrationViewController: UIViewController, RegistrationViewControllerProtocol {
    
    // MARK: - UI
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 33
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
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "name_label".localized
        label.font = UIFont(name: Fonts.exo2Bold, size: 20)
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "name_textfield".localized
        textField.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        textField.isUserInteractionEnabled = true
        return textField
    }()
    
    private let surnameLabel: UILabel = {
        let label = UILabel()
        label.text = "surname_label".localized
        label.font = UIFont(name: Fonts.exo2Bold, size: 20)
        return label
    }()
    
    private let surnameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "surname_textfield".localized
        textField.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        return textField
    }()
    
    private let dateOfBirthLabel: UILabel = {
        let label = UILabel()
        label.text = "date_of_birth_label".localized
        label.font = UIFont(name: Fonts.exo2Bold, size: 20)
        return label
    }()
    
    private let dateOfBirthTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "date_of_birth_textfield".localized
        textField.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        return textField
    }()
    
    private let genderLabel: UILabel = {
        let label = UILabel()
        label.text = "gender_label".localized
        label.font = UIFont(name: Fonts.exo2Bold, size: 20)
        return label
    }()
    
    private let genderSegmentedControl: UISegmentedControl = {
        let items = ["male_string".localized, "female_string".localized]
        let segmentedControl = UISegmentedControl(items: items)
        return segmentedControl
    }()
    
    private lazy var genderInputStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 7
        stackView.axis = .vertical
        stackView.alignment = .leading
        return stackView
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
    
    private let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "phone_number_label".localized
        label.font = UIFont(name: Fonts.exo2Bold, size: 20)
        return label
    }()
    
    private let phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "phone_number_textfield".localized
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
        button.addTarget(self, action: #selector(signUpButtonAction), for: .touchUpInside)
        button.backgroundColor = UIColor.customBlack
        return button
    }()
    
    private let alreadyRegisterLabel: UILabel = {
        let label = UILabel()
        label.text = "already_register_label".localized
        label.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        label.setContentHuggingPriority(UILayoutPriority(252), for: .horizontal)
        return label
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("sign_in_button".localized, for: .normal)
        button.setTitleColor(.customOrange, for: .normal)
        button.titleLabel?.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        button.addTarget(self, action: #selector(signInButtonAction), for: .touchUpInside)
        button.setContentHuggingPriority(UILayoutPriority(251), for: .horizontal)
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
        button.setTitle("sign_up_seller_button".localized, for: .normal)
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
        nameTextField.setUnderLine()
        surnameTextField.setUnderLine()
        dateOfBirthTextField.setUnderLine()
        addressTextField.setUnderLine()
        phoneNumberTextField.setUnderLine()
        emailTextField.setUnderLine()
        passwordTextField.setUnderLine()
    }
    
    // MARK: - MVP Properties
    var output: RegistrationPresenterProtocol!
    
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
    
        addInputToStackView(stackView: stackView, label: nameLabel, textField: nameTextField)
        addInputToStackView(stackView: stackView, label: surnameLabel, textField: surnameTextField)
        addInputToStackView(stackView: stackView, label: dateOfBirthLabel, textField: dateOfBirthTextField)
        
        genderInputStackView.addArrangedSubview(genderLabel)
        genderInputStackView.addArrangedSubview(genderSegmentedControl)
        stackView.addArrangedSubview(genderInputStackView)
        genderInputStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(38)
            make.trailing.equalToSuperview().inset(38)
        }
        genderSegmentedControl.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        addInputToStackView(stackView: stackView, label: addressLabel, textField: addressTextField)
        addInputToStackView(stackView: stackView, label: phoneNumberLabel, textField: phoneNumberTextField)
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

extension RegistrationViewController {
    // MARK: - Objc Methods
    @objc func signInButtonAction() {
        output.showSignIn()
    }
    
    @objc func signUpSellerButtonAction() {
        output.showSellerSignUp()
    }
    
    @objc func signUpButtonAction() {
        print("Try to create customer!")
    }
}
