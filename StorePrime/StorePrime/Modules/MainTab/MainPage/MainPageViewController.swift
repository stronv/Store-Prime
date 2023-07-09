//
//  MainPageViewController.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 03.07.2023.
//

import UIKit
import SnapKit

protocol MainPageViewControllerProtocol: AnyObject {
    
}

class MainPageViewController: UIViewController, MainPageViewControllerProtocol {
    
    private let signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "MAIN PAGE"
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
    
    var output: MainPagePresenter!
}
