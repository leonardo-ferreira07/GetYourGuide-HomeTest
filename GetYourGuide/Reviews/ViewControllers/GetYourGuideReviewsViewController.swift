//
//  GetYourGuideReviewsViewController.swift
//  GetYourGuide
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 30/07/19.
//  Copyright © 2019 Leonardo Ferreira. All rights reserved.
//

import UIKit

class GetYourGuideReviewsViewController: UITableViewController {

    let reviewsLogicController: GetYourGuideReviewsLogicController = GetYourGuideReviewsLogicController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewControllerTitle()
        setLogicControllers()
        loadTableView()
    }
    
}

// MARK: - Logic Controller

extension GetYourGuideReviewsViewController {
    
    func setLogicControllers() {
        reviewsLogicController.setTableView(tableView: tableView)
    }
    
    func loadTableView() {
        reviewsLogicController.loadTableView(tableView: tableView)
    }
}

// MARK: - UI Title configuration

extension GetYourGuideReviewsViewController {
    
    private func configureViewControllerTitle() {
        title = "Reviews"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
    
}
