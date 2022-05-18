//
//  FavoritesViewController.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 18/05/22.
//

import UIKit

class FavoritesViewController: UIViewController {
    private let favoritesView = FavoritesView()
    private var viewModel: FavoritesViewModelProtocol
    
    init(viewModel: FavoritesViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = favoritesView
    }

    override func viewDidLoad() {
        title = "Favorites"
        setupTableView()
        viewModel.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.loadFavorites()
        favoritesView.showsTableView.reloadData()
    }
    
    private func setupTableView() {
        favoritesView.showsTableView.register(ShowListTableViewCell.self, forCellReuseIdentifier: ShowListTableViewCell.reusableIdentifier)
        favoritesView.showsTableView.delegate = self
        favoritesView.showsTableView.dataSource = self
    }
}

extension FavoritesViewController: FavoritesViewModelDelegate {
    
    func didGetError(description: String) {
        print(description)
    }
    
    func didGetShowList() {
        favoritesView.showsTableView.reloadData()
    }
}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.showList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ShowListTableViewCell.reusableIdentifier, for: indexPath) as? ShowListTableViewCell {
            cell.set(data: viewModel.showList[indexPath.row])
            return cell
        }
        return ShowListTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let show = viewModel.showList[indexPath.row]
        let vc = ShowDetailViewControllerFactory.make(showId: show.id)
        navigationController?.pushViewController(vc, animated: true)
    }
}
