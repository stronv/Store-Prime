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
    func toSellerSignUp()
    func toSignIn()
    func toProfile()
    func toBonuces()
    func toChangeProgile()
    func toOrders()
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
    
    func toSellerSignUp() {
        let controller = SellerRegistrationViewController()
        controller.output = SellerRegistrationPresenter(self, view: controller)
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
    
    func toBonuces() {
        let controller = AddBonusesViewController()
        controller.output = BonusesPresenter(self, view: controller)
        navigationController.pushViewController(controller, animated: true)
    }
    
    func toChangeProgile() {
        let controller = ChangeProfileViewController()
        controller.output = ChangeProfilePresenter(self, view: controller)
        navigationController.pushViewController(controller, animated: true)
    }
    
    func toOrders() {
        let controller = OrdersViewController()
        controller.output = OrdersPresenter(self, view: controller)
        navigationController.pushViewController(controller, animated: true)
    }
}
