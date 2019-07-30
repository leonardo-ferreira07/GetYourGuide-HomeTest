//
//  GetYourGuideReviewTableViewCell.swift
//  GetYourGuide
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 30/07/19.
//  Copyright © 2019 Leonardo Ferreira. All rights reserved.
//

import UIKit

class GetYourGuideReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(with cell: GetYourGuideReviewCell) {
        messageLabel.text = !(cell.review?.message?.isEmpty ?? true) ? cell.review?.message : "no message for this review"
    }
    
}
