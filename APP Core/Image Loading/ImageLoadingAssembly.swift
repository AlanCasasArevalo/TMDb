//
//  ImageLoadingAssembly.swift
//  APP Core
//
//  Created by Alan Casas on 01/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Kingfisher

final public class ImageLoadingAssembly {
    public lazy var imageRepository: ImageRepositoryProtocol = ImageRepository(webService: webServiceAssembly.webService,
                                                                                     imageManager: KingfisherManager.shared)
    public  let webServiceAssembly: WebServiceAssembly
    
    public init(webServiceAssembly: WebServiceAssembly) {
        self.webServiceAssembly = webServiceAssembly
    }
}
