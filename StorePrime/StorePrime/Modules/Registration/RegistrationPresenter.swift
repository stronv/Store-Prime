//
//  RegistrationPresenter.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 02.07.2023.
//

import Foundation

protocol RegistrationPresenterProtocol {
    
}

class RegistrationPresenter: RegistrationPresenterProtocol {
    private let moduleOutput: RegistrationCoordinatorProtocol
    private weak var view: RegistrationViewControllerProtocol?
    
    init(_ moduleOutput: RegistrationCoordinatorProtocol, view: RegistrationViewControllerProtocol) {
        self.moduleOutput = moduleOutput
        self.view = view
    }
}
