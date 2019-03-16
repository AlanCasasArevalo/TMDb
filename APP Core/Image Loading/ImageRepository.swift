//
//  ImageRepository.swift
//  APP Core
//
//  Created by Alan Casas on 01/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import RxSwift

protocol ImageRepositoryProtocol {
    func imageFromApi(path: String, size: ImageSize) -> Observable<UIImage>
}

final class ImageRepository: ImageRepositoryProtocol {
    
    var imageBaseURL: Observable<URL>
    let imageManager: ImageManagerProtocol
    
    init ( webService: WebService, imageManager: ImageManagerProtocol ) {
        self.imageBaseURL = webService.loadGenericFromApi(type: ImageConfiguration.self, endpoint: .configuration)
            .catchErrorJustReturn(.default)
            .map({ imageConfiguration in
                imageConfiguration.images.baseURL
            })
            .share(replay: 1)

        self.imageManager = imageManager
    }
    
    func imageFromApi(path: String, size: ImageSize) -> Observable<UIImage> {
        let imageManager = self.imageManager
        
        return imageBaseURL.map({ url  in
            url.appendingPathComponent(size.rawValue).appendingPathComponent(path)
        }).flatMap({ url in
            imageManager.imageFromURL(withURL: url)
        })

    }
}































