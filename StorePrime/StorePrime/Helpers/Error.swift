//
//  Error.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 06.07.2023.
//

import Foundation

enum SignUpError: Error {
    case wrongData
    case noConnection
    case badRequest
}

enum SignInError: Error {
    case wrongData
    case noConnection
    case badRequest
}
//
//enum GenericError: Error {
//    case wrongData
//    case noConnection
//    case badRequest
//    case error
//}
