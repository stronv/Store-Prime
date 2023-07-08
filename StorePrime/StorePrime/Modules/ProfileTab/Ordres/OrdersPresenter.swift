//
//  OrdersPresenter.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 08.07.2023.
//

import Foundation

protocol OrdersPresenterProtocol {
    
}

class OrdersPresenter: OrdersPresenterProtocol {
    private let moduleOutput: ProfileTabCoordinatorProtocol
    private weak var view: OrdersViewControllerProtocol?
    
    init(_ moduleOutput: ProfileTabCoordinatorProtocol,
         view: OrdersViewControllerProtocol) {
        self.moduleOutput = moduleOutput
        self.view = view
    }
}
