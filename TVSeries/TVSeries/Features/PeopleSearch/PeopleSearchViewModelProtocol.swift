//
//  PeopleSearchViewModelProtocol.swift
//  TVSeries
//
//  Created by GSLOCACAO on 18/05/22.
//

import Foundation

protocol PeopleSearchViewModelProtocol {
    var delegate: PeopleSearchViewModelProtocolDelegate? { get set }
    var people: [Person] { get }
    func loadPeople()
    func loadMorePeople()
    func searchPeople(text: String)
}
