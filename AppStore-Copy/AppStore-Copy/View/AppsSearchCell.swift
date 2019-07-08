//
//  AppsSearchCell.swift
//  AppStore-Copy
//
//  Created by Кирилл Иванов on 09/07/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

class AppsSearchCell: UICollectionViewCell {
    
    public let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    public let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "APP NAME"
        return label
    }()
    
    public let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "CATEGORY"
        return label
    }()
    
    public let ratingsLabel: UILabel = {
        let label = UILabel()
        label.text = "RATINGS"
        return label
    }()
    
    public let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let labelsStackView = UIStackView(arrangedSubviews: [
            nameLabel, categoryLabel, ratingsLabel
            ])
        labelsStackView.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [
            imageView, labelsStackView, getButton
            ])
        stackView.alignment = .center
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
