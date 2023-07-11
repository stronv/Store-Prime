//
//  DescriptionView.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 11.07.2023.
//

import UIKit
import SnapKit

protocol ConfigureViewDelegate: AnyObject {
    func configureDelegate()
}

class DescriptionView: UIView {
    
    // MARK: - UI
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Чайник заварочный стеклянный 900 мл"
        label.font = UIFont(name: Fonts.exo2Bold, size: 24)
        label.numberOfLines = 0
        return label
    }()
    
    private let sellerName: UILabel = {
        let label = UILabel()
        label.text = "Мир чая"
        label.font = UIFont(name: Fonts.exo2Bold, size: 16)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "900 Руб"
        label.font = UIFont(name: Fonts.exo2Bold, size: 24)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        label.text = "Заварочный чайник из жаропрочного стекла - то, в чем нуждается ваша кухня! Большой стеклянный чайник идеально подходит для распития..."
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
    
    // MARK: - Private metohds
    private func configure() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.leading.equalToSuperview().offset(17)
            make.trailing.equalToSuperview().inset(17)
        }
        
        addSubview(sellerName)
        sellerName.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(25)
            make.leading.equalToSuperview().offset(70)
            
        }
        
        addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(25)
            make.trailing.equalToSuperview().inset(17)
        }
        
        addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(17)
            make.trailing.equalToSuperview().inset(17)
        }
        
        backgroundColor = .white
    }
}
