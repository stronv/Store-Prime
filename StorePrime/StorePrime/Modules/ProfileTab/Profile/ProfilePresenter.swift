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
}

class ProfilePresenter: ProfilePresenterProtocol {
    private let moduleOutput: ProfileTabCoordinatorProtocol
    private weak var view: ProfileViewControllerProtocol?
    
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
}
