//
//  AuthenticationTarget.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 08.07.2023.
//

import Foundation
import Moya

enum AuthenticationTarget {
    case authenticate(email: String, password: String)
    case authRevoke(token: String)
}

extension AuthenticationTarget: TargetType {
    var baseURL: URL {
        return APIBaseURL.defaultURL.url
    }
    
    var path: String {
        switch self {
        case .authenticate:
            return "auth/login"
        case .authRevoke:
            return "auth/token/revoke"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .authenticate:
            return .post
        case .authRevoke:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .authenticate(let email, let password):
            let parameters: [String: String] = [
                "email": email,
                "password": password
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        case .authRevoke:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .authenticate:
            return ["Content-Type": "application/x-www-form-urlencoded"]
        case .authRevoke(let token):
            return ["Authorization": "Bearer \(token)"]
        }
    }
}
