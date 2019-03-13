//
//  FeaturedAssembly.swift
//  APP Core
//
//  Created by Alan Casas on 02/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

public class FeaturedAssembly {
    public let imageLoadingAssembly: ImageLoadingAssembly
    public let detailAssembly: DetailsAssembly
    public let searchAssembly: SearchAssembly
    
    public init(imageLoadingAssembly: ImageLoadingAssembly, detailAssembly: DetailsAssembly, searchAssembly: SearchAssembly) {
        self.imageLoadingAssembly = imageLoadingAssembly
        self.detailAssembly = detailAssembly
        self.searchAssembly = searchAssembly
    }
    
    public func cardPresenter() -> CardPresenter {
        return CardPresenter(imageRepositoryProtocol: imageLoadingAssembly.imageRepository, dateFormatter: DateFormatter())
    }
    
    public func featuredPresenter() -> FeaturedPresenter {
        return FeaturedPresenter(detailNavigator: detailAssembly.detailNavigator())
    }
    
    public func viewController() -> UIViewController {
        return FeaturedViewController(featurePresenter: featuredPresenter(), cardPresenter: cardPresenter(), searchNavigatorProtocol: searchAssembly.searchNavigatorProtocol())
    }
}
