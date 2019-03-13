//
//  PhoneSearchNavigator.swift
//  APP Core
//
//  Created by Alan Casas on 12/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

final class PhoneSearchNavigator: SearchNavigatorProtocol {

    private  unowned let viewControllerProvider: SearchResultsViewControllerProvider
    private var searchController: UISearchController!

    init(viewControllerProvider: SearchResultsViewControllerProvider) {
        self.viewControllerProvider = viewControllerProvider
    }

    func installSearch(viewController: UIViewController) {
        let resultsViewController = viewControllerProvider.searchResultsViewController()
        searchController = UISearchController(searchResultsController: resultsViewController)

        searchController.searchResultsUpdater = resultsViewController
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = NSLocalizedString(CONSTANTS.SEARCH_CONTROLLER_CONSTANTS.placeHolderTitle, comment: "")
        searchController.searchBar.searchBarStyle = .minimal

        viewController.navigationItem.titleView = searchController.searchBar
        viewController.definesPresentationContext = true
    }
}
