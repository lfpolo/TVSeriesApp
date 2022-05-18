//
//  ShowListViewModel.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 15/05/22.
//

import Foundation

class ShowListViewModel: ShowListViewModelProtocol {
    weak var delegate: ShowListViewModelDelegate?
    var showList: [TVShow] { showFilteredList ? filteredList : allShowsList }
    private var dataProvider: MazeTVDataProviderProtocol
    private var allShowsList: [TVShow] = []
    private var filteredList: [TVShow] = []
    private var showFilteredList: Bool = false
    private var isLoading: Bool = false
    private var page = 0
    
    init(dataProvider: MazeTVDataProviderProtocol) {
        self.dataProvider = dataProvider
    }
    
    func loadShowList() {
        showFilteredList = false
        isLoading = true
        dataProvider.loadShows(pageId: page) { [weak self] shows, requestError in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let showList = shows {
                    self?.allShowsList += showList
                    self?.delegate?.didGetShowList()
                } else {
                    self?.delegate?.didGetError(description: requestError?.localizedDescription ?? "Error Loding Data")
                }
            }
        }
    }
    
    func loadMoreShows() {
        if !isLoading && !showFilteredList {
            page += 1
            loadShowList()
        }
    }
    
    func searchShows(text: String) {
        showFilteredList = true
        dataProvider.searchShows(text: text) { [weak self] shows, requestError in
            DispatchQueue.main.async {
                if let showList = shows {
                    self?.filteredList = showList.map( {$0.show} )
                    self?.delegate?.didGetShowList()
                } else {
                    self?.delegate?.didGetError(description: requestError?.localizedDescription ?? "Error Loding Data")
                }
            }
        }
    }
}
