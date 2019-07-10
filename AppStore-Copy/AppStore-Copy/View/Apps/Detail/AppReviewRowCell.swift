//
//  AppReviewCell.swift
//  AppStore-Copy
//
//  Created by Кирилл Иванов on 10/07/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

class AppReviewRowCell: BaseCollectionCell {
    
    fileprivate let reviewLabel = UILabel(text: "Reviews & Ratings", font: .boldSystemFont(ofSize: 24))
    public let horizontalController = ReviewController()
    
    override func setupViews() {
        super.setupViews()
        addSubview(reviewLabel)
        addSubview(horizontalController.view)
        reviewLabel.addConsctraints(leadingAnchor, trailingAnchor, topAnchor, nil, .init(top: 0, left: 20, bottom: 0, right: 20))
        horizontalController.view.addConsctraints(leadingAnchor, trailingAnchor, reviewLabel.bottomAnchor, bottomAnchor, .init(top: 20, left: 0, bottom: 0, right: 0))
    }
}
