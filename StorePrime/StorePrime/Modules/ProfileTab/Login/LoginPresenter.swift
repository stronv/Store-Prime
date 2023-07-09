//
//  LoginPresenter.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 04.07.2023.
//

import Foundation

protocol LoginPresenterProtocol {
    func showSignUp()
    func showSellerSignUp()
    func authCustomer(email: String, password: String)
    func showProtfile()
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
    
    func showSellerSignUp() {
        moduleOutput.toSellerSignUp()
    }
    
    func showProtfile() {
        moduleOutput.toProfile()
    }
    
    private let authManager = AuthenticationManager()
    
    func authCustomer(email: String, password: String) {
        authManager.authenticate(email: email, password: password) { result in
            switch result {
            case let .success(creds):
                self.showProtfile()
                print("Customer authenticated successfully")
                print(creds.accessToken)
                print(creds.refreshToken)
                self.moduleOutput.toProfile()
            case .failure(let error):
                print("Error authenticate customer: \(error)")
                self.view?.showAlertWithError(title: "Error", alertMessage: error.message)
            }
        }
    }
}
