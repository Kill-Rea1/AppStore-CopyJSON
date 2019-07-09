//
//  Helpers+Extensions.swift
//  AppStore-Copy
//
//  Created by Кирилл Иванов on 09/07/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

extension UIView {
    func fillSuperview(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        if let superviewLeadingAnchorr = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchorr, constant: padding.left).isActive = true
        }
        if let superviewBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
        if let superviewTrailimgAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailimgAnchor, constant: -padding.right).isActive = true
        }
    }
    
    func addConsctraints(_ leadingAnchor: NSLayoutXAxisAnchor?, _ trailingAnchor: NSLayoutXAxisAnchor?, _ topAnchor: NSLayoutYAxisAnchor?, _ bottomAnchor: NSLayoutYAxisAnchor?, _ padding: UIEdgeInsets = .zero, _ size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let leading = leadingAnchor {
            self.leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        if let trailing = trailingAnchor {
            self.trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        if let top = topAnchor {
            self.topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let bottom = bottomAnchor {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        addSize(to: size)
    }
    
    func addSize(to size: CGSize) {
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width)
        }
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height)
        }
    }
    
    func constraintWidth(constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    func constraintHeight(constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: constant).isActive = true
    }
}

extension UILabel {
    convenience init(text: String, font: UIFont) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
    }
}

extension UIImageView {
    convenience init(cornerRadius: CGFloat) {
        self.init(image: nil)
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}

extension UIButton {
    convenience init(title: String) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
    }
}

class VericalStackView: UIStackView {
    init(arrangedSubviews: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        arrangedSubviews.forEach({addArrangedSubview($0)})
        self.axis = .vertical
        self.spacing = spacing
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class BaseCollectionController: UICollectionViewController {
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
