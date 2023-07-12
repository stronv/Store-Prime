//
//  OrdersViewController.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 08.07.2023.
//

import UIKit
import SnapKit

protocol OrdersViewControllerProtocol: AnyObject {
    func refreshOrders()
}

class OrdersViewController: UIViewController, OrdersViewControllerProtocol {
    
    // MARK: - UI
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(OrdersCollectionViewCell.self, forCellWithReuseIdentifier: OrdersCollectionViewCell.identifier)
        collectionView.backgroundColor = UIColor(named: "backgroundColor")
        return collectionView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewDidLoadEvent()
        configure()
    }
    
    // MARK: - MVP Properties
    var output: OrdersPresenter!
    
    // MARK: - Private methods
    private func configure() {
        view.backgroundColor = UIColor(named: "backgroundColor")
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        let backButton = createCustomButton(imageName: "backButton", selector: #selector(backButtonAction))
        navigationItem.leftBarButtonItem = backButton
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension OrdersViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return output.orders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: OrdersCollectionViewCell.identifier,
            for: indexPath) as? OrdersCollectionViewCell
        else {
            fatalError("Couldn't register cell")
        }
        let order = output.orders[indexPath.row]
        cell.cnfigureOrderCell(order: order)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.width/2)
    }
}

// MARK: - Public methods
extension OrdersViewController {
    func refreshOrders() {
        collectionView.reloadData()
    }
}

// MARK: - Objc functions
extension OrdersViewController {
    @objc func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
}
