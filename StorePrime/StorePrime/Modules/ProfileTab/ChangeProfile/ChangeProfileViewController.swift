//
//  ChangeProfileViewControllerProtocol.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 07.07.2023.
//

import UIKit
import SnapKit

protocol ChangeProfileViewControllerProtocol: AnyObject {
    func createAlert(title: String, alertMessage: String)
}

class ChangeProfileViewController: UIViewController, ChangeProfileViewControllerProtocol {
    // MARK: - UI
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.backgroundColor = UIColor(named: "backroundColor")
        return scrollView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 33
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.nameLabel
        label.font = UIFont(name: Fonts.exo2Bold, size: 20)
        label.textColor = UIColor(named: "fontColor")
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = L10n.nameTextfield
        textField.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        textField.isUserInteractionEnabled = true
        textField.textColor = UIColor(named: "fontColor")
        return textField
    }()
    
    private let surnameLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.surnameLabel
        label.font = UIFont(name: Fonts.exo2Bold, size: 20)
        label.textColor = UIColor(named: "fontColor")
        return label
    }()
    
    private let surnameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = L10n.surnameTextfield
        textField.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        textField.textColor = UIColor(named: "fontColor")
        return textField
    }()
    
    private let dateOfBirthLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.dateOfBirthLabel
        label.font = UIFont(name: Fonts.exo2Bold, size: 20)
        label.textColor = UIColor(named: "fontColor")
        return label
    }()
    
    private let dateOfBirthTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = L10n.dateOfBirthTextfield
        textField.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        textField.textColor = UIColor(named: "fontColor")
        return textField
    }()
    
    private let genderLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.genderLabel
        label.font = UIFont(name: Fonts.exo2Bold, size: 20)
        label.textColor = UIColor(named: "fontColor")
        return label
    }()
    
    private let genderSegmentedControl: UISegmentedControl = {
        let items = [L10n.maleString, L10n.femaleString]
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
        label.text = L10n.addressLabel
        label.font = UIFont(name: Fonts.exo2Bold, size: 20)
        label.textColor = UIColor(named: "fontColor")
        return label
    }()
    
    private let addressTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = L10n.addressTextfield
        textField.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        textField.textColor = UIColor(named: "fontColor")
        return textField
    }()
    
    private let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.phoneNumberLabel
        label.font = UIFont(name: Fonts.exo2Bold, size: 20)
        label.textColor = UIColor(named: "fontColor")
        return label
    }()
    
    private let phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = L10n.phoneNumberTextfield
        textField.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        textField.textColor = UIColor(named: "fontColor")
        return textField
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.emailLabel
        label.font = UIFont(name: Fonts.exo2Bold, size: 20)
        label.textColor = UIColor(named: "fontColor")
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = L10n.emailTextfield
        textField.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        textField.textColor = UIColor(named: "fontColor")
        return textField
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.passwordLabel
        label.font = UIFont(name: Fonts.exo2Bold, size: 20)
        label.textColor = UIColor(named: "fontColor")
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = L10n.passwordTextfield
        textField.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        textField.textColor = UIColor(named: "fontColor")
        return textField
    }()
    
    private let updateButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 47
        button.setTitle(L10n.updateButton, for: .normal)
        button.titleLabel?.font = UIFont(name: Fonts.exo2Bold, size: 24)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "buttonColor")
        button.addTarget(self, action: #selector(updateButtonAction), for: .touchUpInside)

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
    var output: ChangeProfilePresenterProtocol!
    
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
        view.backgroundColor = UIColor(named: "backgroundColor")
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        scrollView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
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
        
        stackView.addArrangedSubview(updateButton)
        updateButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().inset(18)
            make.height.equalTo(93)
        }
        
        let backButton = createCustomButton(imageName: "backButton", selector: #selector(backButtonAction))
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func createCustomer() {
        let addressText = addressTextField.text ?? ""
        let addressComponents = addressText.components(separatedBy: ", ")
        
        guard addressComponents.count >= 4 else {
            print("All fields should be fill!")
            return
        }
        
        let street = addressComponents[0]
        let house = Int(addressComponents[1]) ?? 0
        let apartment = addressComponents[2]
        let city = addressComponents[3]
        let country = addressComponents.count > 4 ? addressComponents[4] : ""
        
        let location = Location(country: country, city: city)
        let addressDto = AddressDto(street: street, house: house, apartment: apartment, location: location)
        
        output.updateCustomer(
            email: emailTextField.text ?? "",
            phoneNumber: phoneNumberTextField.text ?? "",
            name: nameTextField.text ?? "",
            surname: surnameTextField.text ?? "",
            gender: "MALE",
            birthdayDate: dateOfBirthTextField.text ?? "",
            adressDto: addressDto,
            passwordHash: "\(passwordTextField.text ?? "")"
        )
    }
    
    private func validateForm() -> Bool {
        var allTextFieldsValid = false
        if Validators.validateName(nameTextField.text ?? "")
            && Validators.validateName(surnameTextField.text ?? "")
            && Validators.validateDateOfBirth(dateOfBirthTextField.text ?? "")
            && Validators.validateNumber(phone: phoneNumberTextField.text ?? "")
            && Validators.validatePassword(password: passwordTextField.text ?? "") {
            allTextFieldsValid = true
            print("Validate successfully")
        } else {
            if !Validators.validateName(nameTextField.text ?? "") {
                showAlert(alertTitle: L10n.errorString, alertMessage: L10n.nameIsNotValidString)
            }
            else if !Validators.validateName(surnameTextField.text ?? "") {
                showAlert(alertTitle: L10n.errorString, alertMessage: L10n.surnameIsNotValidString)
            }
            else if !Validators.validateDateOfBirth(dateOfBirthTextField.text ?? "") {
                showAlert(alertTitle: L10n.errorString, alertMessage: L10n.dateOfBirthIsNotValidString)
            }
            else if !Validators.validateNumber(phone: phoneNumberTextField.text ?? "") {
                showAlert(alertTitle: L10n.errorString, alertMessage: L10n.numberNotValidString)
            }
            else if !Validators.validatePassword(password: passwordTextField.text ?? "") {
                showAlert(alertTitle: L10n.errorString, alertMessage: L10n.passwordNotValidString)
            }
            else if nameTextField.text?.isEmpty ?? true
                || surnameTextField.text?.isEmpty ?? true
                || dateOfBirthTextField.text?.isEmpty ?? true
                || phoneNumberTextField.text?.isEmpty ?? true
                || passwordTextField.text?.isEmpty ?? true {
                showAlert(alertTitle: L10n.errorString, alertMessage: L10n.allFieldsShouldBeFillString)
            }
        }
        return allTextFieldsValid
    }
}

// MARK: - Objc Methods
extension ChangeProfileViewController {
    @objc func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func updateButtonAction() {
        if validateForm() {
            createCustomer()
        } else {
            print("Form not valid")
        }
    }
}

// MARK: - Public Methods
extension ChangeProfileViewController {
    func createAlert(title: String, alertMessage: String) {
        showAlert(alertTitle: title, alertMessage: alertMessage)
    }
}
