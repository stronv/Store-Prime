//
//  CartManager.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 11.07.2023.
//

import Foundation
import Moya

protocol CartManagerProtocol {
    func addToCart(productId: Int, quantity: Int, token: String, completion: @escaping (Result<ProductInCart, GenericError>) -> Void)
    func getProductsInCart(token: String, completion: @escaping(Result<[ProductInCart], GenericError>) -> Void)
}

class CartManager: CartManagerProtocol {
    private let provider = MoyaProvider<CartTarget>()
    
    func addToCart(productId: Int, quantity: Int, token: String, completion: @escaping (Result<ProductInCart, GenericError>) -> Void) {
        provider.request(.addPrdouctToCart(productId: productId, quantity: quantity, token: token)) { result in
            switch result {
            case let .success(response):
                if let productInCart = try? JSONDecoder().decode(ProductInCart.self, from: response.data) {
                    return completion(.success(productInCart))
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
    
    func getProductsInCart(token: String, completion: @escaping(Result<[ProductInCart], GenericError>) -> Void) {
        provider.request(.getProductInCart(token: token)) { result in
            switch result {
            case let .success(response):
                if let productInCart = try? JSONDecoder().decode([ProductInCart].self, from: response.data) {
                    return completion(.success(productInCart))
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
