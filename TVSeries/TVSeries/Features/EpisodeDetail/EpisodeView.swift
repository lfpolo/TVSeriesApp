//
//  EpisodeView.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 17/05/22.
//

import UIKit

class EpisodeView: UIView {
    var imageLoader = ImageLoader()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    let episodeImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let episodeNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let episodeNumberLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let summaryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
        
    private func setupView() {
        self.buildViewHierarchy()
        self.setupConstraints()
        backgroundColor = .systemBackground
    }
    
    private func buildViewHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(episodeImageView)
        scrollView.addSubview(episodeNameLabel)
        scrollView.addSubview(episodeNumberLabel)
        scrollView.addSubview(summaryLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

            episodeImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            episodeNameLabel.leadingAnchor.constraint(equalTo: episodeImageView.leadingAnchor),
            episodeNumberLabel.leadingAnchor.constraint(equalTo: episodeImageView.leadingAnchor),
            summaryLabel.leadingAnchor.constraint(equalTo: episodeImageView.leadingAnchor),
            
            episodeNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            episodeNumberLabel.trailingAnchor.constraint(equalTo: episodeNameLabel.trailingAnchor),
            summaryLabel.trailingAnchor.constraint(equalTo: episodeNameLabel.trailingAnchor),

            episodeImageView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            episodeNumberLabel.topAnchor.constraint(equalTo: episodeImageView.bottomAnchor, constant: 12),
            episodeNameLabel.topAnchor.constraint(equalTo: episodeNumberLabel.bottomAnchor, constant: 12),
            summaryLabel.topAnchor.constraint(equalTo: episodeNameLabel.bottomAnchor, constant: 12),
                        
            summaryLabel.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
        ])
    }
    
    public func set(episode: TVShowEpisode) {
        imageLoader.loadImageInto(imageView: episodeImageView, fromUrl: episode.image?.medium)
        episodeNameLabel.text = episode.name
        episodeNumberLabel.text = "Season " + String(episode.season) + ", episode " +  String(episode.number)
        summaryLabel.setHtmlContent(htmlString: episode.summary ?? "We don't have a description for this episode :(")
    }
}
