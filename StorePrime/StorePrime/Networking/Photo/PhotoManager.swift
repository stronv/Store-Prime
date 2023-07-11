//
//  PhotoManager.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 11.07.2023.
//

import Foundation
import Moya

protocol PhotoManagerProtocol {
    func getPhoto(id: String, completion: @escaping(Result<Data, GenericError>) -> Void)
}

class PhotoManager: PhotoManagerProtocol {
    private let provider = MoyaProvider<PhotoTarget>()
    func getPhoto(id: String, completion: @escaping (Result<Data, GenericError>) -> Void) {
        //
    }
}
