//
//  DetailAssembly.swift
//  APP Core
//
//  Created by Alan Casas on 04/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

final class DetailsAssembly {
    let imageLoadingAssembly: ImageLoadingAssembly
    let navigationController: UINavigationController
    
    init (imageLoadingAssembly: ImageLoadingAssembly, navigationController: UINavigationController) {
        self.imageLoadingAssembly = imageLoadingAssembly
        self.navigationController = navigationController
    }

    func detailHeaderPresenter () -> DetailHeaderPresenter {
        return DetailHeaderPresenter(imageRepositoryProtocol: imageLoadingAssembly.imageRepository)
    }
    
    func posterStripPresenter() -> PosterStripPresenter {
        return PosterStripPresenter(imageRepositoryProtocol: imageLoadingAssembly.imageRepository)
    }

    func detailNavigator() -> DetailNavigatorProtocol {
        return PhoneDetailNavigator(navigationController: navigationController, viewControllerProvider: self)
    }
    
}

extension DetailsAssembly : DetailViewControllerProviderProtocol{
    
    // FIXME: Temporary we should change this for real DetailPresenter
    class DummyDetailPresenter: DetailPresenterProtocol {
        var view: DetailViewProtocol?
        func didLoad() {}
        func didSelect(item: PosterStripItem) {}
    }
    
    func detailViewController(identifier: Int64, mediaType: MediaType) -> UIViewController {
        return DetailViewController(detailPresenter: DummyDetailPresenter(), detailHeaderPresenter: detailHeaderPresenter(), posterStripPresenter: posterStripPresenter())
    }
}
