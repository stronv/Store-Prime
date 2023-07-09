//
//  GenericError.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 08.07.2023.
//

import Foundation

// MARK: - GenericError
struct GenericError: Codable, Error {
    let message: String
    let status: Int
    let serviceMessage: String
    
    static let defaultError = GenericError(message: "Wow, unpredictable problem", status: 1000, serviceMessage: "Some problem in server")
}
