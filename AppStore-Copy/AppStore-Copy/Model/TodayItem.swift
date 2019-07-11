//
//  TodayItem.swift
//  AppStore-Copy
//
//  Created by Кирилл Иванов on 10/07/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

struct TodayItem {
    let category: String
    let title: String
    let image: UIImage
    let decription: String
    let backgroundColor: UIColor
    let apps: [FeedResult]
    
    // enum
    let cellType: CellType
    enum CellType: String {
        case single, multiple
    }
}
