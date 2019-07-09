//
//  AppRowCell.swift
//  AppStore-Copy
//
//  Created by Кирилл Иванов on 09/07/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

class AppRowCell: UICollectionViewCell {
    
    public let imageView = UIImageView(cornerRadius: 12)
    public let nameLabel = UILabel(text: "App Name" , font: .systemFont(ofSize: 20))
    public let companyLabel = UILabel(text: "Company name", font: .systemFont(ofSize: 13))
    fileprivate let getButton = UIButton(title: "GET", cornerRadius: 16, font: UIFont.boldSystemFont(ofSize: 16))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nameLabel.numberOfLines = 2
        companyLabel.textColor = .lightGray
        imageView.constraintWidth(constant: 64)
        imageView.constraintHeight(constant: 64)
        getButton.constraintHeight(constant: 32)
        getButton.constraintWidth(constant: 80)
        let stackView = UIStackView(arrangedSubviews: [
            imageView, VericalStackView(arrangedSubviews: [nameLabel, companyLabel], spacing: 4), getButton
            ])
        stackView.spacing = 16
        stackView.alignment = .center
        addSubview(stackView)
        stackView.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
