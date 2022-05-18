//
//  PersonDetailViewController.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 18/05/22.
//

import UIKit

class PersonDetailViewController: UIViewController {
    private let personDetailView = PersonDetailView()
    private var viewModel: PersonDetailViewModelProtocol
    
    init(viewModel: PersonDetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = personDetailView
    }
    
    override func viewDidLoad() {
        title = "Person Info"
        viewModel.delegate = self
        viewModel.loadPersonDetail()
        personDetailView.set(person: viewModel.person)
        setupTableView()
    }

    private func setupTableView() {
        personDetailView.showsTableView.delegate = self
        personDetailView.showsTableView.dataSource = self
    }
}

extension PersonDetailViewController: PersonDetailViewModelDelegate {
    func didGetShowList() {
        DispatchQueue.main.async {
            self.personDetailView.showsTableView.reloadData()
            self.personDetailView.updateHeightConstraint()
        }
    }
    
    func didGetError(description: String) {}
}

extension PersonDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Series appearances: " + String(viewModel.showList.count)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.showList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.accessoryType = .disclosureIndicator
        var content = cell.defaultContentConfiguration()
        content.textProperties.numberOfLines = 0
        content.text = viewModel.showList[indexPath.row].name
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ShowDetailViewControllerFactory.make(showId: viewModel.showList[indexPath.row].id)
        navigationController?.pushViewController(vc, animated: true)
    }
}

