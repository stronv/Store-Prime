//
//  ProfileViewController.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 04.07.2023.
//

import UIKit
import SnapKit

protocol ProfileViewControllerProtocol: AnyObject {
    
}

class ProfileViewController: UIViewController, ProfileViewControllerProtocol {
    // MARK: - UI
    
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profilePicture")
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = UIFont(name: Fonts.exo2Bold, size: 16)
        return label
    }()
    
    private let surnameLabel: UILabel = {
        let label = UILabel()
        label.text = "Surname"
        label.font = UIFont(name: Fonts.exo2Bold, size: 16)
        return label
    }()
    
    private let userDataStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.spacing = 5
        return stackView
    }()
    
    private let accountManagementButton: UIButton = {
        let button = UIButton()
        button.setTitle(L10n.accountManagementButton, for: .normal)
        button.setTitleColor(.customOrange, for: .normal)
        button.titleLabel?.font = UIFont(name: Fonts.exo2ExtraLight, size: 15)
        button.underline()
        return button
    }()
    
    private let financeView: FinanceView = {
        let view = FinanceView()
        return view
    }()
    
    private let purchasesView: PurchasesView = {
        let view = PurchasesView()
        return view
    }()
    
    private let signOutButton: UIButton = {
        let button = UIButton()
        button.setTitle(L10n.signOutButton, for: .normal)
        button.setTitleColor(.customOrange, for: .normal)
        button.titleLabel?.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        button.addTarget(self, action: #selector(signOutButtonAction), for: .touchUpInside)
        button.underline()
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        financeView.delegate = self
        configure()
    }
    
    // MARK: - MVP Properties
    var output: ProfilePresenterProtocol!
    
    // MARK: - Private methods
    private func configure() {
        view.backgroundColor = .white
        userDataStackView.addArrangedSubview(nameLabel)
        userDataStackView.addArrangedSubview(surnameLabel)
        
        view.addSubview(profileImage)
        profileImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(27)
            
        }
        
        view.addSubview(userDataStackView)
        userDataStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(11)
            make.leading.equalTo(profileImage.snp.trailing).offset(7)
        }
        
        view.addSubview(accountManagementButton)
        accountManagementButton.snp.makeConstraints { make in
            make.top.equalTo(userDataStackView.snp.bottom).offset(8)
            make.trailing.equalToSuperview().inset(22)
        }
        
        view.addSubview(signOutButton)
        signOutButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(100)
            make.leading.equalToSuperview().offset(100)
            make.trailing.equalToSuperview().inset(80)
        }
        
        view.addSubview(financeView)
        financeView.snp.makeConstraints { make in
            make.top.equalTo(accountManagementButton).offset(45)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalToSuperview().dividedBy(4)
        }
        
        view.addSubview(purchasesView)
        purchasesView.snp.makeConstraints { make in
            make.top.equalTo(financeView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(signOutButton.snp.bottom).inset(45)
        }
    }
}

// MARK: - Delegate
extension ProfileViewController: AddButtonDelegate {
    func addButtonDelegate() {
        output.showBonucesView()
    }
}

// MARK: - Objc functions
extension ProfileViewController {
    @objc func signOutButtonAction() {
        output.showRegistration()
    }
}
