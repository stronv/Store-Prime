//
//  HeaderCollectionView.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 10.07.2023.
//

import UIKit
import SnapKit

class HeaderCollectionView: UICollectionReusableView {
    
    static let identifier = "HeaderCollectionView"
    
    private let productImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "cardExample")
        return image
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.backgroundColor = .customBlack
        stackView.spacing = 0
        stackView.layer.cornerRadius = 24
        return stackView
    }()
    
    private let bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.backgroundColor = .customBlack
        stackView.alignment = .center
        return stackView
    }()
    
    private let haveTimeToBuyLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.haveTimeToBuyLabel
        label.font = UIFont(name: Fonts.exo2Bold, size: 24)
        label.textColor = .white
        return label
    }()
    
    private let productTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "тушь sesnsa  tional"
        label.font = UIFont(name: Fonts.exo2Bold, size: 15)
        label.textColor = .white
        return label
    }()
    
    private let productPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "2849P"
        label.font = UIFont(name: Fonts.exo2Bold, size: 24)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(productImage)
        productImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalToSuperview().dividedBy(1.3)
        }
        
        addSubview(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(productImage.snp.bottom).inset(50)
            make.height.equalToSuperview().dividedBy(3)
        }
        
        mainStackView.addArrangedSubview(haveTimeToBuyLabel)
        haveTimeToBuyLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(15)
        }
        
        bottomStackView.addArrangedSubview(productTitleLabel)
        bottomStackView.addArrangedSubview(productPriceLabel)
        mainStackView.addArrangedSubview(bottomStackView)
        bottomStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
    }
}
