//
//  CoreAssembly.swift
//  APP Core
//
//  Created by Alan Casas on 01/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

final public class CoreAssembly {
    private(set) lazy var webServiceAssembly = WebServiceAssembly()
    private(set) lazy var imageLoadingAssembly = ImageLoadingAssembly(webServiceAssembly: webServiceAssembly)
    private(set) lazy var searchAssembly = SearchAssembly(imageLoadingAssembly: imageLoadingAssembly, detailAssembly: detailsAssembly)
    public private(set) lazy var featureAssembly = FeaturedAssembly(imageLoadingAssembly: imageLoadingAssembly, detailAssembly: detailsAssembly, searchAssembly: searchAssembly, webServiceAssembly: webServiceAssembly)
    private(set) lazy var detailsAssembly = DetailsAssembly(imageLoadingAssembly: imageLoadingAssembly, navigationController: navigationController)
    
    private let navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
