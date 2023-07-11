//
//  OrderTarget.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 11.07.2023.
//

import Foundation
import Moya

enum OrderTarget {
    case createOrder(productsIdFromCart: [Int], token: String)
    case getOrders(token: String)
}

extension OrderTarget: TargetType {
    var baseURL: URL {
        return APIBaseURL.defaultURL.url
    }
    
    var path: String {
        switch self {
        case .createOrder:
            return "orders"
        case .getOrders:
            return "orders/all"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .createOrder:
            return .post
        case .getOrders:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .createOrder(let productsFromCart, _):
            return .requestJSONEncodable(productsFromCart)
        case .getOrders:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .createOrder(_, let token):
            return ["Content-Type": "application/json",
                    "Authorization": "Bearer \(token)"]
        case .getOrders(let token):
            return ["Content-Type": "application/json",
                    "Authorization": "Bearer \(token)"]
        }
    }
}
