//
//  MainPageCoordinator.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 03.07.2023.
//

import UIKit

protocol MainPageCoordinatorProtocol: Coordinator {
    func start() -> UIViewController
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
}
