//
//  BaseViewController.swift
//  GBShop
//
//  Created by macbook on 11.07.2021.
//

import UIKit

class BaseViewController: UIViewController {

    var activityInd: UIActivityIndicatorView = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func showAlert(value: String, title: String) {
        let alert = UIAlertController(title: title, message: value, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: alertAction(alert:)))
        self.present(alert, animated: true, completion: nil)
    }

    func showActivityIndicator() {
        activityInd.isHidden = false
        activityInd.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        activityInd.center = self.view.center
        activityInd.hidesWhenStopped = true
        if #available(iOS 13.0, *) {
            activityInd.style =
                UIActivityIndicatorView.Style.large
        } else {
            // Fallback on earlier versions
        }
        self.view.addSubview(activityInd)
        activityInd.startAnimating()
    }

    func hideActivityIndicator() {
        DispatchQueue.main.async {
            self.activityInd.isHidden = true
        }
    }

    @objc func alertAction(alert: UIAlertAction!) {
    }
}
