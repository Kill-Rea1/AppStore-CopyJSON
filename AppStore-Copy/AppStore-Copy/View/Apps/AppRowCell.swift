//
//  AppRowCell.swift
//  AppStore-Copy
//
//  Created by Кирилл Иванов on 09/07/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

class AppRowCell: UICollectionViewCell {
    
    let imageView = UIImageView(cornerRadius: 12)
    
    let nameLabel = UILabel(text: "App Name" , font: .systemFont(ofSize: 20))
    
    let companyLabel = UILabel(text: "Company name", font: .systemFont(ofSize: 13))
    
    let getButton = UIButton(title: "GET")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.constraintWidth(constant: 64)
        imageView.constraintHeight(constant: 64)
        imageView.backgroundColor = .red
        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        getButton.constraintHeight(constant: 32)
        getButton.constraintWidth(constant: 80)
        getButton.layer.cornerRadius = 32/2
        getButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        
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
