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
}

extension СustomerTarget: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://1848-85-249-30-200.ngrok-free.app")  else { fatalError("Could not get URL") }
        return url
    }
    
    var path: String {
        switch self {
        case .createCustomer:
            return "customer"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .createCustomer:
            return .post
        }
        
    }
    
    var task: Moya.Task {
        switch self {
        case .createCustomer(let user):
            return .requestJSONEncodable(user)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
