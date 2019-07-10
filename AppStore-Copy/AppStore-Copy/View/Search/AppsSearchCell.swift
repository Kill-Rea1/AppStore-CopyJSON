//
//  AppsSearchCell.swift
//  AppStore-Copy
//
//  Created by Кирилл Иванов on 09/07/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

class AppsSearchCell: UICollectionViewCell {
    
    public var app: Result! {
        didSet {
            nameLabel.text = app.trackName
            categoryLabel.text = app.primaryGenreName
            ratingsLabel.text = "Rating: \(app.averageUserRating ?? 0)"
            appIconImageView.sd_setImage(with: URL(string: app.artworkUrl100))
            screenshoot1ImageView.sd_setImage(with: URL(string: app.screenshotUrls[0]))
            if app.screenshotUrls.count > 1 {
                screenshoot2ImageView.sd_setImage(with: URL(string: app.screenshotUrls[1]))
            }
            if app.screenshotUrls.count > 2 {
                screenshoot3ImageView.sd_setImage(with: URL(string: app.screenshotUrls[2]))
            }
        }
    }
    fileprivate let appIconImageView = UIImageView(cornerRadius: 12)
    fileprivate let nameLabel = UILabel()
    fileprivate let categoryLabel = UILabel()
    fileprivate let ratingsLabel = UILabel()
    fileprivate lazy var screenshoot1ImageView = self.createImageView()
    fileprivate lazy var screenshoot2ImageView = self.createImageView()
    fileprivate lazy var screenshoot3ImageView = self.createImageView()
    
    fileprivate func createImageView() -> UIImageView {
        let iv = UIImageView(cornerRadius: 8)
        iv.layer.borderWidth = 0.5
        iv.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        return iv
    }
    
    fileprivate let getButton = UIButton(title: "GET", cornerRadius: 16, font: UIFont.boldSystemFont(ofSize: 16))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        getButton.constraintWidth(constant: 80)
        getButton.constraintHeight(constant: 32)
        appIconImageView.constraintWidth(constant: 64)
        appIconImageView.constraintHeight(constant: 64)
        let infoTopStackView = UIStackView(arrangedSubviews: [
            appIconImageView, VerticalStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingsLabel]), getButton
            ])
        infoTopStackView.alignment = .center
        infoTopStackView.spacing = 12
        
        let screenshootsStackView = UIStackView(arrangedSubviews: [
            screenshoot1ImageView, screenshoot2ImageView, screenshoot3ImageView
            ])
        screenshootsStackView.spacing = 12
        screenshootsStackView.distribution = .fillEqually
        
        let cellStackView = VerticalStackView(arrangedSubviews: [
            infoTopStackView, screenshootsStackView], spacing: 16)
        addSubview(cellStackView)
        cellStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
