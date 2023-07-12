//
//  MainPageViewController.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 03.07.2023.
//

import UIKit
import SnapKit

protocol MainPageViewControllerProtocol: AnyObject {
    func reloadData()
}

class MainPageViewController: UIViewController, MainPageViewControllerProtocol {
    // MARK: - UI
    private let searchView: SearchView = {
        let view = SearchView()
        return view
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10.0, left: 1.0, bottom: 1.0, right: 1.0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(
            ProductCollectionViewCell.self,
            forCellWithReuseIdentifier: ProductCollectionViewCell.identifier
        )
        collectionView.register(
            HeaderCollectionView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HeaderCollectionView.identifier
        )
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoadEvent()
        configure()
    }
    // MARK: - MVP Properties
    var output: MainPagePresenter!
    
    private func configure() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(searchView)
        searchView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalToSuperview().dividedBy(6)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(searchView.snp.bottom).offset(30)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension MainPageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return output.randomProducts.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView
            .dequeueReusableCell(
            withReuseIdentifier: ProductCollectionViewCell.identifier,
            for: indexPath) as? ProductCollectionViewCell
        else {
            fatalError("Couldn't register cell")
        }
        let randpomProduct = output.randomProducts[indexPath.row]
        print(randpomProduct)
        cell.configureCell(product: randpomProduct)
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
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: HeaderCollectionView.identifier,
                for: indexPath
            ) as? HeaderCollectionView else {
                fatalError("Couldn't register header")
            }
            if let randomProduct = output.product {
                headerView.configure(randomProduct: randomProduct)
            } else {
                print("error to configure header")
            }
            return headerView
        }
        return UICollectionReusableView()
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        referenceSizeForHeaderInSection section: Int
    ) -> CGSize {
        return CGSize(
            width: collectionView.bounds.width,
            height: view.bounds.height / 3
        )
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

    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        collectionView.deselectItem(at: indexPath, animated: true)
        output.showProductDetail(indexPath: indexPath)
    }
}

// MARK: - Public Methods
extension MainPageViewController {
    func reloadData() {
        collectionView.reloadData()
    }
}
