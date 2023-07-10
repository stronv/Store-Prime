//
//  ChangeProfilePresenter.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 07.07.2023.
//

import Foundation

protocol ChangeProfilePresenterProtocol {
    func updateCustomer(email: String, phoneNumber: String, name: String, surname: String, gender: String, birthdayDate: String, adressDto: AddressDto, passwordHash: String)
}

class ChangeProfilePresenter: ChangeProfilePresenterProtocol {
    private let moduleOutput: ProfileTabCoordinatorProtocol
    private weak var view: ChangeProfileViewControllerProtocol?
    private let customerManager = CustomerManager()
    
    init(_ moduleOutput: ProfileTabCoordinatorProtocol,
         view: ChangeProfileViewControllerProtocol) {
        self.moduleOutput = moduleOutput
        self.view = view
    }
    
    func updateCustomer(email: String, phoneNumber: String, name: String, surname: String, gender: String, birthdayDate: String, adressDto: AddressDto, passwordHash: String) {
        let customer = Сustomer(
            email: email,
            phoneNumber: phoneNumber,
            name: name,
            surname: surname,
            gender: gender,
            birthdayDate: birthdayDate,
            addressDto: adressDto,
            passwordHash: passwordHash
        )
        
        if let token = UserDefaults.standard.string(forKey: "accessToken") {
            print(token)
            customerManager.updateСustomer(customer: customer, token: token) { result in
                switch result {
                case .success:
                    print("Customer updated successfully")
                    self.view?.createAlert(title: L10n.successString, alertMessage: L10n.dataSuccessfullyUpdatedString)
                case .failure:
                    print("Customer updated failed")
                    self.view?.createAlert(title: L10n.errorString, alertMessage: L10n.dataCannotUploadedString)
                }
            }
        }
    }
}
