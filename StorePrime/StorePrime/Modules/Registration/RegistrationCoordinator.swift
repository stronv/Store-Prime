//
//  RegistrationCoordinator.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 02.07.2023.
//

import UIKit

protocol RegistrationCoordinatorProtocol: Coordinator {
    func start() -> UIViewController
}

class RegistrationCoordinator: RegistrationCoordinatorProtocol {
    
    var appCoordinator: AppCoordinator?
    var navigationController = UINavigationController()
    
    init() {
        let controller = RegistrationViewController()
        controller.output = RegistrationPresenter(self, view: controller)
        let navigationController = UINavigationController(rootViewController: controller)
        self.navigationController = navigationController
    }
    
    func start() -> UIViewController {
        return navigationController
    }
}
