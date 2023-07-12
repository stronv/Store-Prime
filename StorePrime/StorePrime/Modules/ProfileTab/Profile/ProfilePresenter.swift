//
//  ProfilePresenter.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 04.07.2023.
//

import Foundation

protocol ProfilePresenterProtocol {
    func showBonucesView()
    func showRegistration()
    func showChangeProfile()
    func showOrders()
    func signOut()
    func getCustomer()
}

class ProfilePresenter: ProfilePresenterProtocol {
    private let moduleOutput: ProfileTabCoordinatorProtocol
    private weak var view: ProfileViewControllerProtocol?
    private let authManager = AuthenticationManager()
    private let customerManager = CustomerManager()
    
    init(_ moduleOutput: ProfileTabCoordinatorProtocol, view: ProfileViewControllerProtocol) {
        self.moduleOutput = moduleOutput
        self.view = view
    }
    
    var customer: ResponceCustomer?
}

// MARK: - Public Methods
extension ProfilePresenter {
    func showBonucesView() {
        moduleOutput.toBonuces()
    }
    
    func showRegistration() {
        moduleOutput.toSignUp()
    }
    
    func showChangeProfile() {
        moduleOutput.toChangeProgile()
    }
    
    func showOrders() {
        moduleOutput.toOrders()
    }
    
    func signOut() {
        if let token = UserDefaults.standard.string(forKey: "refreshToken") {
            authManager.authRevoke(token: token) { result in
                switch result {
                case .success:
                    print("Revoke succes")
                    self.showRegistration()
                case .failure:
                    print("Error Revoke")
                }
            }
        }
    }
    
    func getCustomer() {
        if let token = UserDefaults.standard.string(forKey: "refreshToken") {
            customerManager.getCustomer(token: token) { result in
                switch result {
                case .success(let customer):
                    self.customer = customer
                    self.view?.configureProfileView(customer: customer)
                    print("Customer get successfully")
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
