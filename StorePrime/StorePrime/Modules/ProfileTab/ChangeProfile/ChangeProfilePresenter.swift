//
//  ChangeProfilePresenter.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 07.07.2023.
//

import Foundation

protocol ChangeProfilePresenterProtocol {
    
}

class ChangeProfilePresenter: ChangeProfilePresenterProtocol {
    private let moduleOutput: ProfileTabCoordinatorProtocol
    private weak var view: ChangeProfileViewControllerProtocol?
    
    init(_ moduleOutput: ProfileTabCoordinatorProtocol,
         view: ChangeProfileViewControllerProtocol) {
        self.moduleOutput = moduleOutput
        self.view = view
    }
}
