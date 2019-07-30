//
//  GetYourGuideReviewsViewController.swift
//  GetYourGuide
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 30/07/19.
//  Copyright © 2019 Leonardo Ferreira. All rights reserved.
//

import UIKit

class GetYourGuideReviewsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewControllerTitle()
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
