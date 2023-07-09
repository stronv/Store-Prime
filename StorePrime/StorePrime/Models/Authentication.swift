//
//  Authentication.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 08.07.2023.
//

import Foundation

// MARK: - Authentication
struct Authentication: Codable {
    let accessToken, refreshToken: String
}
