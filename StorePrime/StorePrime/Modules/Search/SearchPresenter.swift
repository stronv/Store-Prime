//
//  SearchPresenter.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 03.07.2023.
//

import Foundation

protocol SerachPresenterProtocol {
    
}

class SearchPresenter: SerachPresenterProtocol {
    private let moduleOutput: SearchCoordinatorProtocol
    private weak var view: SearchViewControllerProtocol?
    
    init(_ moduleOutput: SearchCoordinatorProtocol, view: SearchViewControllerProtocol) {
        self.moduleOutput = moduleOutput
        self.view = view
    }
    
    var categories: [String] = [ "Зоотовары", "Игрушки", "Продукты", "Цветы", "Зоотовары", "Игрушки", "Продукты", "Цветы", "Зоотовары", "Игрушки", "Продукты", "Цветы"]
}
