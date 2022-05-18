//
//  ShowDetailViewControllerFactory.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 17/05/22.
//

class ShowDetailViewControllerFactory {
    class func make(showId: Int,
                    showsDataProvider: MazeTVDataProviderProtocol = MazeTVAPIProvider(networkManager: NetworkRequestManager()),
                    favoritesDataProvider: FavoritesDataProviderProtocol = FavoritesCoreDataProvider()) -> ShowDetailViewController {
        let viewModel = ShowDetailViewModel(showId: showId,
                                            showsDataProvider: showsDataProvider,
                                            favoritesDataProvider: favoritesDataProvider)
        let viewController = ShowDetailViewController(viewModel: viewModel)
        return viewController
    }
}
