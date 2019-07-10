//
//  AppHeaderCell.swift
//  AppStore-Copy
//
//  Created by Кирилл Иванов on 09/07/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

class AppHeaderCell: BaseCollectionCell {
    
    public let companyLabel = UILabel(text: "Facebook", font: .systemFont(ofSize: 12))
    public let titleLabel = UILabel(text: "Keeping up with friends faster than ever", font: .systemFont(ofSize: 24), numberOfLines: 2)
    public let imageView = UIImageView(cornerRadius: 8)
    
    override func setupViews() {
        super.setupViews()
        let stackView = VerticalStackView(arrangedSubviews: [
            companyLabel, titleLabel, imageView
            ], spacing: 12)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
}
