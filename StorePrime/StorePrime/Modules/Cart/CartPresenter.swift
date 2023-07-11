//
//  SearchPresenter.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 03.07.2023.
//

import Foundation

protocol CartPresenterProtocol {
    func viewDidLoadEvent()
}

class CartPresenter: CartPresenterProtocol {
    private let moduleOutput: CartCoordinatorProtocol
    private weak var view: CartViewControllerProtocol?
    private let cartManager = CartManager()
    
    init(_ moduleOutput: CartCoordinatorProtocol, view: CartViewControllerProtocol) {
        self.moduleOutput = moduleOutput
        self.view = view
    }
    
    var prdouctsInCart: [ProductInCart] = []
    
    private func getProductsInCart() {
        if let token = UserDefaults.standard.string(forKey: "refreshToken") {
            cartManager.getProductsInCart(token: token) { result in
                switch result {
                    // TODO: - Create alert with messages
                case .success(let products):
                    self.prdouctsInCart = products
                    self.view?.reloadData()
                    print(products)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func countAmount() {
        var amount = 0.0
        for i in prdouctsInCart {
            amount += i.product.price
        }
        print(amount)
        self.view?.configureAmonut(amount: amount)
    }
    
    func viewDidLoadEvent() {
        getProductsInCart()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.countAmount()
        }
    }
}
