//
//  AppsHorizontalController.swift
//  AppStore-Copy
//
//  Created by Кирилл Иванов on 09/07/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

class AppsHorizontalController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let spacing: CGFloat = 12
    fileprivate let lineSpacing: CGFloat = 10
    
    fileprivate let cellId = "appRowCellId"
    public var appGroup: AppGroup?
    public var didSelectHandler: ((FeedResult)->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(AppRowCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let app = appGroup?.feed.results[indexPath.item] {
            didSelectHandler?(app)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appGroup?.feed.results.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppRowCell
        let app = appGroup?.feed.results[indexPath.item]
        cell.nameLabel.text = app?.name
        cell.companyLabel.text = app?.artistName
        cell.imageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height - 24 - 20) / 3
        return .init(width: view.frame.width - 48, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: spacing, left: 0, bottom: spacing, right: 0)
    }
}
