//
//  ProductScreenViewController.swift
//  GBShop
//
//  Created by macbook on 17.07.2021.
//

import UIKit
import SnapKit
import SkeletonView
import MaterialComponents.MaterialButtons_Theming
import MaterialComponents.MaterialButtons

protocol ProductScreenViewControllerProtocol: AnyObject {
    func showAlert(value: String, title: String)
    func showActivityIndicator()
    func hideActivityIndicator()
}

class ProductScreenViewController: BaseViewController, ProductScreenViewControllerProtocol {
    
    var presenter: ProductScreenPresenterProtocol?
    let containerScheme = MDCContainerScheme()
    var product: ProductShortResult!
    let screenInset: CGFloat = 20
    let mainImageHeight: CGFloat = 250
    
    lazy var productImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .red
        return view
    }()
    
    lazy var productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIConfig.mainTextFont
        label.text = ""
        label.numberOfLines = 0
        label.isSkeletonable = true
        label.showAnimatedSkeleton()
        return label
    }()
    
    lazy var productPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIConfig.titleTextFont
        label.text = "Цена: 0 P"
        label.numberOfLines = 1
        label.isSkeletonable = true
        label.showAnimatedSkeleton()
        return label
    }()
    
    lazy var showFeedbackButton: UIButton = {
        let button = UIButton()
        let label = UILabel()
        label.font = UIConfig.mainTextFont
        label.text = "Отзывы"
        label.numberOfLines = 1
        button.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(50)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(150)
        }
        button.addTarget(self, action: #selector(feedbackButtonTapped), for: .touchUpInside)
        let bottomLineView = UIView()
        bottomLineView.backgroundColor = .gray
        button.addSubview(bottomLineView)
        bottomLineView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        let topLineView = UIView()
        topLineView.backgroundColor = .gray
        button.addSubview(topLineView)
        topLineView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(1)
        }
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .gray
        button.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.right.equalToSuperview().inset(screenInset)
            make.centerY.equalToSuperview()
            make.height.equalTo(30)
        }
        return button
    }()
    
    lazy var addToBasketButton: MDCButton = {
        let button = MDCButton()
        button.applyOutlinedTheme(withScheme: containerScheme)
        button.setTitle("Добавить в корзину", for: .normal)
        button.addTarget(self, action: #selector(addToBaskedButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        presenter?.getProductById(productId: product.productId) { [self] product in
            title = product.productName
            productDescriptionLabel.text = "Описание: \(product.description)"
            productDescriptionLabel.hideSkeleton()
            productPriceLabel.text = "Цена: \(product.price) \u{20BD}"
            productPriceLabel.hideSkeleton()
        }
    }
    
    func configureViews() {
        self.view.addSubview(productImageView)
        productImageView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.height.equalTo(mainImageHeight)
        }
        
        self.view.addSubview(productPriceLabel)
        productPriceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(productImageView.snp.bottom).offset(screenInset)
            make.leading.equalToSuperview().inset(screenInset)
        }
        
        self.view.addSubview(productDescriptionLabel)
        productDescriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(productPriceLabel.snp.bottom).offset(screenInset)
            make.leading.trailing.equalToSuperview().inset(screenInset)
        }
        
        self.view.addSubview(showFeedbackButton)
        showFeedbackButton.snp.makeConstraints { (make) in
            make.top.equalTo(productDescriptionLabel.snp.bottom).offset(screenInset)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        
        self.view.addSubview(addToBasketButton)
        addToBasketButton.snp.makeConstraints { (make) in
            make.top.equalTo(showFeedbackButton.snp.bottom).offset(UIConfig.verticalOffset)
            make.trailing.leading.equalToSuperview().inset(UIConfig.horizontalOffset)
            make.height.equalTo(UIConfig.buttonHeight)
        }
    }
    
    @objc func feedbackButtonTapped() {
        presenter?.openFeedbackScreen()
    }
    
    @objc func addToBaskedButtonTapped() {
        showActivityIndicator()
        presenter?.addToBasket(product: product)
    }
}
