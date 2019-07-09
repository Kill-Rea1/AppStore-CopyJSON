//
//  AppHeaderCell.swift
//  AppStore-Copy
//
//  Created by Кирилл Иванов on 09/07/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

class AppHeaderCell: UICollectionViewCell {
    
    let companyLabel = UILabel(text: "Facebook", font: .systemFont(ofSize: 12))
    let titleLabel = UILabel(text: "Keeping up with friends faster than ever", font: .systemFont(ofSize: 24))
    let imageView = UIImageView(cornerRadius: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.backgroundColor = .red
        titleLabel.numberOfLines = 0
        companyLabel.textColor = .blue
        
        let stackView = VericalStackView(arrangedSubviews: [
            companyLabel, titleLabel, imageView
            ], spacing: 12)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
