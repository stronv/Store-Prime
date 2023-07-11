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
        return APIBaseURL.defaultURL.url
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
