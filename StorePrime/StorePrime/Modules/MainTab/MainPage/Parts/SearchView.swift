//
//  SearchView.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 09.07.2023.
//

import UIKit
import SnapKit

class SearchView: UIView {
    
    // MARK: - UI
    private let searchTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 25
        textField.clipsToBounds = false
        textField.layer.shadowOpacity = 0.1
        textField.layer.shadowOffset = CGSize(width: 0, height: 0)
        textField.layer.cornerRadius = 25
        textField.backgroundColor = .customOrange
        textField.setIcon(UIImage(imageLiteralResourceName: "searchIcon"))
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        textField.rightView = paddingView
        textField.rightViewMode = .always
        return textField
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
        backgroundColor = .customOrange2
        layer.cornerRadius = 15
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        addSubview(searchTextField)
        searchTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }
    }
}
