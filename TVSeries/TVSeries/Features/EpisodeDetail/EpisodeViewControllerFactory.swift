//
//  EpisodeViewControllerFactory.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 17/05/22.
//

class EpisodeViewControllerFactory {
    class func make(episode: TVShowEpisode) -> EpisodeViewController {
        let viewModel = EpisodeViewModel(episode: episode)
        let viewController = EpisodeViewController(viewModel: viewModel)
        return viewController
    }
}
