//
//  OrdersPresenter.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 08.07.2023.
//

import Foundation

protocol OrdersPresenterProtocol {
    func viewDidLoadEvent()
}

class OrdersPresenter: OrdersPresenterProtocol {
    private let moduleOutput: ProfileTabCoordinatorProtocol
    private weak var view: OrdersViewControllerProtocol?
    let ordersManager = OrderManager()
    
    init(_ moduleOutput: ProfileTabCoordinatorProtocol,
         view: OrdersViewControllerProtocol) {
        self.moduleOutput = moduleOutput
        self.view = view
    }
    
    var orders: [Order] = []
    
    private func obtainOrders() {
        if let token = UserDefaults.standard.string(forKey: "refreshToken") {
            ordersManager.getOrders(token: token) { result in
                switch result {
                case .success(let orders):
                    self.orders = orders
                    print(orders)
                    print("Orders get successfully!")
                case .failure(let error):
                    print(error.localizedDescription)
                }
                
            }
        }
    }
}

extension OrdersPresenter {
    func viewDidLoadEvent() {
        self.obtainOrders()
    }
}
