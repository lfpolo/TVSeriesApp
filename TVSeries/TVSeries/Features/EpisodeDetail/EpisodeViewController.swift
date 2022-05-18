//
//  EpisodeViewController.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 17/05/22.
//

import UIKit

class EpisodeViewController: UIViewController {
    private let episodeView = EpisodeView()
    private var viewModel: EpisodeViewModelProtocol
    
    init(viewModel: EpisodeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = episodeView
        episodeView.set(episode: viewModel.episode)
    }
    
    override func viewDidLoad() {
        title = "Episode Info"
    }
}
