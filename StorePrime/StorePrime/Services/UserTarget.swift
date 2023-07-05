//
//  UserTarget.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 04.07.2023.
//

import Foundation
import Moya

enum UserTarget {
    case createUser(user: User)
}

extension UserTarget: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://bc2a-85-249-31-117.ngrok-free.app/swagger-ui/index.html#/")  else { fatalError("Could not get URL") }
        return url
        
//    https://bc2a-85-249-31-117.ngrok-free.app/swagger-ui/index.html#/Customer/addCustomer
    }
    
    var path: String {
        switch self {
        case .createUser:
            return "/Customer/addCustomer"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .createUser:
            return .post
        }
        
    }
    
    var task: Moya.Task {
        switch self {
        case .createUser(let user):
            return .requestJSONEncodable(user)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
