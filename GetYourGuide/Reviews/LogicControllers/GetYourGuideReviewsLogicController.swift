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
    
    // MARK: Public methods
    
    func setTableView(tableView: UITableView) {
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        
        registerCells(tableView: tableView)
    }
    
    func loadTableView(tableView: UITableView) {
        loadCells(tableView: tableView)
        loadData(tableView: tableView)
    }
    
    // MARK: - Private methods
    
    fileprivate func registerCells(tableView: UITableView) {
        tableView.register(UINib (nibName: "GetYourGuideReviewTableViewCell", bundle: nil), forCellReuseIdentifier: GetYourGuideReviewTypeCell.review.rawValue)
    }
    
    fileprivate func loadCells(tableView: UITableView) {

        DispatchQueue.main.async {
            tableView.reloadData()
        }
    }
    
    fileprivate func loadData(tableView: UITableView) {
        
        reviewsViewModel.getData() { [weak self] (cells) in
            guard let self = self else { return }
            
            self.reviewCells = cells
            
            DispatchQueue.main.async {
                tableView.reloadData()
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
