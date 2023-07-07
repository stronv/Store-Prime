//
//  UserService.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 04.07.2023.
//

import Foundation
import Moya

class СustomerService {
    let provider = MoyaProvider<СustomerTarget>()
    
    func createСustomer(customer: Сustomer, completion: @escaping (Result<Void, SignUpError>) -> Void) {
        provider.request(.createCustomer(customer: customer)) { result in
            switch result {
            case let .success(response):
                
                if response.response?.statusCode == 404 {
                    print("Bad request")
                    return completion(.failure(.badRequest))
                }
                
                if let statusCode = response.response?.statusCode, !(200...300).contains(statusCode) {
                    print("Wrong Data")
                    print(response.response)
                    return completion(.failure(.wrongData))
                } else {
                    print("Success")
                    return completion(.success(()))
                }
            case .failure:
                print("No Connection")
                completion(.failure(.noConnection))
            }
        }
    }
    
    func authCustomer(email: String, password: String, completion: @escaping (Result<Void, SignInError>) -> Void) {
        provider.request(.authCustomer(email: email, password: password)) { result in
            switch result {
            case let .success(response):
                if response.response?.statusCode == 440 {
                    print("Bad request")
                    return completion(.failure(.badRequest))
                }
                
                if response.response?.statusCode == 500 {
                    print("Bad request")
                    return completion(.failure(.badRequest))
                }
                if let statusCode = response.response?.statusCode, !(200...300).contains(statusCode) {
                    print(response.response)
                    return completion(.failure(.wrongData))
                } else {
                    print("Success")
                    return completion(.success(()))
                }
            case .failure:
                print("No Connection")
                completion(.failure(.noConnection))
            }
        }
    }
}
