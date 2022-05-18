//
//  PersonDetailView.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 18/05/22.
//

import UIKit

class PersonDetailView: UIView {
    var imageLoader = ImageLoader()
    var tableViewHeightConstraint: NSLayoutConstraint?

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    let personImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .center
        return image
    }()
    
    let personNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let showsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
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
        scrollView.addSubview(personImageView)
        scrollView.addSubview(personNameLabel)
        scrollView.addSubview(showsTableView)
    }
    
    private func setupConstraints() {
        tableViewHeightConstraint = showsTableView.heightAnchor.constraint(equalToConstant: 0)
        tableViewHeightConstraint?.isActive = true
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

            personImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            personNameLabel.leadingAnchor.constraint(equalTo: personImageView.leadingAnchor),
            showsTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            
            personNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            showsTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            personImageView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            personNameLabel.topAnchor.constraint(equalTo: personImageView.bottomAnchor, constant: 16),
            showsTableView.topAnchor.constraint(equalTo: personNameLabel.bottomAnchor),
                        
            showsTableView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
        ])
    }
    
    public func set(person: Person) {
        imageLoader.loadImageInto(imageView: personImageView, fromUrl: person.image?.medium)
        personNameLabel.text = person.name
    }
    
    public func updateHeightConstraint() {
        tableViewHeightConstraint?.constant = showsTableView.contentSize.height
    }
}
