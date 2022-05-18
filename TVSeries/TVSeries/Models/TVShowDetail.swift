//
//  TVShowDetail.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 17/05/22.
//

struct TVShowDetail: TVShowProtocol, Decodable {
    var id: Int
    var name: String
    var genres: [String]
    var image: ImageURL?
    var summary: String
    var schedule: TVShowSchedule
}
