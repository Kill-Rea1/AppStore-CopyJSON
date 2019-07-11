//
//  TodayController.swift
//  AppStore-Copy
//
//  Created by Кирилл Иванов on 10/07/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

class TodayController: BaseCollectionController, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate {
    
    static let cellSize: CGFloat = 500
    
    fileprivate var todayFullScreenBeginOffset: CGFloat = 0
    fileprivate var startingFrame: CGRect?
    fileprivate var todayFullscreenController: TodayFullscreenController!
    fileprivate var anchoredConstraints: AnchoredConstraints?
    fileprivate let activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .whiteLarge)
        aiv.color = .black
        aiv.startAnimating()
        aiv.hidesWhenStopped = true
        return aiv
    }()
    fileprivate var items = [TodayItem]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.superview?.setNeedsLayout()
    }
    
    fileprivate let blurVisualEffect = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(blurVisualEffect)
        blurVisualEffect.fillSuperview()
        blurVisualEffect.alpha = 0
        view.addSubview(activityIndicatorView)
        activityIndicatorView.centerInSuperview()
        navigationController?.isNavigationBarHidden = true
        collectionView.backgroundColor = #colorLiteral(red: 0.948936522, green: 0.9490727782, blue: 0.9489068389, alpha: 1)
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: TodayItem.CellType.single.rawValue)
        collectionView.register(TodayMultipleAppCell.self, forCellWithReuseIdentifier: TodayItem.CellType.multiple.rawValue)
        
        fetchData()
    }
    
    fileprivate func fetchData() {
        let dispatchGroup = DispatchGroup()
        var topGrossingGroup: AppGroup?
        var gamesWeLoveGroup: AppGroup?
        dispatchGroup.enter()
        Service.shared.fetchTopGrossingGames { (appGroup, error) in
            dispatchGroup.leave()
            if let error = error {
                print(error)
                return
            }
            guard let appGroup = appGroup else { return }
            topGrossingGroup = appGroup
        }
        dispatchGroup.enter()
        Service.shared.fetchGamesWeLove { (appGroup, error) in
            dispatchGroup.leave()
            if let error = error {
                print(error)
                return
            }
            guard let appGroup = appGroup else { return }
            gamesWeLoveGroup = appGroup
        }
        dispatchGroup.notify(queue: .main) {
            self.items = [
                TodayItem.init(category: "LIFE HACK", title: "Utilizing your Time", image: #imageLiteral(resourceName: "garden"), decription: "All the tools and apps you need to intelligently organize your life the right way", backgroundColor: .white, apps: [], cellType: .single),
                TodayItem.init(category: "Daily list", title: topGrossingGroup?.feed.title ?? "", image: #imageLiteral(resourceName: "garden"), decription: "", backgroundColor: .white, apps: topGrossingGroup?.feed.results ?? [], cellType: .multiple),
                TodayItem.init(category: "HOLIDAYS", title: "Travel on a Budget", image: #imageLiteral(resourceName: "holiday"), decription: "Find out all you need to know on how to travel without packing everything!", backgroundColor: #colorLiteral(red: 0.9876399636, green: 0.9689267278, blue: 0.7308762074, alpha: 1), apps: [], cellType: .single),
                TodayItem.init(category: "Daily list", title: gamesWeLoveGroup?.feed.title ?? "", image: #imageLiteral(resourceName: "garden"), decription: "", backgroundColor: .white, apps: gamesWeLoveGroup?.feed.results ?? [], cellType: .multiple)
            ]
            self.collectionView.reloadData()
            self.activityIndicatorView.stopAnimating()
        }
    }
    
    fileprivate func showDailyListFullscreen(_ indexPath: IndexPath) {
        let fullListController = TodayMultiplyAppsController(mode: .fullscreen)
        fullListController.apps = items[indexPath.item].apps
        present(CustomNavigationController(rootViewController: fullListController), animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch items[indexPath.item].cellType {
        case .multiple:
            showDailyListFullscreen(indexPath)
        default:
            showSingleAppFullscreen(indexPath)
        }
    }
    
    fileprivate func setupSingleAppFullscreenController(_ indexPath: IndexPath) {
        let todayFullscreenController = TodayFullscreenController()
        todayFullscreenController.todayItem = items[indexPath.item]
        todayFullscreenController.closeHandler = {
            self.handleRemoveFullscreenView()
        }
        todayFullscreenController.view.layer.cornerRadius = 16
        self.todayFullscreenController = todayFullscreenController
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handleDrag))
        todayFullscreenController.view.addGestureRecognizer(panGesture)
        panGesture.delegate = self
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    @objc fileprivate func handleDrag(gesture: UIPanGestureRecognizer) {
        if gesture.state == .began {
            todayFullScreenBeginOffset = todayFullscreenController.tableView.contentOffset.y
        }
        if todayFullscreenController.tableView.contentOffset.y > 0 {
            return
        }
        let translationY = gesture.translation(in: todayFullscreenController.view).y
        if gesture.state == .changed {
            let trueOffset = translationY - todayFullScreenBeginOffset
            var scale = min(1, 1 - trueOffset / 1000)
            scale = max(0.6, scale)
            let transform: CGAffineTransform = .init(scaleX: scale, y: scale)
            todayFullscreenController.view.transform = transform
        } else if gesture.state == .ended {
            if translationY > 0 {
                handleRemoveFullscreenView()
            }
        }
    }
    
    fileprivate func startingCellFrame(_ indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
        self.startingFrame = startingFrame
    }
    
    fileprivate func setupSingleAppFullscreenStartingPosition(_ indexPath: IndexPath) {
        let todayFullscreenView = todayFullscreenController.view!
        view.addSubview(todayFullscreenView)
        addChild(todayFullscreenController)
        startingCellFrame(indexPath)
        guard let startingFrame = startingFrame else { return }
        self.anchoredConstraints = todayFullscreenView.addConsctraints(view.leadingAnchor, nil, view.topAnchor, nil, .init(top: startingFrame.origin.y, left: startingFrame.origin.x, bottom: 0, right: 0), .init(width: startingFrame.width, height: startingFrame.height))
        self.view.layoutIfNeeded()
    }
    
    fileprivate func performAnimationFullscreen() {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            self.blurVisualEffect.alpha = 1
            self.anchoredConstraints?.top?.constant = 0
            self.anchoredConstraints?.leading?.constant = 0
            self.anchoredConstraints?.width?.constant = self.view.frame.width
            self.anchoredConstraints?.height?.constant = self.view.frame.height
            self.view.layoutIfNeeded()
            self.tabBarController?.tabBar.transform = CGAffineTransform(translationX: 0, y: 100)
            guard let cell = self.todayFullscreenController.tableView.cellForRow(at: [0, 0]) as? TodayFullscreenHeaderCell else { return }
            cell.todayCell.topConstraint.constant = 48
            cell.layoutIfNeeded()
        }, completion: nil)
    }
    
    fileprivate func showSingleAppFullscreen(_ indexPath: IndexPath) {
        setupSingleAppFullscreenController(indexPath)
        setupSingleAppFullscreenStartingPosition(indexPath)
        performAnimationFullscreen()
    }
    
    @objc fileprivate func handleRemoveFullscreenView() {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            self.blurVisualEffect.alpha = 0
            self.todayFullscreenController.tableView.contentOffset = .zero
            self.todayFullscreenController.view.transform = .identity
            guard let startingFrame = self.startingFrame else { return }
            self.anchoredConstraints?.top?.constant = startingFrame.origin.y
            self.anchoredConstraints?.leading?.constant = startingFrame.origin.x
            self.anchoredConstraints?.width?.constant = startingFrame.width
            self.anchoredConstraints?.height?.constant = startingFrame.height
            self.view.layoutIfNeeded()
            guard let cell = self.todayFullscreenController.tableView.cellForRow(at: [0, 0]) as? TodayFullscreenHeaderCell else { return }
            cell.closeButton.alpha = 0
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
        return .init(width: view.frame.width - 64, height: TodayController.cellSize)
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
        let cellType = items[indexPath.item].cellType
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.rawValue, for: indexPath) as! BaseTodayCell
        cell.todayItem = items[indexPath.item]
        (cell as? TodayMultipleAppCell)?.multipleAppsController.collectionView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleMultipleAppsTapped)))
        return cell
    }
    
    @objc fileprivate func handleMultipleAppsTapped(gesture: UITapGestureRecognizer) {
        let collectionView = gesture.view
        var superview = collectionView?.superview
        while superview != nil {
            if let cell = superview as? TodayMultipleAppCell {
                guard let indexPath = self.collectionView.indexPath(for: cell) else { return }
                let apps = items[indexPath.item].apps
                let fullListController = TodayMultiplyAppsController(mode: .fullscreen)
                fullListController.apps = apps
                present(CustomNavigationController(rootViewController: fullListController), animated: true)
                return
            }
            superview = superview?.superview
        }
    }
}
