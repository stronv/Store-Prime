//
//  SearchCoordinator.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 03.07.2023.
//

import UIKit

protocol CartCoordinatorProtocol: Coordinator {
    func start() -> UIViewController
}

class CartCoordinator: CartCoordinatorProtocol {
    var tapBarCoordinator: MainTapBarCoordinator?
    var navigationController = UINavigationController()
    
    init() {
        let controller = CartViewController()
        controller.output = CartPresenter(self, view: controller)
        let navigationController = UINavigationController(rootViewController: controller)
        self.navigationController = navigationController
    }
    
    func start() -> UIViewController {
        return navigationController
    }
}
