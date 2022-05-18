//
//  FavoritesViewModelDelegate.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 18/05/22.
//

protocol FavoritesViewModelDelegate: AnyObject {
    func didGetShowList()
    func didGetError(description: String)
}
