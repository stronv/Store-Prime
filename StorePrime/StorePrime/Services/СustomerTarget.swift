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
    case authCustomer(email: String, password: String)
}

extension СustomerTarget: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://2cc6-85-249-26-250.ngrok-free.app")  else { fatalError("Could not get URL") }
        return url
    }
    
    var path: String {
        switch self {
        case .createCustomer:
            return "customer"
        case .authCustomer:
            return "auth/login"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .createCustomer:
            return .post
        case .authCustomer:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .createCustomer(let customer):
            return .requestJSONEncodable(customer)
            
        case .authCustomer(let email, let password):
            let parameters: [String: String] = [
                "email": email,
                "password": password
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .createCustomer:
            return ["Content-Type": "application/json"]
        case .authCustomer:
            return ["Content-Type": "application/x-www-form-urlencoded"]
        }
    }
}
