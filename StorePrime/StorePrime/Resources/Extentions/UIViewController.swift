//
//  UIViewController.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 03.07.2023.
//

import UIKit
import SnapKit

extension UIViewController {
    func createCustomTitleView(image: String) -> UIView {
        let view = UIView()
        
        let titleImage = UIImageView()
        titleImage.image = UIImage(named: image)
        titleImage.tintColor = UIColor.black
        view.addSubview(titleImage)
        
        titleImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(38)
            make.width.equalTo(38)
        }
        return view
    }
    
    func createCustomButton(imageName: String, selector: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage(
            UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate),
            for: .normal
        )
        button.tintColor = .black
        button.imageView?.contentMode = .scaleAspectFit
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: selector, for: .touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: button)
        return menuBarItem
    }
}
