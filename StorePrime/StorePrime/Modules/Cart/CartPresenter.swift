//
//  SearchPresenter.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 03.07.2023.
//

import Foundation

protocol CartPresenterProtocol {
    
}

class CartPresenter: CartPresenterProtocol {
    private let moduleOutput: CartCoordinatorProtocol
    private weak var view: CartViewControllerProtocol?
    
    init(_ moduleOutput: CartCoordinatorProtocol, view: CartViewControllerProtocol) {
        self.moduleOutput = moduleOutput
        self.view = view
    }
}
