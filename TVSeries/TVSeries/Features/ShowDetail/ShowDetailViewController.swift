//
//  ShowDetailViewController.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 15/05/22.
//

import UIKit

class ShowDetailViewController: UIViewController {
    private let showDetailView = ShowDetailView()
    private var viewModel: ShowDetailViewModelProtocol
    
    init(viewModel: ShowDetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = showDetailView
    }
    
    override func viewDidLoad() {
        title = "Series Info"
        viewModel.delegate = self
        viewModel.loadShowDetail()
        viewModel.loadEpisodes()
        setupTableView()
        updateFavoriteButton()
    }

    private func setupTableView() {
        showDetailView.episodesTableView.delegate = self
        showDetailView.episodesTableView.dataSource = self
    }
    
    private func updateFavoriteButton() {
        let image = viewModel.isFavorite ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        let barButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(didTapFavorite))
        navigationItem.rightBarButtonItem = barButton
    }
    
    @objc private func didTapFavorite() {
        viewModel.selectFavorite()
        updateFavoriteButton()
    }
}

extension ShowDetailViewController: ShowDetailViewModelDelegate {
    func didGetEpisodes() {
        DispatchQueue.main.async {
            self.showDetailView.episodesTableView.reloadData()
            self.showDetailView.updateHeightConstraint()
        }
    }
    
    func didGetShowDetailedInfo() {
        if let showDetail = viewModel.showDetail {
            DispatchQueue.main.async {
                self.showDetailView.set(showDetail: showDetail)
            }
        }
    }
    
    func didGetError(description: String) {
        
    }
}

extension ShowDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Season " + String(viewModel.seasonList[section])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.seasonList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.episodesDict[viewModel.seasonList[section]]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let seasonNumber = viewModel.seasonList[indexPath.section]
        guard let episode = viewModel.episodesDict[seasonNumber]?[indexPath.row] else {
            return cell
        }
        cell.accessoryType = .disclosureIndicator
        var content = cell.defaultContentConfiguration()
        content.textProperties.numberOfLines = 0
        content.text = String(episode.number) + " - " + episode.name
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let episode = viewModel.episodesDict[viewModel.seasonList[indexPath.section]]?[indexPath.row] else {
            return
        }
        let vc = EpisodeViewControllerFactory.make(episode: episode)
        navigationController?.pushViewController(vc, animated: true)
    }
}
