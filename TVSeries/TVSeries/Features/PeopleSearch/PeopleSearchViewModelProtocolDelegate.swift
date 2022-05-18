//
//  PeopleSearchViewModelProtocolDelegate.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 18/05/22.
//

protocol PeopleSearchViewModelProtocolDelegate: AnyObject {
    func didGetPeopleList()
    func didGetError(description: String)
}
