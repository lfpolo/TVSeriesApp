//
//  ShowListViewModelDelegate.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 16/05/22.
//

protocol ShowListViewModelDelegate: AnyObject {
    func didGetShowList()
    func didGetError(description: String)
}
