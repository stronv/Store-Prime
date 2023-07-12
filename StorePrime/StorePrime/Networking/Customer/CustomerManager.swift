//
//  CustomerManager.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 04.07.2023.
//

import Foundation
import Moya

protocol CustomerManagerProtocol {
    func createСustomer(customer: Сustomer, completion: @escaping (Result<ResponceCustomer, GenericError>) -> Void)
    func updateСustomer(customer: Сustomer, token: String, completion: @escaping (Result<ResponceCustomer, GenericError>) -> Void)
    func addBonuses(amount: Int, token: String, completion: @escaping (Result<ResponceCustomer, GenericError>) -> Void)
    
}

final class CustomerManager: CustomerManagerProtocol {
    private let provider = MoyaProvider<СustomerTarget>()
    func createСustomer(customer: Сustomer, completion: @escaping (Result<ResponceCustomer, GenericError>) -> Void) {
        provider.request(.createCustomer(customer: customer)) { result in
            switch result {
            case let .success(response):
                if let customer = try? JSONDecoder().decode(ResponceCustomer.self, from: response.data) {
                    return completion(.success(customer))
                } else if let error = try? JSONDecoder().decode(GenericError.self, from: response.data) {
                    return completion(.failure(error))
                } else {
                    return completion(.failure(.defaultError))
                }
            case let .failure(error):
                completion(.failure(GenericError(
                    message: error.localizedDescription,
                    status: error.errorCode,
                    serviceMessage: error.errorDescription ?? "")))
            }
        }
    }
    
    func updateСustomer(customer: Сustomer, token: String, completion: @escaping (Result<ResponceCustomer, GenericError>) -> Void) {
        let bearerToken = "Bearer \(token)"
        provider.request(.updateCustomer(customer: customer, token: bearerToken)) { result in
            switch result {
            case let .success(response):
                if let customer = try? JSONDecoder().decode(ResponceCustomer.self, from: response.data) {
                    return completion(.success(customer))
                } else if let error = try? JSONDecoder().decode(GenericError.self, from: response.data) {
                    return completion(.failure(error))
                } else {
                    return completion(.failure(.defaultError))
                }
            case let .failure(error):
                completion(.failure(GenericError(
                    message: error.localizedDescription,
                    status: error.errorCode,
                    serviceMessage: error.errorDescription ?? "")))
            }
        }
    }
    
    func addBonuses(amount: Int, token: String, completion: @escaping (Result<ResponceCustomer, GenericError>) -> Void) {
        provider.request(.addBonuses(amount: amount, token: token)) { result in
            switch result {
            case let .success(response):
                if let customer = try? JSONDecoder().decode(ResponceCustomer.self, from: response.data) {
                    print(customer)
                    return completion(.success(customer))
                } else if let error = try? JSONDecoder().decode(GenericError.self, from: response.data) {
                    return completion(.failure(error))
                } else {
                    return completion(.failure(.defaultError))
                }
            case let .failure(error):
                completion(.failure(GenericError(
                    message: error.localizedDescription,
                    status: error.errorCode,
                    serviceMessage: error.errorDescription ?? "")))
            }
        }
    }
}
