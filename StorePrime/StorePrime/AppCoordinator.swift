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
