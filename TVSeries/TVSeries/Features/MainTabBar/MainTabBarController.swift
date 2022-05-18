//
//  MainTabBarController.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 18/05/22.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        viewControllers = [
            createNavigationController(viewController: ShowListViewControllerFactory.make(),
                                       title: "Series",
                                       image: UIImage(systemName: "sparkles.tv")),
            createNavigationController(viewController: FavoritesViewControllerFactory.make(),
                                       title: "Favorites",
                                       image: UIImage(systemName: "star.fill")),
            createNavigationController(viewController: PeopleSearchViewControllerFactory.make(),
                                       title: "People",
                                       image: UIImage(systemName: "person.fill"))]
    }
    
    private func createNavigationController(viewController: UIViewController,
                                            title: String,
                                            image: UIImage?) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }
}
