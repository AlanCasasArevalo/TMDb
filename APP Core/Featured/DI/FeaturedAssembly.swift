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
    
    public init(imageLoadingAssembly: ImageLoadingAssembly) {
        self.imageLoadingAssembly = imageLoadingAssembly
    }
    
    public func cardPresenter() -> CardPresenter {
        return CardPresenter(imageRepositoryProtocol: imageLoadingAssembly.imageRepository, dateFormatter: DateFormatter())
    }
    
    public func featuredPresenter() -> FeaturedPresenter {
        return FeaturedPresenter()
    }
    
    public func viewController() -> UIViewController {
        return FeaturedViewController(featurePresenter: featuredPresenter(), cardPresenter: cardPresenter())
    }
}
