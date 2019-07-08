//
//  BaseTabController.swift
//  AppStore-Copy
//
//  Created by Кирилл Иванов on 09/07/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

class BaseTabController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        let appsController = UIViewController()
        appsController.view.backgroundColor = .white
        appsController.navigationItem.title = "Apps"
        let appsNavController = UINavigationController(rootViewController: appsController)
        appsNavController.tabBarItem.title = "Apps"
        appsNavController.tabBarItem.image = #imageLiteral(resourceName: "apps")
        appsNavController.navigationBar.prefersLargeTitles = true
        
        let searchController = UIViewController()
        searchController.view.backgroundColor = .white
        searchController.navigationItem.title = "Search"
        let searchNavController = UINavigationController(rootViewController: searchController)
        searchNavController.tabBarItem.title = "Search"
        searchNavController.tabBarItem.image = #imageLiteral(resourceName: "search")
        searchNavController.navigationBar.prefersLargeTitles = true
        
        viewControllers = [
            appsNavController,
            searchNavController
        ]
    }
}
