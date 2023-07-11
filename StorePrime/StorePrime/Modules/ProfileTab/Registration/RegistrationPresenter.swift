//
//  RegistrationPresenter.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 02.07.2023.
//

import Foundation

protocol RegistrationPresenterProtocol {
    func showSignIn()
    func showSellerSignUp()
    func createCustomer(email: String, phoneNumber: String, name: String, surname: String, gender: String, birthdayDate: String, adressDto: AddressDto, passwordHash: String)
    func showProfile()
}

class RegistrationPresenter: RegistrationPresenterProtocol {
    private let moduleOutput: ProfileTabCoordinatorProtocol
    private weak var view: RegistrationViewControllerProtocol?
    private let customerManager = CustomerManager()
    private let authManager = AuthenticationManager()
    
    init(_ moduleOutput: ProfileTabCoordinatorProtocol,
         view: RegistrationViewControllerProtocol) {
        self.moduleOutput = moduleOutput
        self.view = view
    }
}

// MARK: - Public methods
extension RegistrationPresenter {
    func showSignIn() {
        moduleOutput.toSignIn()
    }
    
    func showSellerSignUp() {
        moduleOutput.toSellerSignUp()
    }
    
    func showProfile() {
        moduleOutput.toProfile()
    }
    
    func createCustomer(
        email: String,
        phoneNumber: String,
        name: String,
        surname: String,
        gender: String,
        birthdayDate: String,
        adressDto: AddressDto,
        passwordHash: String
    ) {
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
        
        customerManager.createСustomer(customer: customer) { result in
            switch result {
            case .success:
                print("Customer created successfully")
                self.authManager.authenticate(email: email, password: passwordHash) { result in
                    switch result {
                    case .success:
                        print("Customer auth successfully")
                        self.showProfile()
                    case .failure(let error):
                        print("Error creating customer: \(error)")
                    }
                }
                self.showProfile()
            case .failure(let error):
                print("Error creating customer: \(error)")
                self.view?.showAlertWithError(title: "Error", alertMessage: error.message)
            }
        }
    }
}
