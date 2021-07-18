//
//  FeedBackScreenViewController.swift
//  GBShop
//
//  Created by macbook on 18.07.2021.
//

import UIKit

protocol FeedbackScreenViewControllerProtocol: class {
}

class FeedbackScreenViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, FeedbackScreenViewControllerProtocol {

    var presenter: FeedbackScreenPresenterProtocol!
    var feedbacks: [FeedBackResult] = []
    private let myArray: NSArray = ["First", "Second", "Third"]
    lazy var feedbackTable: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        table.dataSource = self
        table.delegate = self
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Отзывы"
        self.view.addSubview(feedbackTable)
        feedbackTable.snp.makeConstraints { (make) in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
        presenter.getFeedbacks() { [self] feedbacks in
            self.feedbacks = feedbacks
            feedbackTable.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(feedbacks[indexPath.row])")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedbacks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(feedbacks[indexPath.row].text)"
        return cell
    }
}
