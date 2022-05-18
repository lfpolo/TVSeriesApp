//
//  PersonTableViewCell.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 18/05/22.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    static let reusableIdentifier = "PersonTableViewCellIdentifier"
    
    var imageLoader = ImageLoader()
    let placeholder = UIImage(systemName: "person")?.withTintColor(.lightGray)
    
    let personImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let personNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        buildViewHierarchy()
        setupConstraints()
        accessoryType = .disclosureIndicator
    }
    
    private func buildViewHierarchy() {
        addSubview(personImageView)
        addSubview(personNameLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            personImageView.heightAnchor.constraint(equalToConstant: 64),
            personImageView.widthAnchor.constraint(equalToConstant: 50),
            personImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            personImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            //personNameLabel.topAnchor.constraint(equalTo: personImageView.topAnchor),
            personNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            personNameLabel.leadingAnchor.constraint(equalTo: personImageView.trailingAnchor, constant: 16),
            personNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            
            bottomAnchor.constraint(greaterThanOrEqualTo: personImageView.bottomAnchor, constant: 8),
            bottomAnchor.constraint(greaterThanOrEqualTo: personNameLabel.bottomAnchor, constant: 8)
        ])
    }
    
    public func set(person: Person) {
        imageLoader.loadImageInto(imageView: personImageView, fromUrl: person.image?.medium, withPlaceholder: placeholder)
        personNameLabel.text = person.name
    }
}
