//
//  SearchCoordinator.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 03.07.2023.
//

import UIKit

protocol SearchCoordinatorProtocol: Coordinator {
    func start() -> UIViewController
}

class SearchCoordinator: SearchCoordinatorProtocol {
    var tapBarCoordinator: MainTapBarCoordinator?
    var navigationController = UINavigationController()
    
    init() {
        let controller = SearchViewController()
        controller.output = SearchPresenter(self, view: controller)
        let navigationController = UINavigationController(rootViewController: controller)
        self.navigationController = navigationController
    }
    
    func start() -> UIViewController {
        return navigationController
    }
}
