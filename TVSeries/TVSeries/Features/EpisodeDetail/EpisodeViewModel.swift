//
//  EpisodeViewModel.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 17/05/22.
//

class EpisodeViewModel: EpisodeViewModelProtocol {
    var episode: TVShowEpisode
    
    init(episode: TVShowEpisode) {
        self.episode = episode
    }
}
