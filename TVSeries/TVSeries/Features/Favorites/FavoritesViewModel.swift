//
//  FavoritesViewModel.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 18/05/22.
//

import Foundation

class FavoritesViewModel: FavoritesViewModelProtocol {
    weak var delegate: FavoritesViewModelDelegate?
    private var showsDataProvider: MazeTVDataProviderProtocol
    private var favoritesDataProvider: FavoritesDataProviderProtocol
    var showList: [TVShowDetail] = []
    
    init(showsDataProvider: MazeTVDataProviderProtocol, favoritesDataProvider: FavoritesDataProviderProtocol) {
        self.showsDataProvider = showsDataProvider
        self.favoritesDataProvider = favoritesDataProvider
    }
    
    func loadFavorites() {
        let dispatchGroup = DispatchGroup()
        let favoritesIds = favoritesDataProvider.loadFavoritesIds()
        var showListTemp: [TVShowDetail] = []
        for showId in favoritesIds {
            dispatchGroup.enter()
            showsDataProvider.loadShowDetail(showId: showId) { showDetailedInfo, requestError in
                if let showDetailedInfo = showDetailedInfo {
                    showListTemp.append(showDetailedInfo)
                }
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            self.showList = showListTemp.sorted(by: { $0.name < $1.name })
            self.delegate?.didGetShowList()
        }
    }
}
