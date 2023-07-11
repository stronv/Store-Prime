//
//  CartViewController.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 03.07.2023.
//

import UIKit
import SnapKit

protocol CartViewControllerProtocol: AnyObject {
    func reloadData()
    func configureAmonut(amount: Double)
}

class CartViewController: UIViewController, CartViewControllerProtocol {
    
    // MARK: - UI
    private let amountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.exo2Bold, size: 40)
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private let buyButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 25
        button.setTitle(L10n.buyButton, for: .normal)
        button.titleLabel?.font = UIFont(name: Fonts.exo2Bold, size: 24)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buyButtonAction), for: .touchUpInside)
        button.backgroundColor = UIColor.customBlack
        return button
    }()
    
    private let refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        return refreshControl
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(amountLabel)
        output.viewDidLoadEvent()
        
        amountLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(20)
        }
        
        view.addSubview(buyButton)
        buyButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().inset(25)
            make.height.equalTo(50)
        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(amountLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(buyButton.snp.bottom).inset(60)
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.refreshControl = refreshControl
    }
    var output: CartPresenter!
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension CartViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return output.prdouctsInCart.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ProductCollectionViewCell.identifier,
            for: indexPath) as? ProductCollectionViewCell
        else {
            fatalError("Couldn't register cell")
        }
        
        let product = output.prdouctsInCart[indexPath.row]
        cell.configureCellForCart(cartProduct: product)
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout:
        UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2.5, height: collectionView.frame.width/1.3)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        return UIEdgeInsets(
            top: 10,
            left: 30,
            bottom: 10,
            right: 30
        )
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 10
    }
}

// MARK: - Public Methods
extension CartViewController {
    func reloadData() {
        collectionView.reloadData()
    }
    
    func configureAmonut(amount: Double) {
        amountLabel.text = "\(amount) Р"
    }
}

// MARK: - Objc Methods
extension CartViewController {
    @objc func buyButtonAction() {
        output.createOrder()
    }
    
    @objc func refreshData() {
        refreshControl.beginRefreshing()
        collectionView.reloadData()
        refreshControl.endRefreshing()
    }
}
