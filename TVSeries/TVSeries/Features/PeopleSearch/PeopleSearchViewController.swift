//
//  PeopleSearchViewController.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 18/05/22.
//

import UIKit

class PeopleSearchViewController: UIViewController {
    private let peopleSearchView = PeopleSearchView()
    private var viewModel: PeopleSearchViewModelProtocol
    
    init(viewModel: PeopleSearchViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = peopleSearchView
    }
        
    override func viewDidLoad() {
        title = "People"
        setupTableView()
        viewModel.delegate = self
        viewModel.loadPeople()
        peopleSearchView.searchBar.delegate = self
    }
    
    private func setupTableView() {
        peopleSearchView.peopleTableView.register(PersonTableViewCell.self, forCellReuseIdentifier: PersonTableViewCell.reusableIdentifier)
        peopleSearchView.peopleTableView.delegate = self
        peopleSearchView.peopleTableView.dataSource = self
    }
}

extension PeopleSearchViewController: PeopleSearchViewModelProtocolDelegate {
    func didGetError(description: String) {
        print(description)
    }
    
    func didGetPeopleList() {
        peopleSearchView.peopleTableView.reloadData()
    }
}

extension PeopleSearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.reusableIdentifier, for: indexPath) as? PersonTableViewCell {
            cell.set(person: viewModel.people[indexPath.row])
            return cell
        }
        return ShowListTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = viewModel.people[indexPath.row]
        let vc = PersonDetailViewControllerFactory.make(person: person)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.people.count - 1 {
            viewModel.loadMorePeople()
        }
    }
}

extension PeopleSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        peopleSearchView.searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String) {
        textSearched.isEmpty ? viewModel.loadPeople() : viewModel.searchPeople(text: textSearched)
    }
}
