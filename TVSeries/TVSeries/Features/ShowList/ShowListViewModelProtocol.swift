//
//  ShowListViewModelProtocol.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 16/05/22.
//

protocol ShowListViewModelProtocol {
    func loadShowList()
    func loadMoreShows()
    func searchShows(text: String)
    var delegate: ShowListViewModelDelegate? { get set }
    var showList: [TVShow] { get }
}
