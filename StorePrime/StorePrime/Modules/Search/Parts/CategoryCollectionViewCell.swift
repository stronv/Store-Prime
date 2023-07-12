//
//  CategoryCollectionViewCell.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 12.07.2023.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryCollectionViewCell"
    
    // MARK: - UI
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.exo2Bold, size: 16)
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
    
    // MARK: - Private methods
    private func configure() {
        contentView.backgroundColor = UIColor.customOrange2
        contentView.layer.cornerRadius = 35
        contentView.addSubview(categoryLabel)
        categoryLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}

// MARK: - Public methods
extension CategoryCollectionViewCell {
    func configureCell(category: String) {
        categoryLabel.text = category
    }
}
