//
//  AppCoordinator.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 02.07.2023.
//

import UIKit

class AppCoordinator {
    
    var window = UIWindow()
    
    func goToRegistration() {
        window.makeKeyAndVisible()
        window.backgroundColor = .systemBackground
        let coordinator = RegistrationCoordinator()
        coordinator.appCoordinator = self
        setRootViewController(coordinator.start(), duration: 0.3)
    }
}

extension AppCoordinator {
    private func setRootViewController(_ vc: UIViewController, duration: TimeInterval) {
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: duration,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil
        )
    }
}
