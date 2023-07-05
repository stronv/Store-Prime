//
//  RegistrationPresenter.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 02.07.2023.
//

import Foundation

protocol RegistrationPresenterProtocol {
    func showSignIn()
}

class RegistrationPresenter: RegistrationPresenterProtocol {
    private let moduleOutput: ProfileTabCoordinatorProtocol
    private weak var view: RegistrationViewControllerProtocol?
    
    init(_ moduleOutput: ProfileTabCoordinatorProtocol, view: RegistrationViewControllerProtocol) {
        self.moduleOutput = moduleOutput
        self.view = view
    }
    
    func showSignIn() {
        moduleOutput.toSignIn()
    }
}
