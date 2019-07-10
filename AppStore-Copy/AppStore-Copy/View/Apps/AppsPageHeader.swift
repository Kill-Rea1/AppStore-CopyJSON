//
//  AppsPageHeader.swift
//  AppStore-Copy
//
//  Created by Кирилл Иванов on 09/07/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

class AppsPageHeader: BaseCollectionCell {
    
    public let appHeaderHorizontalController = AppsHeaderController()
    
    override func setupViews() {
        super.setupViews()
        addSubview(appHeaderHorizontalController.view)
        appHeaderHorizontalController.view.fillSuperview()
    }
}
