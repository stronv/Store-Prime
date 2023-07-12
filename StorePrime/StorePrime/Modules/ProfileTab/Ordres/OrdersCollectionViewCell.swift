//
//  OrdersCollectionViewCell.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 08.07.2023.
//

import UIKit
import SnapKit

class OrdersCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "OrdersCollectionViewCell"
    
    // MARK: - UI
    private let orderLabel: UILabel = {
        let label = UILabel()
        label.text = "Заказ"
        label.font = UIFont(name: Fonts.exo2Bold, size: 24)
        return label
    }()
    
    private let orderNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "Q8980E8RR9ER"
        label.font = UIFont(name: Fonts.exo2Bold, size: 24)
        return label
    }()
    
    private let orderAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "1537Р"
        label.font = UIFont(name: Fonts.exo2Bold, size: 24)
        label.setContentHuggingPriority(UILayoutPriority(251), for: .horizontal)
        return label
    }()
    
    private let orderStatusLabel: UILabel = {
        let label = UILabel()
        label.text = "Готов к получению"
        label.layer.cornerRadius = 24
        label.layer.masksToBounds = true
        label.textAlignment = .center
        label.backgroundColor = UIColor.customOrange2
        return label
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .leading
        return stackView
    }()
    
    private let secondStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .leading
        return stackView
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
        
        mainStackView.addArrangedSubview(orderLabel)
        secondStackView.addArrangedSubview(orderNumberLabel)
        secondStackView.addArrangedSubview(orderAmountLabel)
        mainStackView.addArrangedSubview(secondStackView)
        mainStackView.addArrangedSubview(orderStatusLabel)
        contentView.addSubview(mainStackView)
        contentView.layer.cornerRadius = 37
        contentView.layer.borderColor = UIColor.boarderColor.cgColor
        contentView.layer.borderWidth = 1
        contentView.backgroundColor = .white
        
        mainStackView.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp_leadingMargin).offset(21)
            make.trailing.equalTo(contentView.snp_trailingMargin).inset(21)
            make.top.equalTo(contentView.snp_topMargin)
            make.bottom.equalTo(contentView.snp_bottomMargin)
        }
        
        secondStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        orderStatusLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(47)
        }
    }
}

extension OrdersCollectionViewCell {
    func cnfigureOrderCell(order: Order) {
        orderNumberLabel.text = order.product.title
    }
}
