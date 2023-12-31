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
        return APIBaseURL.defaultURL.url
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
