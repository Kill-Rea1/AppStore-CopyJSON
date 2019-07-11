//
//  SearchResult.swift
//  AppStore-Copy
//
//  Created by Кирилл Иванов on 09/07/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackId: Int
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
    let artworkUrl100: String
    var screenshotUrls: [String]?
    var formattedPrice: String?
//    let description: String
    var releaseNotes: String?
    var sellerName: String?
    var version: String?
    var artistName: String?
    var collectionName: String?
    
}
