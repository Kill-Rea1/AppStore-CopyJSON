//
//  AppDetailCell.swift
//  AppStore-Copy
//
//  Created by Кирилл Иванов on 10/07/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

class AppDetailCell: BaseCollectionCell {
    
    public var app: Result! {
        didSet {
            nameLabel.text = app?.trackName
            appIconImageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
            priceButton.setTitle(app?.formattedPrice, for: .normal)
            releaseNotesLabel.text = app?.releaseNotes
            companyLabel.text = app?.trackName
            versionLabel.text = app?.version
        }
    }
    
    fileprivate let appIconImageView = UIImageView(cornerRadius: 12)
    fileprivate let nameLabel = UILabel(text: "App Name", font: .boldSystemFont(ofSize: 20), numberOfLines: 2)
    fileprivate let companyLabel = UILabel(text: "Company name", font: .systemFont(ofSize: 14))
    fileprivate let priceButton = UIButton(title: "$4.99", cornerRadius: 16, font: .boldSystemFont(ofSize: 16))
    fileprivate let whatsNewLabel = UILabel(text: "What's New", font: .boldSystemFont(ofSize: 20))
    fileprivate let versionLabel = UILabel(text: "Version", font: .systemFont(ofSize: 16))
    fileprivate let releaseNotesLabel = UILabel(text: "Release Notes", font: .systemFont(ofSize: 16), numberOfLines: 0)
    
    override func setupViews() {
        super.setupViews()
        companyLabel.textColor = .lightGray
        versionLabel.textColor = .lightGray
        appIconImageView.constraintWidth(constant: 140)
        appIconImageView.constraintHeight(constant: 140)
        priceButton.constraintHeight(constant: 32)
        priceButton.constraintWidth(constant: 80)
        priceButton.backgroundColor = #colorLiteral(red: 0, green: 0.4778528214, blue: 0.9984964728, alpha: 1)
        priceButton.setTitleColor(.white, for: .normal)
        
        let stackView = VerticalStackView(arrangedSubviews: [
            UIStackView(arrangedSubviews: [
                appIconImageView,
                VerticalStackView(arrangedSubviews: [
                    nameLabel, companyLabel, UIView(),UIStackView(arrangedSubviews: [priceButton, UIView()]), UIView()
                    ], spacing: 12)], customSpacing: 20),
            whatsNewLabel,
            versionLabel,
            releaseNotesLabel
            ], spacing: 16)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
}
