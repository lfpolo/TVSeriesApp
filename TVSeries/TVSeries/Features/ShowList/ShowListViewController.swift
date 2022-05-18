//
//  ShowListViewController.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 15/05/22.
//

import UIKit

class ShowListViewController: UIViewController {
    private let showListView = ShowListView()
    private var viewModel: ShowListViewModelProtocol
    
    init(viewModel: ShowListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = showListView
    }
        
    override func viewDidLoad() {
        title = "Series"
        setupTableView()
        viewModel.delegate = self
        viewModel.loadShowList()
        showListView.searchBar.delegate = self
    }
    
    private func setupTableView() {
        showListView.showsTableView.register(ShowListTableViewCell.self, forCellReuseIdentifier: ShowListTableViewCell.reusableIdentifier)
        showListView.showsTableView.delegate = self
        showListView.showsTableView.dataSource = self
    }
}

extension ShowListViewController: ShowListViewModelDelegate {
    func didGetError(description: String) {
        print(description)
    }
    
    func didGetShowList() {
        self.showListView.showsTableView.reloadData()
    }
}

extension ShowListViewController: UITableViewDelegate, UITableViewDataSource {
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.showList.count - 1 {
            viewModel.loadMoreShows()
        }
    }
}

extension ShowListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        showListView.searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String) {
        textSearched.isEmpty ? viewModel.loadShowList() : viewModel.searchShows(text: textSearched)
    }
}
