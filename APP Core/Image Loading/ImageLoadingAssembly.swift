//
//  ImageLoadingAssembly.swift
//  APP Core
//
//  Created by Alan Casas on 01/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Kingfisher

final class ImageLoadingAssembly {
    private (set) lazy var imageRepository: ImageRepositoryProtocol = ImageRepository(webService: webServiceAssembly.webService,
                                                                                     imageManager: KingfisherManager.shared)
    private let webServiceAssembly: WebServiceAssembly
    
    init(webServiceAssembly: WebServiceAssembly) {
        self.webServiceAssembly = webServiceAssembly
    }
}
