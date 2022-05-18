//
//  PersonDetailViewModelProtocol.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 18/05/22.
//

protocol PersonDetailViewModelProtocol {
    var delegate: PersonDetailViewModelDelegate? { get set }
    var person: Person { get }
    var showList: [TVShow] { get }
    func loadPersonDetail()
}
