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
        scrollView.contentSize = contentSize
        scrollView.frame = view.bounds
        return scrollView
    }()
    
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height + 500)
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
        button.addTarget(self, action: #selector(firstCheck), for: .touchUpInside)
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
        button.addTarget(self, action: #selector(firstCheck), for: .touchUpInside)
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
        button.titleLabel?.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        button.addTarget(self, action: #selector(firstCheck), for: .touchUpInside)
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
        nameTextField.setUnderLine()
        surnameTextField.setUnderLine()
        dateOfBirthTextField.setUnderLine()
        addressTextField.setUnderLine()
        phoneNumberTextField.setUnderLine()
        emailTextField.setUnderLine()
        passwordTextField.setUnderLine()
    }
    
    // MARK: - MVP Properties
    var output: RegistrationPresenter!
    
    // MARK: - Private methods
    private func configure() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(signUpLabel)
        signUpLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
        }
        
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(signUpLabel.snp.bottom).offset(75)
            make.leading.equalToSuperview().inset(38)
        }
        
        contentView.addSubview(nameTextField)
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(17)
            make.leading.equalToSuperview().offset(38)
            make.trailing.equalToSuperview().inset(38)
            make.height.equalTo(32)
        }
        
        contentView.addSubview(surnameLabel)
        surnameLabel.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(37)
            make.leading.equalToSuperview().offset(38)
        }
        
        contentView.addSubview(surnameTextField)
        surnameTextField.snp.makeConstraints { make in
            make.top.equalTo(surnameLabel.snp.bottom).offset(17)
            make.leading.equalToSuperview().offset(38)
            make.trailing.equalToSuperview().inset(38)
            make.height.equalTo(32)
        }
        
        contentView.addSubview(dateOfBirthLabel)
        dateOfBirthLabel.snp.makeConstraints { make in
            make.top.equalTo(surnameTextField.snp.bottom).offset(37)
            make.leading.equalToSuperview().offset(38)
        }
        
        contentView.addSubview(dateOfBirthTextField)
        dateOfBirthTextField.snp.makeConstraints { make in
            make.top.equalTo(dateOfBirthLabel.snp.bottom).offset(17)
            make.leading.equalToSuperview().offset(38)
            make.trailing.equalToSuperview().inset(38)
            make.height.equalTo(32)
        }
        
        contentView.addSubview(genderLabel)
        genderLabel.snp.makeConstraints { make in
            make.top.equalTo(dateOfBirthTextField.snp.bottom).offset(37)
            make.leading.equalToSuperview().offset(38)
        }
        
        contentView.addSubview(genderSegmentedControl)
        genderSegmentedControl.snp.makeConstraints { make in
            make.top.equalTo(genderLabel.snp.bottom).offset(17)
            make.leading.equalToSuperview().offset(38)
            make.trailing.equalToSuperview().inset(38)
            make.height.equalTo(32)
        }
        
        contentView.addSubview(addressLabel)
        addressLabel.snp.makeConstraints { make in
            make.top.equalTo(genderSegmentedControl.snp.bottom).offset(37)
            make.leading.equalToSuperview().offset(38)
        }
        
        contentView.addSubview(addressTextField)
        addressTextField.snp.makeConstraints { make in
            make.top.equalTo(addressLabel.snp.bottom).offset(17)
            make.leading.equalToSuperview().offset(38)
            make.trailing.equalToSuperview().inset(38)
            make.height.equalTo(32)
        }
        
        contentView.addSubview(phoneNumberLabel)
        phoneNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(addressTextField.snp.bottom).offset(37)
            make.leading.equalToSuperview().offset(38)
        }
        
        contentView.addSubview(phoneNumberTextField)
        phoneNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberLabel.snp.bottom).offset(17)
            make.leading.equalToSuperview().offset(38)
            make.trailing.equalToSuperview().inset(38)
            make.height.equalTo(32)
        }
        
        contentView.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberTextField.snp.bottom).offset(37)
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
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
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

extension RegistrationViewController {
    // MARK: - Objc Methods
    @objc func firstCheck() {
        print("Button is work!")
    }
}
