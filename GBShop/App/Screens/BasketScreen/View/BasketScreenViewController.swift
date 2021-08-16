//
//  BasketScreenViewController.swift
//  GBShop
//
//  Created by macbook on 24.07.2021.
//

import UIKit
import MaterialComponents.MaterialButtons_Theming
import MaterialComponents.MaterialButtons
import SnapKit
import Kingfisher
import FirebaseAnalytics

protocol BasketScreenViewControllerProtocol: AnyObject {
    func clearBasket()
    func showAlert(value: String, title: String)
    func showActivityIndicator()
    func hideActivityIndicator()
}

class BasketScreenViewController: BaseViewController,
                                  UITableViewDelegate,
                                  UITableViewDataSource,
                                  BasketScreenViewControllerProtocol,
                                  DeleteProductDelegate {
    
    var presenter: BasketScreenPresenterProtocol?
    let containerScheme = MDCContainerScheme()
    var groupedBasketGoods: [Int: [ProductShortResult]] = [:]
    var keysArray: [Int] = []
    var basketGoods: [ProductShortResult] = []
    
    lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.font = UIConfig.titleTextFont
        label.text = "Итого"
        return label
    }()
    
    lazy var totalPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIConfig.mediumTextFont
        return label
    }()
    
    lazy var totalGoodsCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIConfig.mainTextFont
        return label
    }()
    
    lazy var totalPriceView: UIView = {
        let view = UIView()
        view.addSubview(totalLabel)
        totalLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(UIConfig.horizontalOffset)
            make.top.equalToSuperview().inset(UIConfig.verticalOffset)
        }
        
        view.addSubview(totalPriceLabel)
        totalPriceLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(UIConfig.horizontalOffset)
            make.top.equalTo(totalLabel.snp.bottom).offset(UIConfig.verticalOffset / 2)
        }
        
        view.addSubview(totalGoodsCountLabel)
        totalGoodsCountLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(UIConfig.horizontalOffset)
            make.top.equalTo(totalPriceLabel.snp.bottom).offset(UIConfig.verticalOffset / 2)
        }
        return view
    }()
    
    lazy var goToCatalogButton: MDCButton = {
        let button = MDCButton()
        button.applyOutlinedTheme(withScheme: containerScheme)
        button.setTitle("На главную", for: .normal)
        button.addTarget(self, action: #selector(catalogButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIConfig.titleTextFont
        label.text = "Корзина пуста"
        label.textAlignment = .center
        return label
    }()
    
    lazy var emptyBasketView: UIView = {
       let view = UIView()
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(16)
        }
        view.addSubview(goToCatalogButton)
        goToCatalogButton.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(UIConfig.buttonHeight)
        }
        return view
    }()
    
    lazy var goodsTable: UITableView = {
        let table = UITableView()
        // table.allowsSelection = false
        table.delaysContentTouches = false
        table.separatorColor = .clear
        table.register(BasketTableViewCell.self, forCellReuseIdentifier: "ProductCell")
        table.dataSource = self
        table.delegate = self
        return table
    }()
    
    lazy var payButton: MDCButton = {
        let button = MDCButton()
        button.applyContainedTheme(withScheme: containerScheme)
        button.setTitle("Оплатить", for: .normal)
        button.addTarget(self, action: #selector(payButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calculateViews()
    }
    
    func configureViews() {
        self.view.addSubview(emptyBasketView)
        emptyBasketView.snp.makeConstraints { (make) in
            make.trailing.leading.equalToSuperview().inset(UIConfig.horizontalOffset)
            make.height.equalTo(150)
            make.center.equalToSuperview()
        }
        
        self.view.addSubview(totalPriceView)
        totalPriceView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(totalGoodsCountLabel.snp.bottom).offset(UIConfig.verticalOffset)
            make.width.equalToSuperview()
        }
        
        self.view.addSubview(goodsTable)
        goodsTable.snp.makeConstraints { (make) in
            make.top.equalTo(totalPriceView.snp.bottom)
            make.bottom.leading.trailing.equalToSuperview()
        }
        
        self.view.addSubview(payButton)
        payButton.snp.makeConstraints { (make) in
            make.trailing.leading.equalToSuperview().inset(UIConfig.horizontalOffset)
            make.height.equalTo(UIConfig.buttonHeight)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(UIConfig.verticalOffset)
        }
    }
    
    func calculateViews() {
        guard let savedUser = UserDefaultsWrapper.userInfo() else { return }
        let newNotificationRecieve = Notification.Name("newGoodRecieve")
        NotificationCenter.default.post(name: newNotificationRecieve, object: nil)
        basketGoods = savedUser.basket ?? []
        groupedBasketGoods = calculateBasket(basket: basketGoods)
        keysArray = Array(groupedBasketGoods.keys)
        let basketGoodsIsEmpty = basketGoods.count == 0 ? true : false
        goodsTable.isHidden = basketGoodsIsEmpty
        totalPriceView.isHidden = basketGoodsIsEmpty
        emptyBasketView.isHidden = !basketGoodsIsEmpty
        if !basketGoodsIsEmpty {
            goodsTable.reloadData()
            let goodsSum = basketGoods.reduce(0) { $0 + $1.price }
            totalLabel.text = "Итого: \(goodsSum) \u{20BD}"
            let goodsCount = basketGoods.count
            totalGoodsCountLabel.text = "Всего: \(goodsCount) товаров"
        }
    }
    
    func calculateBasket(basket: [ProductShortResult]) -> [Int: [ProductShortResult]] {
        let groupedItems = Dictionary(grouping: basket, by: {$0.productId})
        return groupedItems
    }
    
    @objc func catalogButtonTapped() {
        self.tabBarController?.selectedIndex = 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groupedBasketGoods.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell",
                                                       for: indexPath) as? BasketTableViewCell
        else { return UITableViewCell() }
        
        let currentKey = keysArray[indexPath.row]
        guard let products = groupedBasketGoods[currentKey] else { return UITableViewCell() }
        guard let product = products.first else { return UITableViewCell() }
        
        cell.delegate = self
        cell.productLabel.text = product.productName
        cell.priceLabel.text = "\(products.count) шт. X \(product.price) \u{20BD}"
        cell.imageView?.kf.indicatorType = .activity
        cell.imageView?.kf.setImage(with: URL(string: "https://picsum.photos/80/80"),
                                    placeholder: UIImage(named: "80x80.png"),
                                    options: nil,
                                    progressBlock: nil,
                                    completionHandler: nil)
        cell.isUserInteractionEnabled = true
        clearImageCashe()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func clearBasket() {
        guard let savedUser = UserDefaultsWrapper.userInfo() else { return }
        var user = savedUser
        user.basket = []
        UserDefaultsWrapper.saveUserInfo(user: user)
        calculateViews()
    }
    
    func clearImageCashe() {
        let cache = ImageCache.default
        cache.clearMemoryCache()
        cache.clearDiskCache()
    }
    
    func deleteProduct(_ productName: String) {
        guard let savedUser = UserDefaultsWrapper.userInfo() else { return }
        var user = savedUser
        user.basket = user.basket?.filter { $0.productName != productName }
        UserDefaultsWrapper.saveUserInfo(user: user)
        
        Analytics.logEvent(AnalyticsEventRemoveFromCart, parameters: [
            AnalyticsParameterItemName: "\(productName)",
            AnalyticsParameterContentType: "cont"
        ])
        
        calculateViews()
    }
    
    @objc func payButtonTapped() {
        self.showActivityIndicator()
        presenter?.payBasket(basketId: basketGoods.count)
    }
}
