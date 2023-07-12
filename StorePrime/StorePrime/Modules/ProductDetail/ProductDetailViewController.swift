//
//  ProductDetailViewController.swift
//  StorePrime
//
//  Created by Artyom Tabachenko on 10.07.2023.
//

import UIKit
import SnapKit

protocol ProductDetailViewControllerProtocol: AnyObject {
    
}

class ProductDetailViewController: UIViewController, ProductDetailViewControllerProtocol {
    // MARK: - UI
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor(named: "backroundColor")
        return scrollView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 15
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        return stackView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cardProduct")
        return imageView
    }()
    
    private let descriptionView: DescriptionView = {
        let descriptionView = DescriptionView()
        descriptionView.layer.cornerRadius = 36
        descriptionView.layer.borderColor = UIColor.boarderColor.cgColor
        descriptionView.layer.borderWidth = 1
        descriptionView.layer.shadowOpacity = 0.1
        descriptionView.layer.shadowOffset = CGSize(width: 0, height: 0)
        return descriptionView
    }()
    
    private let parametersView: ParametersView = {
        let parametersView = ParametersView()
        parametersView.layer.cornerRadius = 36
        parametersView.layer.borderColor = UIColor.boarderColor.cgColor
        parametersView.layer.borderWidth = 1
        parametersView.layer.shadowOpacity = 0.1
        parametersView.layer.shadowOffset = CGSize(width: 0, height: 0)
        return parametersView
    }()
    
    private let addToCartButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 47
        button.setTitle(L10n.addToCartButton, for: .normal)
        button.titleLabel?.font = UIFont(name: Fonts.exo2Bold, size: 24)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(addToCartButtonAction), for: .touchUpInside)
        button.backgroundColor = UIColor(named: "buttonColor")
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    // MARK: - MVP Properties
    var output: ProductDetailViewPresenter!
    
    // MARK: - Private methods
    private func configure() {
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        scrollView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        stackView.addArrangedSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(450)
        }
        stackView.setCustomSpacing(-75, after: imageView)
        
        stackView.addArrangedSubview(descriptionView)
        descriptionView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(200)
        }
        
        stackView.addArrangedSubview(parametersView)
        parametersView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(220)
        }
        
        stackView.addArrangedSubview(addToCartButton)
        addToCartButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(93)
        }
        let backButton = createCustomButton(imageName: "backButton", selector: #selector(backButtonAction))
        navigationItem.leftBarButtonItem = backButton
    }
}

// MARK: - Objc Methods
extension ProductDetailViewController {
    @objc func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func addToCartButtonAction() {
        output.addToCart(productID: output.product.id, quantity: 1)
    }
}

// MARK: - Public Methods
extension ProductDetailViewController {
    func setupData(product: Product) {
        descriptionView.configureDescription(product: product)
        guard let imageURL = URL(string: "\(APIBaseURL.defaultURL.url)/photos/\(product.imageIDS.first ?? "")") else {
            print("Couldn't get URL")
            return
        }
        imageView.downloaded(from: imageURL)
        parametersView.configureView(product: product)
    }
}
