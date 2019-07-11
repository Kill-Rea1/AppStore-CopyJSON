//
//  MusicController.swift
//  AppStore-Copy
//
//  Created by Кирилл Иванов on 11/07/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

class MusicController: BaseCollectionController, UICollectionViewDelegateFlowLayout{
    
    fileprivate let musicCellId = "musicCell"
    fileprivate let footerId = "footerId"
    fileprivate var results = [Result]()
    fileprivate let searchTerm = "taylor"
    fileprivate var isPaginating = false
    fileprivate var isDonePaginating = false

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(MusicCell.self, forCellWithReuseIdentifier: musicCellId)
        collectionView.register(MusicLoadingFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerId)
        fetchData(offset: results.count)
    }
    
    fileprivate func fetchData(offset: Int) {
        if !isPaginating {
            isPaginating = true
            let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&offset=\(offset)&limit=20"
            Service.shared.fetchGenericJSONData(urlString: urlString) { (searchResult: SearchResult?, error) in
                if let error = error {
                    print(error)
                    return
                }
                guard let searchResult = searchResult else { return }
                if searchResult.results.count == 0 {
                    self.isDonePaginating = true
                }
                sleep(2)
                self.results += searchResult.results
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                self.isPaginating = false
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerId, for: indexPath) as! MusicLoadingFooter
        return footer
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        let height: CGFloat = isDonePaginating ? 0 : 100
        return .init(width: view.frame.width, height: height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: musicCellId, for: indexPath) as! MusicCell
        cell.track = results[indexPath.item]
        if indexPath.item == results.count - 1 {
            fetchData(offset: results.count)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 100)
    }
}
