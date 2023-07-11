//
//  Seller.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 11.07.2023.
//

import Foundation

struct Seller: Codable {
    let id: Int
    let email, phoneNumber: String
    let cardBalance: Int
    let name, description: String
    let locationDto: LocationDto
}

// MARK: - LocationDto
struct LocationDto: Codable {
    let country, city: String
}
