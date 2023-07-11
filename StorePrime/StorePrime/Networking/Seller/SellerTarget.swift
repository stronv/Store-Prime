//
//  SellerTarget.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 11.07.2023.
//

import Foundation
import Moya

enum SellerTarget {
    case getSeller(sellerId: Int)
}

extension SellerTarget: TargetType {
    var baseURL: URL {
        return APIBaseURL.defaultURL.url
    }
    
    var path: String {
        switch self {
        case .getSeller(let sellerId):
            return "seller/\(sellerId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getSeller:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getSeller:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case.getSeller:
            return ["Content-Type": "application/json"]
        }
    }
}
