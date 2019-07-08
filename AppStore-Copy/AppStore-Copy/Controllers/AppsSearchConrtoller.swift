//
//  AppsSearchConrtoller.swift
//  AppStore-Copy
//
//  Created by Кирилл Иванов on 09/07/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

class AppsSearchController: UICollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
