//
//  ShowListViewControllerFactory.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 17/05/22.
//

import UIKit

class ShowListViewControllerFactory {
    class func make(dataProvider: MazeTVDataProviderProtocol = MazeTVAPIProvider(networkManager: NetworkRequestManager())) -> ShowListViewController {
        let viewModel = ShowListViewModel(dataProvider: dataProvider)
        let viewController = ShowListViewController(viewModel: viewModel)
        return viewController
    }
}
