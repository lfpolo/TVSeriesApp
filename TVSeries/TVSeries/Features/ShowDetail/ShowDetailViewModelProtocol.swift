//
//  ShowDetailViewModelProtocol.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 17/05/22.
//

protocol ShowDetailViewModelProtocol {
    var delegate: ShowDetailViewModelDelegate? { get set }
    var showDetail: TVShowDetail? { get }
    var episodesDict: [Int: [TVShowEpisode]] { get }
    var seasonList: [Int] { get }
    var isFavorite: Bool { get }
    func loadShowDetail()
    func loadEpisodes()
    func selectFavorite()
}
