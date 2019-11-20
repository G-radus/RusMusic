//
//  SearchResponse.swift
//  RusMusic
//
//  Created by Rustam Gradov on 24.10.2019.
//  Copyright © 2019 Rustam Gradov. All rights reserved.
//

import Foundation

struct SearchResponse: Decodable {
    var resultCount: Int
    var results: [Track]
}

struct Track: Decodable {
    var artistName: String
    var trackName: String
    var collectionName: String?
    var artworkUrl100: String?
    var previewUrl: String?
}
