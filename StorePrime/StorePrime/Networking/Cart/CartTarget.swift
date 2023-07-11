//
//  CartTarget.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 11.07.2023.
//

import Foundation
import Moya

enum CartTarget {
    case addPrdouctToCart(productId: Int, quantity: Int, token: String)
    case getProductInCart(token: String)
}

extension CartTarget: TargetType {
    var baseURL: URL {
        return APIBaseURL.defaultURL.url
    }
    
    var path: String {
        switch self {
        case .addPrdouctToCart(let productId, _, _):
            return "carts/\(productId)"
        case .getProductInCart:
            return "carts"
        }
    }

    var method: Moya.Method {
        switch self {
        case .addPrdouctToCart:
            return .post
        case .getProductInCart:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .addPrdouctToCart(_, let quantity, _):
            let parameters = ["quantity": quantity]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        case .getProductInCart:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .addPrdouctToCart(_, _, let token):
            return ["Content-Type": "application/json",
                    "Authorization": "Bearer \(token)"]
        case .getProductInCart(let token):
            return ["Content-Type": "application/json",
                    "Authorization": "Bearer \(token)"]
        }
    }
}
