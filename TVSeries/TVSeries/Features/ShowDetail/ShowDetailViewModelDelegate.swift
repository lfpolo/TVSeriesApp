//
//  ShowDetailViewModelDelegate.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 17/05/22.
//

protocol ShowDetailViewModelDelegate: AnyObject {
    func didGetShowDetailedInfo()
    func didGetError(description: String)
    func didGetEpisodes()
}
