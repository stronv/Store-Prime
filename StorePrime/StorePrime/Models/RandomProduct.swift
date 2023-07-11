//
//  RandomProduct.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 10.07.2023.
//

import Foundation

// MARK: - RandomProduct
struct RandomProduct: Codable {
    let id: Int
    let title, description: String
    let price: Double
    let sellerID: Int
    let categories: [String]
    let amount: Int
    let imageIDS: [String]

    enum CodingKeys: String, CodingKey {
        case id, title, description, price
        case sellerID = "sellerId"
        case categories, amount
        case imageIDS = "imageIds"
    }
}
