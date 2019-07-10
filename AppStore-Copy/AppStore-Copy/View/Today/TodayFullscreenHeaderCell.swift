//
//  TodayFullscreenHeaderCell.swift
//  AppStore-Copy
//
//  Created by Кирилл Иванов on 10/07/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

class TodayFullscreenHeaderCell: UITableViewCell {
    
    fileprivate let todayCell = TodayCell()
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "close_button"), for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(todayCell)
        todayCell.fillSuperview()
        addSubview(closeButton)
        closeButton.addConsctraints(nil, trailingAnchor, topAnchor, nil, .init(top: 12, left: 0, bottom: 0, right: 12), .init(width: 80, height: 38))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
