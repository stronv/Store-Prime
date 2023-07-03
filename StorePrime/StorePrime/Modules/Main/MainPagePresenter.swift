//
//  MainPagePresenter.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 03.07.2023.
//

import Foundation

protocol MainPagePresenterProtocol {
    
}

class MainPagePresenter: MainPagePresenterProtocol {
    private let moduleOutput: MainPageCoordinatorProtocol
    private weak var view: MainPageViewControllerProtocol?
    
    init(_ moduleOutput: MainPageCoordinatorProtocol, view: MainPageViewControllerProtocol) {
        self.moduleOutput = moduleOutput
        self.view = view
    }
}
