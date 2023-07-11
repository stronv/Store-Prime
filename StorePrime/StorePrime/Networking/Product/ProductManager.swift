//
//  ProductManager.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 10.07.2023.
//

import Foundation
import Moya

protocol ProductManagerProtocol {
    func getRandomProduct(completion: @escaping(Result<Product, GenericError>) -> Void)
    func getRandomProducts(amount: Int, completion: @escaping(Result<[Product], GenericError>) -> Void)
}

class ProductManager: ProductManagerProtocol {
    private let provider = MoyaProvider<ProductTarget>()
    func getRandomProduct(completion: @escaping (Result<Product, GenericError>) -> Void) {
        provider.request(.getRandomProduct) { result in
            switch result {
            case let .success(response):
                if let product = try? JSONDecoder().decode(Product.self, from: response.data) {
                    return completion(.success(product))
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
    
    func getRandomProducts(amount: Int, completion: @escaping(Result<[Product], GenericError>) -> Void) {
        provider.request(.getRandomProducts(amount: amount)) { result in
            switch result {
            case let .success(resopnse):
                if let products = try? JSONDecoder().decode([Product].self, from: resopnse.data) {
                    return completion(.success(products))
                } else if let error = try? JSONDecoder().decode(GenericError.self, from: resopnse.data) {
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
