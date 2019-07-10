//
//  TodayCell.swift
//  AppStore-Copy
//
//  Created by Кирилл Иванов on 10/07/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

class TodayCell: BaseCollectionCell {
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "garden"))
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        layer.cornerRadius = 16
        clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        addSubview(imageView)
        imageView.centerInSuperview(size: .init(width: 200, height: 200))
    }
}
