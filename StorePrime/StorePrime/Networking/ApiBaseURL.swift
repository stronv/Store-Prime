//
//  ApiBaseURL.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 11.07.2023.
//

import Foundation

enum APIBaseURL {
    case defaultURL
    
    var url: URL {
        switch self {
        case .defaultURL:
            guard let url = URL(string: "https://59cc-85-249-24-67.ngrok-free.app") else { fatalError("Could not get URL") }
            return url
        }
    }
}
