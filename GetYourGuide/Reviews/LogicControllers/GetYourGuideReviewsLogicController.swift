//
//  GetYourGuideReviewsLogicController.swift
//  GetYourGuide
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 30/07/19.
//  Copyright © 2019 Leonardo Ferreira. All rights reserved.
//

import Foundation
import UIKit

class GetYourGuideReviewsLogicController: NSObject {
    
    fileprivate lazy var reviewsViewModel: GetYourGuideReviewsViewModel = GetYourGuideReviewsViewModel()
    fileprivate var reviewCells: [GetYourGuideReviewCell] = []
    private let activityView = UIActivityIndicatorView(style: .gray)
    private let bottomActivityView = UIActivityIndicatorView(style: .gray)
    private var page: Int = 0
    private weak var tableView: UITableView!
    
    // MARK: Public methods
    
    init(tableView: UITableView) {
        super.init()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        self.tableView = tableView
        
        setLoading()
        registerCells()
    }
    
    func loadTableView() {
        loadCells()
        loadData()
    }
    
    // MARK: - Private methods
    
    fileprivate func registerCells() {
        tableView.register(UINib (nibName: "GetYourGuideReviewTableViewCell", bundle: nil), forCellReuseIdentifier: GetYourGuideReviewTypeCell.review.rawValue)
    }
    
    fileprivate func loadCells() {

        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    fileprivate func loadData(page: Int = 0) {
        
        reviewsViewModel.getData(page: page) { [weak self] (cells) in
            guard let self = self else { return }
            
            if self.reviewsViewModel.isLoadingContent {
                if page == 0 {
                    DispatchQueue.main.async {
                        self.startLoading()
                    }
                } else {
                    DispatchQueue.main.async {
                        self.tableView.tableFooterView = self.bottomActivityView
                    }
                }
            } else {
                self.reviewCells = cells
                if page == 0 {
                    DispatchQueue.main.async {
                        self.stopLoading()
                        self.tableView.reloadData()
                    }
                } else {
                    DispatchQueue.main.async {
                        self.tableView.tableFooterView = nil
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
}

// MARK: - Table View Delegate

extension GetYourGuideReviewsLogicController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch reviewCells[indexPath.row].type {
        case .review:
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
}

// MARK: - Table View Data Source

extension GetYourGuideReviewsLogicController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reviewCells[indexPath.row].type.rawValue) else {
            return UITableViewCell()
        }
        
        if let cell = cell as? GetYourGuideReviewTableViewCell {
            cell.setCell(with: reviewCells[indexPath.row])
        }
        
        return cell
    }
    
}

// MARK: Scroll view delegate

extension GetYourGuideReviewsLogicController: UIScrollViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        
        if maximumOffset - currentOffset <= 150.0 {
            page += 1
            loadData(page: page)
        }
    }
    
}

// MARK: Loading data

extension GetYourGuideReviewsLogicController {
    
    private func setLoading() {
        activityView.center = tableView.center
        tableView.addSubview(activityView)
        
        bottomActivityView.startAnimating()
    }
    
    private func startLoading() {
        activityView.startAnimating()
    }
    
    private func stopLoading() {
        activityView.stopAnimating()
    }
}
