//
//  NetworkRequestManagerProtocol.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 15/05/22.
//

import Foundation

protocol NetworkRequestManagerProtocol {
    func loadData(fromUrlString urlString: String, completion: @escaping (Data?, Error?) -> Void)
}
