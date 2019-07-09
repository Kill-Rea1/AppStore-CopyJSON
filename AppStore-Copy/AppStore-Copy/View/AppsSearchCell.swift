//
//  AppsSearchCell.swift
//  AppStore-Copy
//
//  Created by Кирилл Иванов on 09/07/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

class AppsSearchCell: UICollectionViewCell {
    
    public let appIconImageView: UIImageView = {
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
    
    lazy var screenshoot1ImageView = self.createImageView()
    lazy var screenshoot2ImageView = self.createImageView()
    lazy var screenshoot3ImageView = self.createImageView()
    
    func createImageView() -> UIImageView {
        let iv = UIImageView()
        iv.backgroundColor = .blue
        return iv
    }
    
    public let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.layer.cornerRadius = 16
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        let infoTopStackView = UIStackView(arrangedSubviews: [
            appIconImageView, VericalStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingsLabel]), getButton
            ])
        infoTopStackView.alignment = .center
        infoTopStackView.spacing = 12
        
        let screenshootsStackView = UIStackView(arrangedSubviews: [
            screenshoot1ImageView, screenshoot2ImageView, screenshoot3ImageView
            ])
        screenshootsStackView.spacing = 12
        screenshootsStackView.distribution = .fillEqually
        
        let cellStackView = VericalStackView(arrangedSubviews: [
            infoTopStackView, screenshootsStackView], spacing: 16)
        addSubview(cellStackView)
        cellStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
