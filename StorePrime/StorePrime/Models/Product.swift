//
//  RandomProduct.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 10.07.2023.
//

import Foundation

// MARK: - Product
struct Product: Codable {
    let id: Int
    let title, description: String
    let price: Double
    let sellerID: Int
    let sellerName: String
    let sellerLocation: SellerLocation
    let categories: [String]
    let amount: Int
    let imageIDS: [String]

    enum CodingKeys: String, CodingKey {
        case id, title, description, price
        case sellerID = "sellerId"
        case sellerName, sellerLocation, categories, amount
        case imageIDS = "imageIds"
    }
}

// MARK: - SellerLocation
struct SellerLocation: Codable {
    let country, city: String
}
