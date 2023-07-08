//
//  BonucesPresenter.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 07.07.2023.
//

import Foundation

protocol BonusesPresenterProtocol {
    
}

class BonusesPresenter: BonusesPresenterProtocol {
    private let moduleOutput: ProfileTabCoordinatorProtocol
    private weak var view: AddBonusesViewControllerProtocol?
    
    init(_ moduleOutput: ProfileTabCoordinatorProtocol, view: AddBonusesViewControllerProtocol) {
        self.moduleOutput = moduleOutput
        self.view = view
    }
}
