//
//  SearchPresenter.swift
//  RusMusic
//
//  Created by Rustam Gradov on 24.10.2019.
//  Copyright (c) 2019 Rustam Gradov. All rights reserved.
//

import UIKit

protocol SearchPresentationLogic {
    func presentData(response: Search.Model.Response.ResponseType)
}

class SearchPresenter: SearchPresentationLogic {
    weak var viewController: SearchDisplayLogic?
    
    func presentData(response: Search.Model.Response.ResponseType) {
        
        switch response {
            
        case .presentTracks(let searchResults):
            let cells = searchResults?.results.map({ (track) in
                cellViewModel(from: track )
            }) ?? []
            let searchViewModel = SearchViewModel.init(cells: cells)
            print("presenter .presentTracks")
            viewController?.displayData(viewModel: Search.Model.ViewModel.ViewModelData.displayTracks(searchViewModel: searchViewModel))
        case .presentFooterView:
            viewController?.displayData(viewModel: Search.Model.ViewModel.ViewModelData.presentFooterView)
        }
    }
    private func cellViewModel(from track: Track) -> SearchViewModel.Cell {
        
        return SearchViewModel.Cell.init(iconUrlString: track.artworkUrl100,
                                         artistName: track.artistName,
                                         trackName: track.trackName,
                                         collectionName: track.collectionName ?? "",
                                         previewUrl: track.previewUrl)
    }
}
