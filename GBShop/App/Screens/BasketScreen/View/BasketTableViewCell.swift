//
//  BasketTableViewCell.swift
//  GBShop
//
//  Created by macbook on 24.07.2021.
//

import UIKit
import Kingfisher
import SnapKit

protocol DeleteProductDelegate: AnyObject {
    func deleteProduct(_ productName: String)
}

class BasketTableViewCell: UITableViewCell {
    
    weak var delegate: DeleteProductDelegate?
    
    lazy var productImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var productLabel: UILabel = {
        let label = UILabel()
        label.font = UIConfig.mediumTextFont
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIConfig.mainTextFont
        return label
    }()
    
    lazy var deleteProductButton: UIButton = {
        let imageButton = UIButton()
        let origImage = UIImage(systemName: "bin.xmark")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        imageButton.setBackgroundImage(tintedImage, for: .normal)
        imageButton.tintColor = .gray
        imageButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        return imageButton
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(productImage)
        productImage.snp.makeConstraints { (make) in
            make.top.bottom.leading.equalToSuperview().inset(UIConfig.verticalOffset / 2)
            make.width.equalTo(productImage.snp.height)
        }
        
        self.addSubview(productLabel)
        productLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(UIConfig.verticalOffset)
            make.leading.equalTo(productImage.snp.trailing).offset(UIConfig.horizontalOffset)
        }
        
        self.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().inset(UIConfig.verticalOffset)
            make.leading.equalTo(productImage.snp.trailing).offset(UIConfig.horizontalOffset)
        }
        
        contentView.addSubview(deleteProductButton)
        deleteProductButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(UIConfig.horizontalOffset / 2)
            make.height.width.equalTo(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        productImage.kf.cancelDownloadTask()
        productImage.image = nil
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @objc func deleteButtonTapped() {
        delegate?.deleteProduct(productLabel.text ?? "")
    }
}
