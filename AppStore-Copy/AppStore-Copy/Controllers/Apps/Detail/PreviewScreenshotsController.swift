//
//  PreviewScreenshotsController.swift
//  AppStore-Copy
//
//  Created by Кирилл Иванов on 10/07/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

class PreviewSceenshotController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let screenshotCellId = "screenshotCell"
    public var app: Result? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    class ScreenshotCell: BaseCollectionCell {
        
        let screenshotImageView = UIImageView(cornerRadius: 8)
        
        override func setupViews() {
            super.setupViews()
            addSubview(screenshotImageView)
            screenshotImageView.fillSuperview()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(ScreenshotCell.self, forCellWithReuseIdentifier: screenshotCellId)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 250, height: view.frame.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return app?.screenshotUrls.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: screenshotCellId, for: indexPath) as! ScreenshotCell
        if let screenshotUrl = app?.screenshotUrls[indexPath.item] {
            cell.screenshotImageView.sd_setImage(with: URL(string: screenshotUrl))
        }
        return cell
    }
}
