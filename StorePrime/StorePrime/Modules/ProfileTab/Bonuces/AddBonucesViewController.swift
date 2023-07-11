//
//  AddBonusesViewController.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 07.07.2023.
//

import UIKit
import SnapKit
protocol AddBonusesViewControllerProtocol: AnyObject {
    
}

class AddBonusesViewController: UIViewController, AddBonusesViewControllerProtocol {
    
    // MARK: - UI
    private let paymentAmountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.exo2Bold, size: 32)
        label.text = L10n.paymentAmountLabel
        return label
    }()
    
    private let addBonucesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.layer.cornerRadius = 17
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = UIColor.customBlack.cgColor
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 30, leading: 10, bottom: 30, trailing: 0)
        return stackView
    }()
    
    private let bonusesTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private let bonusesLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.bonusesLabel
        label.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        return label
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 47
        button.setTitle(L10n.addFinancesButton, for: .normal)
        button.titleLabel?.font = UIFont(name: Fonts.exo2Bold, size: 24)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.customBlack
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configure()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        bonusesTextField.setUnderLine()
    }
    
    // MARK: - MVP Properties
    var output: BonusesPresenterProtocol!
    
    // MARK: - Private methods
    private func configure() {
        view.addSubview(paymentAmountLabel)
        paymentAmountLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            make.leading.equalToSuperview().offset(57)
            make.trailing.equalToSuperview().inset(57)
        }
        
        view.addSubview(addBonucesStackView)
        addBonucesStackView.snp.makeConstraints { make in
            make.top.equalTo(paymentAmountLabel.snp.bottom).offset(110)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().inset(60)
        }
        addBonucesStackView.addArrangedSubview(bonusesTextField)
        bonusesTextField.snp.makeConstraints { make in
            make.width.equalTo(160)
        }
        addBonucesStackView.addArrangedSubview(bonusesLabel)
        
        view.addSubview(addButton)
        addButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(120)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().inset(25)
            make.height.equalTo(93)
        }
        
        let backButton = createCustomButton(imageName: "backButton", selector: #selector(backButtonAction))
        navigationItem.leftBarButtonItem = backButton
    }
}

// MARK: - Objc Methods
extension AddBonusesViewController {
    @objc func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
}
