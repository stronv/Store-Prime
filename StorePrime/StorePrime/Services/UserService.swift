//
//  UserService.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 04.07.2023.
//

import Foundation
import Moya


class UserService {
    let provider = MoyaProvider<UserTarget>()
    
    func createUser(user: User, completion: @escaping (Result<Void, Error>) -> Void) {
        provider.request(.createUser(user: user)) { result in
            switch result {
            case .success:
                completion(.success(()))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}

