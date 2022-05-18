//
//  PeopleSearchViewModel.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 18/05/22.
//

import Foundation

class PeopleSearchViewModel: PeopleSearchViewModelProtocol {
    weak var delegate: PeopleSearchViewModelProtocolDelegate?
    var people: [Person] { showFilteredList ? filteredList : allPeople }
    private var dataProvider: MazeTVDataProviderProtocol
    private var allPeople: [Person] = []
    private var filteredList: [Person] = []
    private var showFilteredList: Bool = false
    private var isLoading: Bool = false
    private var page = 0

    
    init(dataProvider: MazeTVDataProviderProtocol) {
        self.dataProvider = dataProvider
    }
    
    func loadPeople() {
        showFilteredList = false
        isLoading = true
        dataProvider.loadPeople(pageId: page) { [weak self] peopleList, requestError in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let peopleList = peopleList {
                    self?.allPeople += peopleList
                    self?.delegate?.didGetPeopleList()
                } else {
                    self?.delegate?.didGetError(description: requestError?.localizedDescription ?? "Error Loding Data")
                }
            }
        }
    }
    
    func loadMorePeople() {
        if !isLoading && !showFilteredList {
            page += 1
            loadPeople()
        }
    }
    
    func searchPeople(text: String) {
        showFilteredList = true
        dataProvider.searchPeople(text: text) { [weak self] people, requestError in
            DispatchQueue.main.async {
                if let people = people {
                    self?.filteredList = people.map({ $0.person })
                    self?.delegate?.didGetPeopleList()
                } else {
                    self?.delegate?.didGetError(description: requestError?.localizedDescription ?? "Error Loding Data")
                }
            }
        }
    }
}
