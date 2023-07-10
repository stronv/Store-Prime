//
//  AuthenticationManager.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 08.07.2023.
//

import Foundation
import Moya

protocol AuthenticationManagerProtocol {
    func authenticate(email: String, password: String, completion: @escaping (Result<Authentication, GenericError>) -> Void)
    func authRevoke(token: String, completion: @escaping (Result<Void, GenericError>) -> Void)
}

class AuthenticationManager: AuthenticationManagerProtocol {
    private let provider = MoyaProvider<AuthenticationTarget>()
    
    func authenticate(email: String, password: String, completion: @escaping (Result<Authentication, GenericError>) -> Void) {
        provider.request(.authenticate(email: email, password: password)) { result in
            switch result {
            case let .success(response):
                if let authCreds = try? JSONDecoder().decode(Authentication.self, from: response.data) {
                    UserDefaults.standard.set(authCreds.accessToken, forKey: "accessToken")
                    UserDefaults.standard.set(authCreds.refreshToken, forKey: "refreshToken")
                    return completion(.success(authCreds))
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
    
    func authRevoke(token: String, completion: @escaping (Result<Void, GenericError>) -> Void) {
        let bearerToken = "Bearer \(token)"
        provider.request(.authRevoke(token: bearerToken)) { result in
            switch result {
            case let .success(response):
                if let error = try? JSONDecoder().decode(GenericError.self, from: response.data) {
                    return completion(.failure(error))
                } else {
                    UserDefaults.standard.removeObject(forKey: "accessToken")
                    UserDefaults.standard.removeObject(forKey: "refreshToken")
                    return completion(.success(Void()))
                }
            case let .failure(error):
                completion(.failure(GenericError(message: error.localizedDescription, status: error.errorCode, serviceMessage: error.errorDescription ?? "")))
            }
        }
    }
}
