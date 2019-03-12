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
    
    public init(imageLoadingAssembly: ImageLoadingAssembly, detailAssembly: DetailsAssembly) {
        self.imageLoadingAssembly = imageLoadingAssembly
        self.detailAssembly = detailAssembly
    }
    
    public func cardPresenter() -> CardPresenter {
        return CardPresenter(imageRepositoryProtocol: imageLoadingAssembly.imageRepository, dateFormatter: DateFormatter())
    }
    
    public func featuredPresenter() -> FeaturedPresenter {
        return FeaturedPresenter(detailNavigator: detailAssembly.detailNavigator())
    }
    
    public func viewController() -> UIViewController {
        return FeaturedViewController(featurePresenter: featuredPresenter(), cardPresenter: cardPresenter())
    }
}
