//
//  MusicCell.swift
//  AppStore-Copy
//
//  Created by Кирилл Иванов on 11/07/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

class MusicCell: BaseCollectionCell {
    
    public var track: Result! {
        didSet {
            imageView.sd_setImage(with: URL(string: track.artworkUrl100))
            trackNameLabel.text = track.trackName
            subtitleLabel.text = "\(track.artistName ?? "") • \(track.collectionName ?? "") • \(track.primaryGenreName)"
        }
    }
    fileprivate let imageView = UIImageView(cornerRadius: 16)
    fileprivate let trackNameLabel = UILabel(text: "Track Name", font: .boldSystemFont(ofSize: 20))
    fileprivate let subtitleLabel = UILabel(text: "Author", font: .systemFont(ofSize: 16), numberOfLines: 2)
    fileprivate let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.3, alpha: 0.3)
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        imageView.clipsToBounds = true
        imageView.backgroundColor = .red
        imageView.constraintWidth(constant: 68)
        imageView.constraintHeight(constant: 68)
        
        let stackView = UIStackView(arrangedSubviews: [
            imageView, VerticalStackView(arrangedSubviews: [
                trackNameLabel, subtitleLabel
                ], spacing: 4)
            ], customSpacing: 16)
        stackView.alignment = .center
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
        addSubview(separatorView)
        separatorView.addConsctraints(leadingAnchor, trailingAnchor, nil, bottomAnchor, .init(top: 0, left: 16, bottom: -7, right: 16), .init(width: 0, height: 0.5))
    }
}
