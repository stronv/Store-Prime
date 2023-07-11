//
//  ProductCollectionViewCell.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 10.07.2023.
//

import UIKit
import SnapKit

class ProductCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProductCollectionViewCell"
    
    // MARK: - UI
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "cardProduct")
        return image
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.exo2Bold, size: 16)
        label.text = "500Р"
        return label
    }()
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Корм для кошек и собак"
        label.numberOfLines = 0
        label.font = UIFont(name: Fonts.exo2ExtraLight, size: 12)
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
        contentView.layer.cornerRadius = 21
        contentView.clipsToBounds = true
        contentView.layer.borderWidth = 0.4
        contentView.layer.borderColor =  UIColor.customBlack.cgColor
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalToSuperview().dividedBy(1.4)
        }
        
        contentView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().inset(80)
        }
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().inset(15)
        }
        
    }
    
    func configureCell(product: RandomProduct) {
        guard let imageURL = URL(string: "https://ccef-85-249-24-67.ngrok-free.app/photos/\(product.imageIDS.first ?? "")") else {
            print("Couldn't get URL")
            return
        }
        imageView.downloaded(from: imageURL)
        titleLabel.text = product.title
        priceLabel.text = "\(product.price)"
    }
}
