//
//  OrderManager.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 11.07.2023.
//

import Foundation
import Moya

protocol OrderManagerProtocol {
    func createOrder(productsIdFromCart: [Int], token: String, completion: @escaping (Result<[Order], GenericError>) -> Void)
    func getOrders(token: String, completion: @escaping (Result<[Order], GenericError>) -> Void)
}

class OrderManager: OrderManagerProtocol {
    private let provider = MoyaProvider<OrderTarget>()
    
    func createOrder(productsIdFromCart: [Int], token: String, completion: @escaping (Result<[Order], GenericError>) -> Void) {
        provider.request(.createOrder(productsIdFromCart: productsIdFromCart, token: token)) { result in
            switch result {
            case let .success(response):
                if let orders = try? JSONDecoder().decode([Order].self, from: response.data) {
                    return completion(.success(orders))
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
    
    func getOrders(token: String, completion: @escaping (Result<[Order], GenericError>) -> Void) {
        provider.request(.getOrders(token: token)) { result in
            switch result {
            case let .success(response):
                if let orders = try? JSONDecoder().decode([Order].self, from: response.data) {
                    return completion(.success(orders))
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
