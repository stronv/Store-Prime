//
//  CartViewController.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 03.07.2023.
//

import UIKit
import SnapKit

protocol CartViewControllerProtocol: AnyObject {
    
}

class CartViewController: UIViewController, CartViewControllerProtocol {
    private let signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "CART"
        label.font = UIFont(name: Fonts.exo2Bold, size: 40)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(signUpLabel)
        
        signUpLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    var output: CartPresenter!
}
