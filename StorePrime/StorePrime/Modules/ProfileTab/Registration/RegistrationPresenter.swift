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
    func createCustomer(email: String, phoneNumber: String, name: String, surname: String, gender: String, birthdayDate: String, adressDto: AddressDto,passwordHash: String)
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
    
    private let customerService = СustomerService()
    
    func createCustomer(email: String, phoneNumber: String, name: String, surname: String, gender: String, birthdayDate: String, adressDto: AddressDto,passwordHash: String) {
            let customer = Сustomer(email: email, phoneNumber: phoneNumber, name: name, surname: surname, gender: gender, birthdayDate: birthdayDate, addressDto: adressDto, passwordHash: passwordHash)
            
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

//ТАКОЙ ДОЛЖЕН НА БЕК УХОДИТЬ(этот уже ушел, лежит в базе):
//func createCustomer() {
//    let customer = Сustomer(
//        email: "example@email.com",
//        phoneNumber: "123456789",
//        name: "John",
//        surname: "Doe",
//        gender: "MALE",
//        birthdayDate: "1990-01-01",
//        addressDto: AddressDto(
//            street: "Street",
//            house: 123,
//            apartment: "Apt 1",
//            location: Location(
//                country: "Country",
//                city: "City")
//        ),
//        passwordHash: "passwordHash"
//    )
