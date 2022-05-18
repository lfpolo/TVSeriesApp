//
//  FavoritesDataProviderProtocol.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 18/05/22.
//

protocol FavoritesDataProviderProtocol {
    func loadFavoritesIds() -> [Int]
    func saveFavorite(showId: Int)
    func deleteFavorite(showId: Int)
}
