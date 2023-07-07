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
    
    private let customerService = СustomerService()
    
    func authCustomer(email: String, password: String) {
        customerService.authCustomer(email: email, password: password) { result in
            switch result {
            case .success:
                print("Customer authenticated successfully")
                self.moduleOutput.toProfile()
            case .failure(let error):
                print("Error authenticate customer: \(error)")
            }
        }
    }
}
