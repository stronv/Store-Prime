//
//  OrdersViewController.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 08.07.2023.
//

import UIKit
import SnapKit

protocol OrdersViewControllerProtocol: AnyObject {
    
}

class OrdersViewController: UIViewController, OrdersViewControllerProtocol {
    
    // MARK: - UI
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(OrdersCollectionViewCell.self, forCellWithReuseIdentifier: OrdersCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    // MARK: - MVP Properties
    var output: OrdersPresenterProtocol!
    
    // MARK: - Private methods
    private func configure() {
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.backgroundColor = .white
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension OrdersViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: OrdersCollectionViewCell.identifier,
            for: indexPath) as? OrdersCollectionViewCell
        else {
            fatalError("Couldn't register cell")
        }
        cell.backgroundColor = .clear
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.width/2)
    }
}
