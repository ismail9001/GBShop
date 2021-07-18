//
//  CatalogScreenViewController.swift
//  GBShop
//
//  Created by macbook on 14.07.2021.
//

import UIKit

protocol CatalogScreenViewControllerProtocol: class {
    func showAlert(value: String, title: String)
    func showActivityIndicator()
    func hideActivityIndicator()
}

class CatalogScreenViewController: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegate, CatalogScreenViewControllerProtocol {
    
    var presenter: CatalogScreenPresenterProtocol!
    var catalog: [ProductShortResult] = []
    
    @IBOutlet weak var catalogCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        catalogCollectionView.delegate = self
        catalogCollectionView.dataSource = self
        self.title = "Каталог"
        updateCatalogCollection()
    }
    
    func updateCatalogCollection() {
        presenter.getCatalog(pageNumber: 1, categoryId: 1) { [self] catalog in
            self.catalog = catalog
            catalogCollectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        catalog.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // swiftlint:disable force_cast
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath as IndexPath) as! ProductCollectionViewCell
        // swiftlint:enable force_cast
        let product = catalog[indexPath.row]
        cell.productName.text = product.productName
        cell.productPrice.text = "\(product.price) \u{20BD}"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.openProductScreen(productId: catalog[indexPath.row].productId)
    }
}

extension CatalogScreenViewController: UICollectionViewDelegateFlowLayout {
    
    var cellIndent: CGFloat {
        return 20
    }
    var itemsPerRow: CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - cellIndent) / itemsPerRow
        return CGSize(width: width, height: width)
    }
}
