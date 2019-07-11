//
//  TodayFullscreenController.swift
//  AppStore-Copy
//
//  Created by Кирилл Иванов on 10/07/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

class TodayFullscreenController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    public var closeHandler: (()->())?
    public var todayItem: TodayItem?
    public let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "close_button"), for: .normal)
        return button
    }()
    public let tableView = UITableView(frame: .zero, style: .plain)
    fileprivate let floatingConteinerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.clipsToBounds = true
        setupTableView()
        setupCloseButton()
        setupFloatingController()
    }
    
    fileprivate func setupFloatingController() {
        floatingConteinerView.clipsToBounds = true
        floatingConteinerView.layer.cornerRadius = 16
        view.addSubview(floatingConteinerView)
        floatingConteinerView.addConsctraints(view.leadingAnchor, view.trailingAnchor, nil, view.bottomAnchor, .init(top: 0, left: 16, bottom: -90, right: 16), .init(width: 0, height: 90))
        let blurEffect = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
        floatingConteinerView.addSubview(blurEffect)
        blurEffect.fillSuperview()
        
        let imageView = UIImageView(cornerRadius: 16)
        imageView.image = todayItem?.image
        imageView.constraintWidth(constant: 64)
        imageView.constraintHeight(constant: 64)
        let getButton = UIButton(title: "GET", cornerRadius: 16, font: .boldSystemFont(ofSize: 16))
        getButton.backgroundColor = #colorLiteral(red: 0.3420237303, green: 0.3370920122, blue: 0.3414363265, alpha: 1)
        getButton.setTitleColor(.white, for: .normal)
        getButton.constraintWidth(constant: 80)
        getButton.constraintHeight(constant: 32)
        let stackView = UIStackView(arrangedSubviews: [
            imageView,
            VerticalStackView(arrangedSubviews: [UILabel(text: todayItem?.category ?? "", font: .boldSystemFont(ofSize: 18)), UILabel(text: todayItem?.title ?? "", font: .systemFont(ofSize: 16))], spacing: 4),
            getButton
            ], customSpacing: 16)
        stackView.alignment = .center
        floatingConteinerView.addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 0, left: 16, bottom: 0, right: 16))
    }
    
    fileprivate func setupTableView() {
        view.addSubview(tableView)
        tableView.fillSuperview()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.showsVerticalScrollIndicator = false
        let height = UIApplication.shared.statusBarFrame.height
        tableView.contentInset = .init(top: 0, left: 0, bottom: height, right: 0)
    }
    
    fileprivate func setupCloseButton() {
        view.addSubview(closeButton)
        closeButton.addConsctraints(nil, view.trailingAnchor, view.safeAreaLayoutGuide.topAnchor, nil, .init(top: 12, left: 0, bottom: 0, right: 0), .init(width: 80, height: 40))
        closeButton.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            scrollView.isScrollEnabled = false
            scrollView.isScrollEnabled = true
        }
        let transform = scrollView.contentOffset.y > 125 ? CGAffineTransform(translationX: 0, y: -90 - UIApplication.shared.statusBarFrame.height) : .identity
        performAnimations(transform: transform)
    }
    
    fileprivate func performAnimations(transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            self.floatingConteinerView.transform = transform
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = TodayFullscreenHeaderCell()
            cell.todayCell.todayItem = todayItem
            cell.clipsToBounds = true
            cell.todayCell.backgroundView = nil
            cell.todayCell.layer.cornerRadius = 0
            return cell
        }
        return TodayFullscreenDescriptionCell()
    }
    
    @objc fileprivate func handleDismiss(sender: UIButton) {
        sender.isHidden = true
        floatingConteinerView.transform = .identity
        closeHandler?()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return TodayController.cellSize
        }
        return UITableView.automaticDimension
    }
}
