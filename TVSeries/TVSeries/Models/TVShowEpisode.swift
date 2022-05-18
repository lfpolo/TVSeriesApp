//
//  Episode.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 17/05/22.
//

struct TVShowEpisode: Decodable {
    var name: String
    var season: Int
    var number: Int
    var summary: String?
    var image: ImageURL?
}
