//
//  PeopleSearchViewControllerFactory.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 18/05/22.
//

import UIKit

class PeopleSearchViewControllerFactory {
    class func make(dataProvider: MazeTVDataProviderProtocol = MazeTVAPIProvider(networkManager: NetworkRequestManager())) -> PeopleSearchViewController {
        let viewModel = PeopleSearchViewModel(dataProvider: dataProvider)
        let viewController = PeopleSearchViewController(viewModel: viewModel)
        return viewController
    }
}
