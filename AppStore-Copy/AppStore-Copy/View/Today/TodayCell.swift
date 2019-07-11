//
//  TodayCell.swift
//  AppStore-Copy
//
//  Created by Кирилл Иванов on 10/07/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

class TodayCell: BaseTodayCell {
    
    override var todayItem: TodayItem! {
        didSet {
            categoryLabel.text = todayItem.category
            titleLabel.text = todayItem.title
            descriptionLabel.text = todayItem.decription
            imageView.image = todayItem.image
            backgroundColor = todayItem.backgroundColor
            backgroundView?.backgroundColor = todayItem.backgroundColor
        }
    }
    public var topConstraint: NSLayoutConstraint!
    fileprivate let categoryLabel = UILabel(text: "LIFE HACK", font: .boldSystemFont(ofSize: 20))
    fileprivate let titleLabel = UILabel(text: "Utilizing your Time", font: .boldSystemFont(ofSize: 28))
    fileprivate let descriptionLabel = UILabel(text: "All the tools and apps you need to intelligently organize your life the right way", font: .systemFont(ofSize: 16), numberOfLines: 3)
    fileprivate let imageView = UIImageView(image: #imageLiteral(resourceName: "garden"))
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        layer.cornerRadius = 16
        imageView.clipsToBounds = true
        let containerImageView = UIView()
        imageView.contentMode = .scaleAspectFill
        containerImageView.addSubview(imageView)
        imageView.centerInSuperview(size: .init(width: 200, height: 200))
        
        let stackView = VerticalStackView(arrangedSubviews: [
            categoryLabel, titleLabel, containerImageView, descriptionLabel
            ], spacing: 8)
        addSubview(stackView)
        stackView.addConsctraints(leadingAnchor, trailingAnchor, nil, bottomAnchor, .init(top: 0, left: 24, bottom: 24, right: 24))
        self.topConstraint = stackView.topAnchor.constraint(equalTo: topAnchor, constant: 24)
        self.topConstraint.isActive = true
    }
}
