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
    let starsStackView: UIStackView = {
        var arrangedSubviews = [UIView]()
        (0..<5).forEach({ (_) in
            let imageView = UIImageView(image: #imageLiteral(resourceName: "star"))
            imageView.constraintWidth(constant: 24)
            imageView.constraintHeight(constant: 24)
            arrangedSubviews.append(imageView)
        })
        arrangedSubviews.append(UIView())
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        return stackView
    }()
    let bodyLabel = UILabel(text: "Body\nBody\nBody\nBody", font: .systemFont(ofSize: 18), numberOfLines: 5)
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = #colorLiteral(red: 0.9263086915, green: 0.9212974906, blue: 0.9557722211, alpha: 1)
        layer.cornerRadius = 16
        clipsToBounds = true
        
        let stackView = VerticalStackView(arrangedSubviews: [
            UIStackView(arrangedSubviews: [titleLabel, authorLabel], customSpacing: 8),
            starsStackView,
            bodyLabel
            ], spacing: 12)
        titleLabel.setContentCompressionResistancePriority(.init(0), for: .horizontal)
        authorLabel.textAlignment = .right
        addSubview(stackView)
//        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
        stackView.addConsctraints(leadingAnchor, trailingAnchor, topAnchor, nil, .init(top: 20, left: 20, bottom: 0, right: 20))
    }
}
