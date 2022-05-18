//
//  FavoritesViewModelProtocol.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 18/05/22.
//

protocol FavoritesViewModelProtocol {
    var delegate: FavoritesViewModelDelegate? { get set }
    var showList: [TVShowDetail] { get }
    func loadFavorites()
}
