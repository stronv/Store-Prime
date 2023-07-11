//
//  ProductTarget.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 10.07.2023.
//

import Foundation
import Moya

enum ProductTarget {
    case getRandomProduct
    case getRandomProducts(amount: Int)
}

extension ProductTarget: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://ccef-85-249-24-67.ngrok-free.app")  else { fatalError("Could not get URL") }
        return url
    }
    
    var path: String {
        switch self {
        case .getRandomProduct:
            return "products/random"
        case .getRandomProducts(let amount):
            return"products/random/\(amount)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getRandomProduct:
            return .get
        case .getRandomProducts:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getRandomProduct:
            return .requestPlain
        case .getRandomProducts:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getRandomProduct:
            return ["Content-Type": "application/json"]
        case .getRandomProducts:
            return ["Content-Type": "application/json"]
        }
    }
}
