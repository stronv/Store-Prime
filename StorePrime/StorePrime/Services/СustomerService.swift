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
    
    func createСustomer(customer: Сustomer, completion: @escaping (Result<Void, Error>) -> Void) {
        provider.request(.createCustomer(customer: customer)) { result in
            switch result {
            case .success:
                completion(.success(()))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
