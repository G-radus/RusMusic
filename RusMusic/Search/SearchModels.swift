//
//  SearchModels.swift
//  RusMusic
//
//  Created by Rustam Gradov on 24.10.2019.
//  Copyright (c) 2019 Rustam Gradov. All rights reserved.
//

import UIKit
import SwiftUI

enum Search {
    
    enum Model {
        struct Request {
            enum RequestType {
                case getTracks(searchTerm: String)
            }
        }
        struct Response {
            enum ResponseType {
                case presentTracks(searchResponse: SearchResponse?)
                case presentFooterView
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case displayTracks(searchViewModel: SearchViewModel)
                case presentFooterView
            }
        }
    }
}

class SearchViewModel: NSObject, NSCoding {
    func encode(with coder: NSCoder) {
        coder.encode(cells, forKey: "cells")
    }
    
    required init?(coder: NSCoder) {
        cells = coder.decodeObject(forKey: "cells") as? [SearchViewModel.Cell] ?? []
    }
    
    @objc(_TtCC8RusMusic15SearchViewModel4Cell)class Cell: NSObject, NSCoding, Identifiable  {
        
        var id = UUID() 
        var iconUrlString: String?
        var artistName: String
        var trackName: String
        var collectionName: String
        var previewUrl: String?
        
        func encode(with coder: NSCoder) {
            coder.encode(iconUrlString, forKey: "iconUrlString")
            coder.encode(artistName, forKey: "artistName")
            coder.encode(trackName, forKey: "trackName")
            coder.encode(collectionName, forKey: "collectionName")
            coder.encode(previewUrl, forKey: "previewUrl")
        }
        
        required init?(coder: NSCoder) {
            iconUrlString = coder.decodeObject(forKey: "iconUrlString") as? String? ?? ""
            artistName = coder.decodeObject(forKey: "artistName") as? String ?? ""
            trackName = coder.decodeObject(forKey: "trackName") as? String ?? ""
            collectionName = coder.decodeObject(forKey: "collectionName") as? String ?? ""
            previewUrl = coder.decodeObject(forKey: "previewUrl") as? String? ?? ""
        }
        
        init(iconUrlString: String?,
             artistName: String,
             trackName: String,
             collectionName: String,
             previewUrl: String?) {
            self.iconUrlString = iconUrlString
            self.artistName = artistName
            self.trackName = trackName
            self.collectionName = collectionName
            self.previewUrl = previewUrl
        }
    }
    
    init(cells: [Cell]) {
        self.cells = cells
    }
    let cells: [Cell ]
}
