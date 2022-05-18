//
//  PersonDetailViewControllerFactory.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 18/05/22.
//

class PersonDetailViewControllerFactory {
    class func make(person: Person,
                    showsDataProvider: MazeTVDataProviderProtocol = MazeTVAPIProvider(networkManager: NetworkRequestManager())) -> PersonDetailViewController {
        let viewModel = PersonDetailViewModel(person: person, showsDataProvider: showsDataProvider)
        let viewController = PersonDetailViewController(viewModel: viewModel)
        return viewController
    }
}
