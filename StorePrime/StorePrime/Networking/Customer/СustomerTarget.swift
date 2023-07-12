//
//  СustomerTarget.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 04.07.2023.
//

import Foundation
import Moya

enum СustomerTarget {
    case createCustomer(customer: Сustomer)
    case updateCustomer(customer: Сustomer, token: String)
    case addBonuses(amount: Int, token: String)
    case getCustomer(token: String)
}

extension СustomerTarget: TargetType {
    var baseURL: URL {
        return APIBaseURL.defaultURL.url
    }
    
    var path: String {
        switch self {
        case .createCustomer:
            return "customer"
        case .updateCustomer:
            return "customer"
        case .addBonuses:
            return "customer"
        case .getCustomer:
            return "customer"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .createCustomer:
            return .post
        case .updateCustomer:
            return .put
        case .addBonuses:
            return .patch
        case .getCustomer:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .createCustomer(let customer):
            return .requestJSONEncodable(customer)
        case .updateCustomer(let customer, _):
            return .requestJSONEncodable(customer)
        case .addBonuses(let amount, _):
            return .requestJSONEncodable(amount)
        case .getCustomer:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .createCustomer:
            return ["Content-Type": "application/json"]
        case .updateCustomer(_, let token):
            return ["Content-Type": "application/json", "Authorization": "Bearer \(token)"]
        case .addBonuses(_, let token):
            return ["Content-Type": "application/json", "Authorization": "Bearer \(token)"]
        case .getCustomer(let token):
            return ["Content-Type": "application/json", "Authorization": "Bearer \(token)"]
        }
    }
}
