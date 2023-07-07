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
    
    init(_ moduleOutput: ProfileTabCoordinatorProtocol,
         view: RegistrationViewControllerProtocol) {
        self.moduleOutput = moduleOutput
        self.view = view
    }
    
    func showSignIn() {
        moduleOutput.toSignIn()
    }
    
    func showSellerSignUp() {
        moduleOutput.toSellerSignUp()
    }
    
    func showProfile() { // - remove later
        moduleOutput.toProfile()
    }
    
    private let customerService = СustomerService()

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
        
        customerService.createСustomer(customer: customer) { result in
            switch result {
            case .success:
                print("Customer created successfully")
            case .failure(let error):
                print("Error creating customer: \(error)")
            }
        }
    }
}
