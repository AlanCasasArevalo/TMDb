//
//  FeaturedAssembly.swift
//  APP Core
//
//  Created by Alan Casas on 02/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

final public class FeaturedAssembly {
    private let imageLoadingAssembly: ImageLoadingAssembly
    private let detailAssembly: DetailsAssembly
    private let searchAssembly: SearchAssembly
    private let webServiceAssembly: WebServiceAssembly

    init(imageLoadingAssembly: ImageLoadingAssembly, detailAssembly: DetailsAssembly, searchAssembly: SearchAssembly, webServiceAssembly: WebServiceAssembly) {
        self.imageLoadingAssembly = imageLoadingAssembly
        self.detailAssembly = detailAssembly
        self.searchAssembly = searchAssembly
        self.webServiceAssembly = webServiceAssembly
    }
    
    func cardPresenter() -> CardPresenter {
        return CardPresenter(imageRepositoryProtocol: imageLoadingAssembly.imageRepository, dateFormatter: DateFormatter())
    }
    
    func featuredPresenter() -> FeaturedPresenter {
        return FeaturedPresenter(detailNavigator: detailAssembly.detailNavigator(), featuredRepositoryProtocol: featuredRepositoryProtocol())
    }
    
    func featuredRepositoryProtocol() -> FeaturedRepositoryProtocol {
        return FeaturedRepository(webService: webServiceAssembly.webService)
    }
    
    public func viewController() -> UIViewController {
        return FeaturedViewController(featurePresenter: featuredPresenter(), cardPresenter: cardPresenter(), searchNavigatorProtocol: searchAssembly.searchNavigatorProtocol())
    }
}
