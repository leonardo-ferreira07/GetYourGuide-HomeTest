//
//  GetYourGuideReviewTableViewCell.swift
//  GetYourGuide
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 30/07/19.
//  Copyright © 2019 Leonardo Ferreira. All rights reserved.
//

import UIKit

class GetYourGuideReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var authorImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(with cell: GetYourGuideReviewCell) {
        titleLabel.text = cell.review?.title
        starsLabel.text = "\(cell.review?.ratingNormalized ?? "0") of 5 stars"
        messageLabel.text = !(cell.review?.message?.isEmpty ?? true) ? cell.review?.message : "Sorry, no message for this review."
        messageLabel.textColor = !(cell.review?.message?.isEmpty ?? true) ? UIColor.black : UIColor.lightGray
        authorLabel.text = cell.review?.author
        dateLabel.text = cell.review?.date
    }
    
    func setCellImages(with cell: GetYourGuideReviewCell) {
        authorImageView.loadImage(cell.review?.reviewerProfilePhoto)
    }
    
}
