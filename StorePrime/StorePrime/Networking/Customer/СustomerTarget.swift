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
}

extension СustomerTarget: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://ccef-85-249-24-67.ngrok-free.app")  else { fatalError("Could not get URL") }
        return url
    }
    
    var path: String {
        switch self {
        case .createCustomer:
            return "customer"
        case .updateCustomer:
            return "customer"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .createCustomer:
            return .post
        case .updateCustomer:
            return .put
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .createCustomer(let customer):
            return .requestJSONEncodable(customer)
        case .updateCustomer(let customer, _):
            return .requestJSONEncodable(customer)
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .createCustomer:
            return ["Content-Type": "application/json"]
        case .updateCustomer(_, let token):
            return ["Content-Type": "application/json", "Authorization": token]

        }
    }
}
