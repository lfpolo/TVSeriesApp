//
//  FavoritesView.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 18/05/22.
//

import UIKit

class FavoritesView: UIView {
    let showsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
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
        addSubview(showsTableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            showsTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            showsTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            showsTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            showsTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
