//
//  ProductInCart.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 11.07.2023.
//

import Foundation

struct ProductInCart: Codable {
    let id: Int
    let product: Product
    let customerID, quantity: Int

    enum CodingKeys: String, CodingKey {
        case id, product
        case customerID = "customerId"
        case quantity
    }
}
