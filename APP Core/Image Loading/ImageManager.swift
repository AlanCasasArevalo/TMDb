//
//  ImageManager.swift
//  APP Core
//
//  Created by Alan Casas on 01/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import RxSwift
import Kingfisher

internal protocol ImageManagerProtocol {
    func imageFromURL(withURL url: URL) -> Observable<UIImage>
}

extension KingfisherManager: ImageManagerProtocol {
    func imageFromURL(withURL url: URL) -> Observable<UIImage> {
        return Observable.create { observer in
            let resource = ImageResource(downloadURL: url)

            let task = self.retrieveImage(with: resource,
                                          options: nil,
                                          progressBlock: nil) { image, error, _, _ in
                                            if let error = error {
                                                observer.onError(error)
                                            }else{
                                                observer.onNext(image ?? UIImage())
                                                observer.onCompleted()
                                            }
                                        }
            
            return Disposables.create{
                task.cancel()
            }
        }
        
    }
}




