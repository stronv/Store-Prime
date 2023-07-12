//
//  PurchasesView.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 07.07.2023.
//

import UIKit
import SnapKit

protocol OrderButtonDelegate: AnyObject {
    func orderButtonDelegate()
}

class PurchasesView: UIView {
    
    weak var delegate: OrderButtonDelegate?
    
    // MARK: - UI
    private let purchasesLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.purchasesLabel
        label.font = UIFont(name: Fonts.exo2Bold, size: 20)
        label.textColor = UIColor(named: "fontColor")
        return label
    }()
    
    private let ordersButton: UIButton = {
        let button = UIButton()
        button.setTitle(L10n.ordersButton, for: .normal)
        button.titleLabel?.font = UIFont(name: Fonts.exo2ExtraLight, size: 20)
        button.layer.cornerRadius = 11
        button.contentHorizontalAlignment = .left
        button.layer.borderColor = UIColor.boarderColor.cgColor
        button.layer.borderWidth = 1
        button.setTitleColor(UIColor(named: "fontColor"), for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(ordersButtonAction), for: .touchUpInside)
        return button
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
        addSubview(purchasesLabel)
        purchasesLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(27)
            make.leading.equalToSuperview().offset(20)
        }
        
        addSubview(ordersButton)
        ordersButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview().inset(30)
            make.leading.equalToSuperview().offset(28)
            make.trailing.equalToSuperview().inset(28)
            make.height.equalTo(44)
        }
        
        backgroundColor = UIColor(named: "backgroundColor")
        layer.cornerRadius = 37
        layer.borderColor = UIColor.boarderColor.cgColor
        layer.borderWidth = 1
    }
}

extension PurchasesView {
    // MARK: - Objc functions
    @objc func ordersButtonAction() {
        delegate?.orderButtonDelegate()
    }
}
