//
//  PhotoTarget.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 11.07.2023.
//

import Foundation
import Moya

enum PhotoTarget {
    case getPhoto(id: String)
}

extension PhotoTarget: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://ccef-85-249-24-67.ngrok-free.app")  else { fatalError("Could not get URL") }
        return url
    }
    
    var path: String {
        switch self {
        case .getPhoto(let id):
            return "photos/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getPhoto:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getPhoto:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/octet-stream"]
    }
}
