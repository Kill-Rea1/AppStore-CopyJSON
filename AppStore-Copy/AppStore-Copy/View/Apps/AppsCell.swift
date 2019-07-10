//
//  AppsCell.swift
//  AppStore-Copy
//
//  Created by Кирилл Иванов on 09/07/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

class AppsCell: BaseCollectionCell {
    
    public let titleLabel = UILabel(text: "App Section", font: UIFont.boldSystemFont(ofSize: 30))
    
    public let horizontalController = AppsHorizontalController()
    
    override func setupViews() {
        super.setupViews()
        addSubview(titleLabel)
        titleLabel.addConsctraints(leadingAnchor, trailingAnchor, topAnchor, nil, .init(top: 0, left: 16, bottom: 0, right: 0))
        addSubview(horizontalController.view)
        horizontalController.view.addConsctraints(leadingAnchor, trailingAnchor, titleLabel.bottomAnchor, bottomAnchor)
    }
}
