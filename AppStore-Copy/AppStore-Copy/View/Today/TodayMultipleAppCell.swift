//
//  TodayMultipleAppCell.swift
//  AppStore-Copy
//
//  Created by Кирилл Иванов on 10/07/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

class TodayMultipleAppCell: BaseTodayCell {
    
    override var todayItem: TodayItem! {
        didSet {
            categoryLabel.text = todayItem.category
            titleLabel.text = todayItem.title
        }
    }
    
    fileprivate let categoryLabel = UILabel(text: "Category", font: .boldSystemFont(ofSize: 20))
    fileprivate let titleLabel = UILabel(text: "Title", font: .boldSystemFont(ofSize: 32), numberOfLines: 2)
    
    fileprivate let multipleAppsController = UIViewController()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        layer.cornerRadius = 16
        
        
        multipleAppsController.view.backgroundColor = .red
        let stackView = VerticalStackView(arrangedSubviews: [
            categoryLabel, titleLabel, multipleAppsController.view
            ], spacing: 12)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
    }
}
