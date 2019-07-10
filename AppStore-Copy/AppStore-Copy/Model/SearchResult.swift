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
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
    let artworkUrl100: String
    let screenshotUrls: [String]
    let formattedPrice: String
    let description: String
    let releaseNotes: String
    let sellerName: String
    let version: String
}
