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
}

class ProfilePresenter: ProfilePresenterProtocol {
    private let moduleOutput: ProfileTabCoordinatorProtocol
    private weak var view: ProfileViewControllerProtocol?
    private let authManager = AuthenticationManager()
    
    init(_ moduleOutput: ProfileTabCoordinatorProtocol, view: ProfileViewControllerProtocol) {
        self.moduleOutput = moduleOutput
        self.view = view
    }
    
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
            print(token)
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
}
