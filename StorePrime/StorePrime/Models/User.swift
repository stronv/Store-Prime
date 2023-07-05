//
//  User.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 04.07.2023.
//

import Foundation

// MARK: - User
struct User: Codable {
    let email, phoneNumber, name, surname: String
    let gender, birthdayDate: String
    let addressDto: AddressDto
    let passwordHash: String
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
