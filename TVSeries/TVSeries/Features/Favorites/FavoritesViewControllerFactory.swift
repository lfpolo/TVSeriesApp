//
//  FavoritesViewControllerFactory.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 18/05/22.
//

class FavoritesViewControllerFactory {
    class func make(showsDataProvider: MazeTVDataProviderProtocol = MazeTVAPIProvider(networkManager: NetworkRequestManager()),
                    favoritesDataProvider: FavoritesDataProviderProtocol = FavoritesCoreDataProvider()) -> FavoritesViewController {
        let viewModel = FavoritesViewModel(showsDataProvider: showsDataProvider, favoritesDataProvider: favoritesDataProvider)
        let viewController = FavoritesViewController(viewModel: viewModel)
        return viewController
    }
}
