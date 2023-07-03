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
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "name_label".localized
        label.font = UIFont(name: Fonts.exo2Bold, size: 20)
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите имя"
        textField.font = UIFont(name: Fonts.exo2ExtraaLight, size: 20)
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
        textField.placeholder = "Введите фамилию"
        textField.font = UIFont(name: Fonts.exo2ExtraaLight, size: 20)
        return textField
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        title = "Registration"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let largeTitleAppearance = UINavigationBarAppearance()

                largeTitleAppearance.configureWithOpaqueBackground()
                largeTitleAppearance.backgroundImage = UIImage(named: "navbarBackground")

        navigationController?.navigationBar.standardAppearance = largeTitleAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = largeTitleAppearance
        self.navigationController?.navigationBar.layer.cornerRadius = 30
        self.navigationController?.navigationBar.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
//        self.navigationController?.navigationBar.clipsToBounds = true
//        self.navigationController?.navigationBar.layer.masksToBounds = true
        
        configure()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        nameTextField.setUnderLine()
    }
    
    // MARK: - MVP Properties
    var output: RegistrationPresenter!
    // MARK: - Private methods
    private func configure() {
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(58)
            make.leading.equalToSuperview().inset(38)
        }
        
        view.addSubview(nameTextField)
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(nameLabel).offset(30)
            make.leading.equalToSuperview().offset(38)
            make.trailing.equalToSuperview().inset(38)
            make.height.equalTo(44)
        }
    }
}
