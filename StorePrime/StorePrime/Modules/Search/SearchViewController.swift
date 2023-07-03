//
//  SearchViewController.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 03.07.2023.
//

import UIKit

protocol SearchViewControllerProtocol: AnyObject {
    
}

class SearchViewController: UIViewController, SearchViewControllerProtocol {
    
    private let signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "SEARCH"
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
    var output: SearchPresenter!
}
