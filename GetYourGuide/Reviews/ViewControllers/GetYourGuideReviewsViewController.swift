//
//  GetYourGuideReviewsViewController.swift
//  GetYourGuide
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 30/07/19.
//  Copyright © 2019 Leonardo Ferreira. All rights reserved.
//

import UIKit

class GetYourGuideReviewsViewController: UITableViewController {

    var reviewsLogicController: GetYourGuideReviewsLogicController?
    
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
        reviewsLogicController = GetYourGuideReviewsLogicController(tableView: tableView)
    }
    
    func loadTableView() {
        reviewsLogicController?.loadTableView()
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
