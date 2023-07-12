//
//  MainPagePresenter.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 03.07.2023.
//

import Foundation

protocol MainPagePresenterProtocol {
    func viewDidLoadEvent()
}

class MainPagePresenter: MainPagePresenterProtocol {
    private let moduleOutput: MainPageCoordinatorProtocol
    private weak var view: MainPageViewControllerProtocol?
    private let productManager = ProductManager()
    
    init(_ moduleOutput: MainPageCoordinatorProtocol, view: MainPageViewControllerProtocol) {
        self.moduleOutput = moduleOutput
        self.view = view
    }
    
    var product: Product?
    var randomProducts: [Product] = []
}

// MARK: - Public Merhods
extension MainPagePresenter {
    func showProductDetail(indexPath: IndexPath) {
        moduleOutput.toProductDetail(product: randomProducts[indexPath.item])
    }
    
    func viewDidLoadEvent() {
        productManager.getRandomProduct { result in
            switch result {
            case .success(let randomProduct):
                self.product = randomProduct
                self.view?.reloadData()
            case .failure(let error):
                print(error)
            }
        }
        
        productManager.getRandomProducts(amount: 3) { result in
            switch result {
            case .success(let randomProducts):
                self.randomProducts = randomProducts
                print(randomProducts)
                self.view?.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
