//
//  TodayFullscreenController.swift
//  AppStore-Copy
//
//  Created by Кирилл Иванов on 10/07/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

class TodayFullscreenController: UITableViewController {
    
    var closeHandler: (()->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = TodayFullscreenHeaderCell()
            cell.closeButton.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
            return cell
        }
        return TodayFullscreenDescriptionCell()
    }
    
    @objc fileprivate func handleDismiss(sender: UIButton) {
        sender.isHidden = true
        closeHandler!()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 400
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
}
