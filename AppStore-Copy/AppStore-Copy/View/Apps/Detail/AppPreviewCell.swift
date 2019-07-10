//
//  AppReviewCell.swift
//  AppStore-Copy
//
//  Created by Кирилл Иванов on 10/07/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

class AppPreviewCell: BaseCollectionCell {
    fileprivate let previewLabel = UILabel(text: "Preview", font: .boldSystemFont(ofSize: 24))
    let horizontalController = PreviewSceenshotController()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        addSubview(previewLabel)
        previewLabel.addConsctraints(leadingAnchor, trailingAnchor, topAnchor, nil, .init(top: 0, left: 20, bottom: 0, right: 20))
        addSubview(horizontalController.view)
        horizontalController.view.addConsctraints(leadingAnchor, trailingAnchor, previewLabel.bottomAnchor, bottomAnchor, .init(top: 20, left: 0, bottom: 0, right: 0))
    }
}
