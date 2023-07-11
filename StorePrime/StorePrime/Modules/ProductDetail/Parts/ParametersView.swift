//
//  ParametersView.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 11.07.2023.
//

import UIKit
import SnapKit

class ParametersView: UIView {
    // MARK: - UI
    private let parametersLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.parametersLabel
        label.font = UIFont(name: Fonts.exo2Bold, size: 20)
        label.numberOfLines = 0
        return label
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.categoryLabel
        label.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        return label
    }()
    
    private let categoryValueLabel: UILabel = {
        let label = UILabel()
        label.text = "Посуда"
        label.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        return label
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.addressLabel
        label.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        return label
    }()
    
    private let addressValueLabel: UILabel = {
        let label = UILabel()
        label.text = "Россия, Москва"
        label.numberOfLines = 0
        label.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        return label
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configure()
    }
    
    private func configure() {
        addSubview(parametersLabel)
        parametersLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.leading.equalToSuperview().offset(17)
            make.trailing.equalToSuperview().inset(17)
        }
        addSubview(categoryLabel)
        categoryLabel.snp.makeConstraints { make in
            make.top.equalTo(parametersLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(17)
            make.trailing.equalToSuperview().inset(17)
        }
        
        addSubview(categoryValueLabel)
        categoryValueLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(17)
            make.leading.equalTo(categoryLabel.snp.leading).offset(250)
            make.top.equalTo(parametersLabel.snp.bottom).offset(30)
        }
        
        addSubview(addressLabel)
        addressLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(17)
            make.trailing.equalToSuperview().inset(17)
            make.top.equalTo(categoryLabel.snp.bottom).offset(30)
        }
        
        addSubview(addressValueLabel)
        addressValueLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(17)
            make.leading.equalTo(addressLabel.snp.leading).offset(250)
            make.top.equalTo(categoryLabel.snp.bottom).offset(30)
        }
    }
}
