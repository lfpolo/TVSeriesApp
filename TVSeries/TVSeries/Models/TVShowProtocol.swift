//
//  TVShowProtocol.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 18/05/22.
//

protocol TVShowProtocol {
    var name: String { get }
    var image: ImageURL? { get }
    var genres: [String] { get }
}
