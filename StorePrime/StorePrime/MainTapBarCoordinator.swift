//
//  MainTapBarCoordinator.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 03.07.2023.
//

import UIKit
    
class MainTapBarCoordinator: Coordinator {
    
    weak var tapBarController: UITabBarController?
    var appCoordinator: AppCoordinator?
    var navigationController = UINavigationController()
    
    func start() -> UIViewController {
        let tabBarController = UITabBarController()
        self.tapBarController = tabBarController
        tapBarController?.viewControllers = [
            showMainPage(),
            showSearhPage(),
            showCartPage(),
            showUserPage()
        ]
        return tabBarController
    }
    
    private func showMainPage() -> UIViewController {
        let coordinator = MainPageCoordinator()
        coordinator.tapBarCoordinator = self
        let controller = coordinator.start()
        controller.tabBarItem = .init(
            title: "",
            image: .init(systemName: "house"),
            selectedImage: .init(systemName: "house.fill")
        )
        return controller
    }
    
    private func showSearhPage() -> UIViewController {
        let coordinator = SearchCoordinator()
        coordinator.tapBarCoordinator = self
        let controller = coordinator.start()
        controller.tabBarItem = .init(
            title: "",
            image: .init(systemName: "magnifyingglass.circle"),
            selectedImage: .init(systemName: "magnifyingglass.circle.fill")
        )
        return controller
    }
    
    private func showCartPage() -> UIViewController {
        let coordinator = CartCoordinator()
        coordinator.tapBarCoordinator = self
        let controller = coordinator.start()
        controller.tabBarItem = .init(
            title: "",
            image: .init(systemName: "cart"),
            selectedImage: .init(systemName: "cart.fill")
        )
        return controller
    }
    
    private func showUserPage() -> UIViewController {
        let coordinator = ProfileTabCoordinator(navigationController: navigationController)
        coordinator.tapBarCoordinator = self
        let controller = coordinator.start()
        controller.tabBarItem = .init(
            title: "",
            image: .init(systemName: "person.circle"),
            selectedImage: .init(systemName: "person.circle.fill")
        )
        return controller
    }
}
