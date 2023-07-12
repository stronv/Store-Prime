//
//  BonucesPresenter.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 07.07.2023.
//

import Foundation

protocol BonusesPresenterProtocol {
    func addBonuses(amount: Int)
}

class BonusesPresenter: BonusesPresenterProtocol {
    private let moduleOutput: ProfileTabCoordinatorProtocol
    private weak var view: AddBonusesViewControllerProtocol?
    private let customerManager = CustomerManager()
    
    init(_ moduleOutput: ProfileTabCoordinatorProtocol, view: AddBonusesViewControllerProtocol) {
        self.moduleOutput = moduleOutput
        self.view = view
    }
    
    func addBonuses(amount: Int) {
        if let token = UserDefaults.standard.string(forKey: "accessToken") {
            print(token)
            customerManager.addBonuses(amount: amount, token: token) { result in
                switch result {
                case .success(let customer):
                    print("Bonuses added!")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
