//
//  Сustomer.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 04.07.2023.
//

import Foundation

// MARK: - Сustomer
struct Сustomer: Codable {
    let email, phoneNumber, name, surname: String
    let gender, birthdayDate: String
    let addressDto: AddressDto
    let passwordHash: String?
}

// MARK: - AddressDto
struct AddressDto: Codable {
    let street: String
    let house: Int
    let apartment: String
    let location: Location
}

// MARK: - Location
struct Location: Codable {
    let country, city: String
}

// MARK: - ResponceCustomer
struct ResponceCustomer: Codable {
    let id: Int
    let email, phoneNumber: String
    let cardBalance: Int?
    let name, surname, gender: String
    let birthdayDate: String
    let addressDto: AddressDto
}
