//
//  Order.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 11.07.2023.
//

import Foundation

struct Order: Codable {
    let id: Int
    let status: String
    let product: Product
    let customerID, quantity: Int

    enum CodingKeys: String, CodingKey {
        case id, status, product
        case customerID = "customerId"
        case quantity
    }
}
