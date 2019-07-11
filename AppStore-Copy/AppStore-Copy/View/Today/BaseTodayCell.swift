//
//  BaseTodayCell.swift
//  AppStore-Copy
//
//  Created by Кирилл Иванов on 11/07/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

class BaseTodayCell: BaseCollectionCell {
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                performAnimations(transform: .init(scaleX: 0.9, y: 0.9))
            } else {
                performAnimations(transform: .identity)
            }
        }
    }
    var todayItem: TodayItem!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundView = UIView()
        self.backgroundView?.backgroundColor = .white
        self.backgroundView?.layer.cornerRadius = 16
        self.backgroundView?.layer.shadowOpacity = 0.1
        self.backgroundView?.layer.shadowRadius = 10
        self.backgroundView?.layer.shouldRasterize = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    fileprivate func performAnimations(transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.transform = transform
        })
    }
}
