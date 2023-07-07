//
//  FinanceView.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 07.07.2023.
//

import UIKit
import SnapKit

protocol AddButtonDelegate: AnyObject {
    func addButtonDelegate()
}

class FinanceView: UIView {
    
    weak var delegate: AddButtonDelegate?
    // MARK: - UI
    private let financeLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.financeLabel
        label.font = UIFont(name: Fonts.exo2Bold, size: 20)
        return label
    }()
    
    private let bonusesLabel: UILabel = {
        let label = UILabel()
        label.text = "900 \(L10n.bonusesLabel)"
        label.font = UIFont(name: Fonts.exo2Bold, size: 32)
        return label
    }()
    
    private let addFinancesButton: UIButton = {
        let button = UIButton()
        button.setTitle(L10n.addFinancesButton, for: .normal)
        button.setTitleColor(.customOrange, for: .normal)
        button.titleLabel?.font = UIFont(name: Fonts.exo2ExtraLight, size: 15)
        button.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
        button.underline()
        return button
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    // MARK: - Private metohds
    private func setup() {
        addSubview(financeLabel)
        financeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(27)
            make.leading.equalToSuperview().offset(20)
        }
        
        addSubview(bonusesLabel)
        bonusesLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(70)
            make.trailing.equalToSuperview().inset(70)
        }
        
        addSubview(addFinancesButton)
        addFinancesButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(17)
            make.trailing.equalToSuperview().inset(29)
        }
        
        backgroundColor = UIColor.customLightPurple
        layer.cornerRadius = 37
        layer.borderColor = UIColor.boarderColor.cgColor
        layer.borderWidth = 1
    }
}

extension FinanceView {
    // MARK: - Objc functions
    @objc func addButtonAction() {
        print("add Button tapped")
        delegate?.addButtonDelegate()
    }
}
