//
//  SellerManager.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 11.07.2023.
//

import Foundation
import Moya

protocol SellerManagerProtocol {
    func getSeller(sellerId: Int, completion: @escaping(Result<Seller, GenericError>) -> Void)
}

class SellerManager: SellerManagerProtocol {
    private let provider = MoyaProvider<SellerTarget>()
    func getSeller(sellerId: Int, completion: @escaping(Result<Seller, GenericError>) -> Void) {
        provider.request(.getSeller(sellerId: sellerId)) { result in
            switch result {
            case let .success(response):
                if let seller = try? JSONDecoder().decode(Seller.self, from: response.data) {
                    return completion(.success(seller))
                } else if let error = try? JSONDecoder().decode(GenericError.self, from: response.data) {
                    return completion(.failure(error))
                } else {
                    return completion(.failure(.defaultError))
                }
            case let .failure(error):
                completion(.failure(GenericError(message: error.localizedDescription, status: error.errorCode, serviceMessage: error.errorDescription ?? "")))
            }
        }
    }
}
