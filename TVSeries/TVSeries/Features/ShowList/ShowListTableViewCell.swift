//
//  ShowListTableViewCell.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 15/05/22.
//

import UIKit

class ShowListTableViewCell: UITableViewCell {
    static let reusableIdentifier = "ShowListTableViewCellIdentifier"
    
    var imageLoader = ImageLoader()
    let placeholder = UIImage(systemName: "tv")?.withTintColor(.lightGray)
    
    let showImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        addSubview(showImageView)
        addSubview(showNameLabel)
        addSubview(genresLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            showImageView.heightAnchor.constraint(equalToConstant: 96),
            showImageView.widthAnchor.constraint(equalToConstant: 70),
            showImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            showImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            showNameLabel.topAnchor.constraint(equalTo: showImageView.topAnchor),
            showNameLabel.leadingAnchor.constraint(equalTo: showImageView.trailingAnchor, constant: 16),
            showNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            genresLabel.topAnchor.constraint(equalTo: showNameLabel.bottomAnchor, constant: 8),
            genresLabel.leadingAnchor.constraint(equalTo: showNameLabel.leadingAnchor),
            genresLabel.trailingAnchor.constraint(equalTo: showNameLabel.trailingAnchor),
            
            bottomAnchor.constraint(greaterThanOrEqualTo: showImageView.bottomAnchor, constant: 8),
            bottomAnchor.constraint(greaterThanOrEqualTo: genresLabel.bottomAnchor, constant: 8)
        ])
    }
    
    public func set(data: TVShowProtocol) {
        imageLoader.loadImageInto(imageView: showImageView, fromUrl: data.image?.medium, withPlaceholder: placeholder)
        showNameLabel.text = data.name
        genresLabel.text = data.genres.joined(separator: " | ")
    }
}
