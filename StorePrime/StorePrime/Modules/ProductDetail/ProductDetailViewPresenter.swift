//
//  ProductDetailViewPresenter.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 10.07.2023.
//

import Foundation

protocol ProductDetailViewPresenterProtocol {
    
}

class ProductDetailViewPresenter: ProductDetailViewPresenterProtocol {
    private let moduleOutput: MainPageCoordinatorProtocol
    private weak var view: ProductDetailViewControllerProtocol?
    
    init(_ moduleOutput: MainPageCoordinatorProtocol, view: ProductDetailViewControllerProtocol) {
        self.moduleOutput = moduleOutput
        self.view = view
    }
}
