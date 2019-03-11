//
//  DetailAssembly.swift
//  APP Core
//
//  Created by Alan Casas on 04/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

final public class DetailsAssembly {
    public let imageLoadingAssembly: ImageLoadingAssembly

    public init (imageLoadingAssembly: ImageLoadingAssembly) {
        self.imageLoadingAssembly = imageLoadingAssembly
    }

    func detailHeaderPresenter () -> DetailHeaderPresenter {
        return DetailHeaderPresenter(imageRepositoryProtocol: imageLoadingAssembly.imageRepository)
    }
    
    public func posterStripPresenter() -> PosterStripPresenter {
        return PosterStripPresenter(imageRepositoryProtocol: imageLoadingAssembly.imageRepository)
    }

}