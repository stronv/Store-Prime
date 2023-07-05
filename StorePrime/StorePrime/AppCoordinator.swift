//
//  AppCoordinator.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 02.07.2023.
//

import UIKit

class AppCoordinator {
    
    var window = UIWindow()
    
    func start() {
        let tabBarCoordinator = MainTapBarCoordinator()
        window.rootViewController = tabBarCoordinator.start()
        window.makeKeyAndVisible()
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
