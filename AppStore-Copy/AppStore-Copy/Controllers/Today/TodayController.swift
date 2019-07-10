//
//  TodayController.swift
//  AppStore-Copy
//
//  Created by Кирилл Иванов on 10/07/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

class TodayController: BaseCollectionController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let todayCellId = "todayCell"
    fileprivate var startingFrame: CGRect?
    fileprivate var todayFullscreenController: TodayFullscreenController!
    var topConstraint: NSLayoutConstraint?
    var leadingConstraint: NSLayoutConstraint?
    var widthConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?
    
    let items = [
        TodayItem.init(category: "LIFE HACK", title: "Utilizing your Time", image: #imageLiteral(resourceName: "garden"), decription: "All the tools and apps you need to intelligently organize your life the right way", backgroundColor: .white),
        TodayItem.init(category: "HOLIDAYS", title: "Travel on a Budget", image: #imageLiteral(resourceName: "holiday"), decription: "Find out all you need to know on how to travel without packing everything!", backgroundColor: #colorLiteral(red: 0.9876399636, green: 0.9689267278, blue: 0.7308762074, alpha: 1))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        collectionView.backgroundColor = #colorLiteral(red: 0.948936522, green: 0.9490727782, blue: 0.9489068389, alpha: 1)
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: todayCellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let todayFullscreenController = TodayFullscreenController()
        let todayFullscreenView = todayFullscreenController.view!
        todayFullscreenController.todayItem = items[indexPath.item]
        view.addSubview(todayFullscreenView)
        addChild(todayFullscreenController)
        self.todayFullscreenController = todayFullscreenController
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
        self.startingFrame = startingFrame
        todayFullscreenController.closeHandler = {
            self.handleRemoveFullscreenView()
        }
        todayFullscreenView.translatesAutoresizingMaskIntoConstraints = false
        topConstraint = todayFullscreenView.topAnchor.constraint(equalTo: view.topAnchor, constant: startingFrame.origin.y)
        leadingConstraint = todayFullscreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: startingFrame.origin.x)
        widthConstraint = todayFullscreenView.widthAnchor.constraint(equalToConstant: startingFrame.width)
        heightConstraint = todayFullscreenView.heightAnchor.constraint(equalToConstant: startingFrame.height)
        
        [topConstraint, leadingConstraint, widthConstraint, heightConstraint].forEach({$0?.isActive = true})
        self.view.layoutIfNeeded()
        
        todayFullscreenView.layer.cornerRadius = 16
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            
            self.topConstraint?.constant = 0
            self.leadingConstraint?.constant = 0
            self.widthConstraint?.constant = self.view.frame.width
            self.heightConstraint?.constant = self.view.frame.height
            self.view.layoutIfNeeded()
            self.tabBarController?.tabBar.transform = CGAffineTransform(translationX: 0, y: 100)
            
            guard let cell = todayFullscreenController.tableView.cellForRow(at: [0, 0]) as? TodayFullscreenHeaderCell else { return }
            cell.todayCell.topConstraint.constant = 48
            cell.layoutIfNeeded()
            
        }, completion: nil)
    }
    
    @objc fileprivate func handleRemoveFullscreenView() {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            
            self.todayFullscreenController.tableView.contentOffset = .zero
            
            guard let startingFrame = self.startingFrame else { return }
            
            self.topConstraint?.constant = startingFrame.origin.y
            self.leadingConstraint?.constant = startingFrame.origin.x
            self.widthConstraint?.constant = startingFrame.width
            self.heightConstraint?.constant = startingFrame.height
            self.view.layoutIfNeeded()
            
            guard let cell = self.todayFullscreenController.tableView.cellForRow(at: [0, 0]) as? TodayFullscreenHeaderCell else { return }
            cell.todayCell.topConstraint.constant = 24
            cell.layoutIfNeeded()
            
            self.collectionView.isUserInteractionEnabled = false
            
            self.tabBarController?.tabBar.transform = .identity
        }) { (_) in
            self.todayFullscreenController.removeFromParent()
            self.todayFullscreenController.view.removeFromSuperview()
            self.collectionView.isUserInteractionEnabled = true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 64, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 32, left: 0, bottom: 32, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: todayCellId, for: indexPath) as! TodayCell
        cell.todayItem = items[indexPath.item]
        return cell
    }
}
