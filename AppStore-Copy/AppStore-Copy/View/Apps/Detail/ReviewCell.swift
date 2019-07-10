//
//  ReviewCell.swift
//  AppStore-Copy
//
//  Created by Кирилл Иванов on 10/07/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

class ReviewCell: BaseCollectionCell {
    
    let titleLabel = UILabel(text: "Review Label", font: .boldSystemFont(ofSize: 18))
    let authorLabel = UILabel(text: "Review Author", font: .systemFont(ofSize: 16))
    let starsLabel = UILabel(text: "Stars", font: .systemFont(ofSize: 14))
    let bodyLabel = UILabel(text: "Body\nBody\nBody\nBody", font: .systemFont(ofSize: 14), numberOfLines: 5)
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = #colorLiteral(red: 0.9263086915, green: 0.9212974906, blue: 0.9557722211, alpha: 1)
        layer.cornerRadius = 16
        clipsToBounds = true
        
        let stackView = VerticalStackView(arrangedSubviews: [
            UIStackView(arrangedSubviews: [titleLabel, UIView(), authorLabel]),
            starsLabel,
            bodyLabel
            ], spacing: 12)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
}
