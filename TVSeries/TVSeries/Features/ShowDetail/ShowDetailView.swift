//
//  ShowDetailView.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 16/05/22.
//

import UIKit

class ShowDetailView: UIView {
    
    var imageLoader = ImageLoader()
    var tableViewHeightConstraint: NSLayoutConstraint?

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    let showImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .center
        return image
    }()
    
    let showNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let genresLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let scheduleLabel: UILabel = {
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
    
    let episodesTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.isScrollEnabled = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 0
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        return tableView
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
        scrollView.addSubview(showImageView)
        scrollView.addSubview(showNameLabel)
        scrollView.addSubview(genresLabel)
        scrollView.addSubview(scheduleLabel)
        scrollView.addSubview(summaryLabel)
        scrollView.addSubview(episodesTableView)
    }
    
    private func setupConstraints() {
        tableViewHeightConstraint = episodesTableView.heightAnchor.constraint(equalToConstant: 0)
        tableViewHeightConstraint?.isActive = true
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

            showImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            showNameLabel.leadingAnchor.constraint(equalTo: showImageView.leadingAnchor),
            genresLabel.leadingAnchor.constraint(equalTo: showImageView.leadingAnchor),
            scheduleLabel.leadingAnchor.constraint(equalTo: showImageView.leadingAnchor),
            summaryLabel.leadingAnchor.constraint(equalTo: showImageView.leadingAnchor),
            episodesTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            
            showNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            genresLabel.trailingAnchor.constraint(equalTo: showNameLabel.trailingAnchor),
            scheduleLabel.trailingAnchor.constraint(equalTo: showNameLabel.trailingAnchor),
            summaryLabel.trailingAnchor.constraint(equalTo: showNameLabel.trailingAnchor),
            episodesTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            showImageView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            showNameLabel.topAnchor.constraint(equalTo: showImageView.bottomAnchor, constant: 16),
            genresLabel.topAnchor.constraint(equalTo: showNameLabel.bottomAnchor, constant: 10),
            scheduleLabel.topAnchor.constraint(equalTo: genresLabel.bottomAnchor, constant: 10),
            summaryLabel.topAnchor.constraint(equalTo: scheduleLabel.bottomAnchor, constant: 10),
            episodesTableView.topAnchor.constraint(equalTo: summaryLabel.bottomAnchor),
                        
            episodesTableView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
        ])
    }
    
    public func set(showDetail: TVShowDetail) {
        imageLoader.loadImageInto(imageView: showImageView, fromUrl: showDetail.image?.medium)
        showNameLabel.text = showDetail.name
        genresLabel.text = showDetail.genres.joined(separator: " | ")
        scheduleLabel.text = showDetail.schedule.scheduleDescription
        summaryLabel.setHtmlContent(htmlString: showDetail.summary)
    }
    
    public func updateHeightConstraint() {
        tableViewHeightConstraint?.constant = episodesTableView.contentSize.height
    }
}
