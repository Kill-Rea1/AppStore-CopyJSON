//
//  MultipleAppCell.swift
//  AppStore-Copy
//
//  Created by Кирилл Иванов on 11/07/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

class MultipleAppCell: BaseCollectionCell {
    
    public var app: FeedResult! {
        didSet {
            nameLabel.text = app.name
            companyLabel.text = app.artistName
            imageView.sd_setImage(with: URL(string: app.artworkUrl100))
        }
    }
    fileprivate let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.3, alpha: 0.3)
        return view
    }()
    fileprivate let imageView = UIImageView(cornerRadius: 12)
    fileprivate let nameLabel = UILabel(text: "App Name" , font: .systemFont(ofSize: 20), numberOfLines: 2)
    fileprivate let companyLabel = UILabel(text: "Company name", font: .systemFont(ofSize: 13))
    fileprivate let getButton = UIButton(title: "GET", cornerRadius: 16, font: UIFont.boldSystemFont(ofSize: 16))
    
    override func setupViews() {
        super.setupViews()
        companyLabel.textColor = .lightGray
        imageView.constraintWidth(constant: 64)
        imageView.constraintHeight(constant: 64)
        getButton.constraintHeight(constant: 32)
        getButton.constraintWidth(constant: 80)
        let stackView = UIStackView(arrangedSubviews: [
            imageView, VerticalStackView(arrangedSubviews: [nameLabel, companyLabel], spacing: 4), getButton
            ])
        stackView.spacing = 16
        stackView.alignment = .center
        addSubview(stackView)
        stackView.fillSuperview()
        addSubview(separatorView)
        separatorView.addConsctraints(nameLabel.leadingAnchor, trailingAnchor, nil, bottomAnchor, .init(top: 0, left: 0, bottom: -8, right: 0), .init(width: 0, height: 0.5))
    }
}
