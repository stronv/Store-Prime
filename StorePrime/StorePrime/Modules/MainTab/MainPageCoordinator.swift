//
//  MainPageCoordinator.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 03.07.2023.
//

import UIKit

protocol MainPageCoordinatorProtocol: Coordinator {
    func start() -> UIViewController
    func toProductDetail(product: Product)
}

class MainPageCoordinator: MainPageCoordinatorProtocol {
    
    var tapBarCoordinator: MainTapBarCoordinator?
    var navigationController = UINavigationController()
    
    init() {
        let controller = MainPageViewController()
            controller.output = MainPagePresenter(self, view: controller)
        let navigationController = UINavigationController(rootViewController: controller)
        self.navigationController = navigationController
    }
    
    func start() -> UIViewController {
        return navigationController
    }
    
    func toProductDetail(product: Product) {
        let controller = ProductDetailViewController()
        controller.output = ProductDetailViewPresenter(self, view: controller, product: product)
        controller.setupData(product: product)
        navigationController.pushViewController(controller, animated: true)
    }
}
