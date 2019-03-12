//
//  CoreAssembly.swift
//  APP Core
//
//  Created by Alan Casas on 01/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

final public class CoreAssembly {
    public lazy var webServiceAssembly = WebServiceAssembly()
    public lazy var imageLoadingAssembly = ImageLoadingAssembly(webServiceAssembly: webServiceAssembly)
    public lazy var searchAssembly = SearchAssembly(imageLoadingAssembly: imageLoadingAssembly)
    public lazy var featureAssembly = FeaturedAssembly(imageLoadingAssembly: imageLoadingAssembly, detailAssembly: detailsAssembly)
    public lazy var detailsAssembly = DetailsAssembly(imageLoadingAssembly: imageLoadingAssembly, navigationController: navigationController)
    
    public let navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
