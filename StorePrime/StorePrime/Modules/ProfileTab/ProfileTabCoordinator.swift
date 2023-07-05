//
//  ProfileTabCoordinator.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 05.07.2023.
//

import UIKit

protocol ProfileTabCoordinatorProtocol: Coordinator {
    func start() -> UIViewController
    func toSignUp()
    func toSignIn()
    func toProfile()
}

class ProfileTabCoordinator: ProfileTabCoordinatorProtocol {
    var tapBarCoordinator: MainTapBarCoordinator?
    private var navigationController: UINavigationController
    var window = UIWindow()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        toSignUp()
    }
    
    func start() -> UIViewController {
        return navigationController
    }
    
    func toSignUp() {
        let controller = RegistrationViewController()
        controller.output = RegistrationPresenter(self, view: controller)
        navigationController.setViewControllers([controller], animated: false)
    }
    
    func toSignIn() {
        let controller = LoginViewController()
        controller.output = LoginPresenter(self, view: controller)
        navigationController.setViewControllers([controller], animated: false)
    }
    
    func toProfile() {
        let controller = ProfileViewController()
        controller.output = ProfilePresenter(self, view: controller)
        navigationController.setViewControllers([controller], animated: false)
    }
}
