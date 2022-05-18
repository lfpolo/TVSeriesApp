//
//  PersonDetailViewModel.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 18/05/22.
//

import Foundation

class PersonDetailViewModel: PersonDetailViewModelProtocol {
    weak var delegate: PersonDetailViewModelDelegate?
    var showList: [TVShow] = []
    var person: Person
    private var showsDataProvider: MazeTVDataProviderProtocol

    init(person: Person, showsDataProvider: MazeTVDataProviderProtocol) {
        self.person = person
        self.showsDataProvider = showsDataProvider
    }
    
    func loadPersonDetail() {
        showsDataProvider.loadPersonCastCredits(personId: person.id) { [weak self] castCreditList, requestError in
            if let castCreditList = castCreditList {
                self?.showList = castCreditList.map({ $0._embedded.show })
                self?.delegate?.didGetShowList()
            } else {
                self?.delegate?.didGetError(description: requestError?.localizedDescription ?? "Error Loding Data")
            }
        }
    }
}
