//
//  SellerRegistrationPresenter.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 05.07.2023.
//

import Foundation

protocol SellerRegistrationPresenterProtocol {
    func showSignIn()
    func showCustomerSignUp()
}

class SellerRegistrationPresenter: SellerRegistrationPresenterProtocol {
    private let moduleOutput: ProfileTabCoordinatorProtocol
    private weak var view: SellerRegistrationViewControllerProtocol?
    
    init(_ moduleOutput: ProfileTabCoordinatorProtocol,
         view: SellerRegistrationViewControllerProtocol) {
        self.moduleOutput = moduleOutput
        self.view = view
    }
    
    func showSignIn() {
        moduleOutput.toSignIn()
    }
    
    func showCustomerSignUp() {
        moduleOutput.toSignUp()
    }
}
