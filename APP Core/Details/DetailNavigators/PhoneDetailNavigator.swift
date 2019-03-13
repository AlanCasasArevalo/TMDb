//
//  PhoneDetailNavigator.swift
//  APP Core
//
//  Created by Alan Casas on 11/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit

final class PhoneDetailNavigator: DetailNavigatorProtocol {
    
    private let navigationController: UINavigationController
    private weak var viewControllerProvider: DetailViewControllerProviderProtocol?
    
    init(navigationController: UINavigationController, viewControllerProvider: DetailViewControllerProviderProtocol?) {
        self.navigationController = navigationController
        self.viewControllerProvider = viewControllerProvider
    }
    
    func showDetail(identifier: Int64, mediaType: MediaType) {
        let viewController = viewControllerProvider?.detailViewController(identifier: identifier, mediaType: mediaType)
        navigationController.pushViewController(viewController!, animated: true)
    }    
}
