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
        image.layer.cornerRadius = 35
        return image
    }()
    
    private let view: UIView = {
        let view = UIView()
        view.backgroundColor = .customBlack
        view.layer.cornerRadius = 35
        
        return view
    }()
    
    private let bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()
    
    private let haveTimeToBuyLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.haveTimeToBuyLabel
        label.font = UIFont(name: Fonts.exo2Bold, size: 24)
        label.textColor = UIColor(named: "fontColor")
        label.textColor = .white
        return label
    }()
    
    private let productTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.exo2Bold, size: 15)
        label.textColor = UIColor(named: "fontColor")
        label.textColor = .white
        return label
    }()
    
    private let productPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.exo2Bold, size: 24)
        label.textColor = UIColor(named: "fontColor")
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
        
        addSubview(view)
        view.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(productImage.snp.bottom).inset(50)
            make.bottom.equalToSuperview()
        }
        
        view.addSubview(haveTimeToBuyLabel)
        haveTimeToBuyLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(15)
        }

        bottomStackView.addArrangedSubview(productTitleLabel)
        bottomStackView.addArrangedSubview(productPriceLabel)
        view.addSubview(bottomStackView)
        bottomStackView.snp.makeConstraints { make in
            make.top.equalTo(haveTimeToBuyLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
    }
}

// MARK: - Public Methods
extension HeaderCollectionView {
    func configure(randomProduct: Product) {
        productTitleLabel.text = randomProduct.title
        productPriceLabel.text = "\(randomProduct.price)"
        guard let imageURL = URL(string: "\(APIBaseURL.defaultURL.url)/photos/\(randomProduct.imageIDS.first ?? "")") else {
            print("Couldn't get URL")
            return
        }
        productImage.downloaded(from: imageURL)
        
    }
}
