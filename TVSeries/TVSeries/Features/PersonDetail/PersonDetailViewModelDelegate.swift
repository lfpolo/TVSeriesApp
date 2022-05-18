//
//  PersonDetailViewModelDelegate.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 18/05/22.
//

import Foundation

protocol PersonDetailViewModelDelegate: AnyObject {
    func didGetShowList()
    func didGetError(description: String)
}
