//
//  ProductDetailViewPresenter.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 10.07.2023.
//

import Foundation

protocol ProductDetailViewPresenterProtocol {
    var product: Product { get }
    func addToCart(productID: Int, quantity: Int)
}

class ProductDetailViewPresenter: ProductDetailViewPresenterProtocol {
    
    private let moduleOutput: MainPageCoordinatorProtocol
    private weak var view: ProductDetailViewControllerProtocol?
    var product: Product
    
    private let cartManager = CartManager()
    private let sellerManager = SellerManager()
    
    init(_ moduleOutput: MainPageCoordinatorProtocol, view: ProductDetailViewControllerProtocol, product: Product) {
        self.moduleOutput = moduleOutput
        self.view = view
        self.product = product
    }
    
}

// MARK: - Public Methods
extension ProductDetailViewPresenter {
    func addToCart(productID: Int, quantity: Int) {
        if let token = UserDefaults.standard.string(forKey: "refreshToken") {
            cartManager.addToCart(productId: productID, quantity: quantity, token: token) { result in
                switch result {
                    // TODO: - Create alert with messages
                case .success:
                    print("Product added succsessfully!")
                case .failure(let error):
                    print("error to add to card: \(error.localizedDescription)")
                }
            }
        } else {
            print("Token is empty")
        }
    }
}
