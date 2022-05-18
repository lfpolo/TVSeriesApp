//
//  ShowDetailViewModel.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 15/05/22.
//

class ShowDetailViewModel: ShowDetailViewModelProtocol {
    weak var delegate: ShowDetailViewModelDelegate?
    private var showsDataProvider: MazeTVDataProviderProtocol
    private var favoritesDataProvider: FavoritesDataProviderProtocol
    private var showId: Int
    var showDetail: TVShowDetail?
    var episodesDict: [Int: [TVShowEpisode]] = [:]
    var seasonList: [Int] = []
    var isFavorite: Bool { favoritesDataProvider.loadFavoritesIds().contains(showId) }
    
    init(showId: Int, showsDataProvider: MazeTVDataProviderProtocol, favoritesDataProvider: FavoritesDataProviderProtocol) {
        self.showsDataProvider = showsDataProvider
        self.favoritesDataProvider = favoritesDataProvider
        self.showId = showId
    }
    
    func loadShowDetail() {
        showsDataProvider.loadShowDetail(showId: showId) { [weak self] showDetailedInfo, requestError in
            if let showDetailedInfo = showDetailedInfo {
                self?.showDetail = showDetailedInfo
                self?.delegate?.didGetShowDetailedInfo()
            } else {
                self?.delegate?.didGetError(description: requestError?.localizedDescription ?? "Error Loding Data")
            }
        }
    }
    
    func loadEpisodes() {
        showsDataProvider.loadShowEpisodeList(showId: showId) { [weak self] episodes, requestError in
            guard let self = self else { return }
            if let episodes = episodes {
                self.episodesDict = Dictionary(grouping: episodes, by: { $0.season })
                self.seasonList = Array(self.episodesDict.keys).sorted()
                self.delegate?.didGetEpisodes()
            } else {
                self.delegate?.didGetError(description: requestError?.localizedDescription ?? "Error Loding Data")
            }
        }
    }
    
    func selectFavorite() {
        isFavorite ? favoritesDataProvider.deleteFavorite(showId: showId) : favoritesDataProvider.saveFavorite(showId: showId)
    }
}
