//
//  PeopleSearchView.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 18/05/22.
//

import UIKit

class PeopleSearchView: UIView {
    
    let peopleTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.returnKeyType = .done
        searchBar.enablesReturnKeyAutomatically = false
        searchBar.placeholder = "Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        return searchBar
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
        addSubview(peopleTableView)
        peopleTableView.tableHeaderView = searchBar
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            peopleTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            peopleTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            peopleTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            peopleTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
