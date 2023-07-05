//
//  LoginPresenter.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 04.07.2023.
//

import Foundation

protocol LoginPresenterProtocol {
    func showSignUp()
}

class LoginPresenter: LoginPresenterProtocol {
    private let moduleOutput: ProfileTabCoordinatorProtocol
    private weak var view: LoginViewControllerProtocol?
    
    init(_ moduleOutput: ProfileTabCoordinatorProtocol, view: LoginViewControllerProtocol) {
        self.moduleOutput = moduleOutput
        self.view = view
    }
    
    func showSignUp() {
        moduleOutput.toSignUp()
    }
}
