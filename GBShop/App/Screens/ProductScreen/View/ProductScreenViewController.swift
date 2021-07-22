//
//  ProductScreenViewController.swift
//  GBShop
//
//  Created by macbook on 17.07.2021.
//

import UIKit
import SnapKit
import SkeletonView

protocol ProductScreenViewControllerProtocol: AnyObject {
}

class ProductScreenViewController: BaseViewController, ProductScreenViewControllerProtocol {
    
    var presenter: ProductScreenPresenterProtocol?
    var productId: Int!
    let screenInset: CGFloat = 20
    let mainImageHeight: CGFloat = 250
    
    lazy var productImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .red
        return view
    }()
    
    lazy var productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Light", size: 18)
        label.text = ""
        label.numberOfLines = 0
        label.isSkeletonable = true
        label.showAnimatedSkeleton()
        return label
    }()
    
    lazy var productPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 30)
        label.text = "Цена: 0 P"
        label.numberOfLines = 1
        label.isSkeletonable = true
        label.showAnimatedSkeleton()
        return label
    }()
    
    lazy var showFeedbackButton: UIButton = {
        let button = UIButton()
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Light", size: 18)
        label.text = "Отзывы"
        label.numberOfLines = 1
        button.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(50)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(150)
        }
        button.addTarget(self, action: #selector(feedbackButtonPressed), for: .touchUpInside)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        presenter?.getProductById(productId: productId) { [self] product in
            print(product)
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
    }
    
    @objc func feedbackButtonPressed() {
        presenter?.openFeedbackScreen()
    }
}
