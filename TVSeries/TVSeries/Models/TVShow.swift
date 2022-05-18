//
//  TVShow.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 17/05/22.
//

struct TVShow: TVShowProtocol, Decodable {
    var id: Int
    var name: String
    var image: ImageURL?
    var genres: [String]
}
