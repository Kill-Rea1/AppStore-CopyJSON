//
//  MusicLoadingFooter.swift
//  AppStore-Copy
//
//  Created by Кирилл Иванов on 11/07/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

class MusicLoadingFooter: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        let activityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicatorView.color = .darkGray
        activityIndicatorView.startAnimating()
        let label = UILabel(text: "Loading more...", font: .systemFont(ofSize: 16))
        label.textAlignment = .center
        let stackView = VerticalStackView(arrangedSubviews: [
            activityIndicatorView, label
            ], spacing: 8)
        addSubview(stackView)
        stackView.centerInSuperview(size: .init(width: frame.width, height: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
