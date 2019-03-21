//
//  DetailAssembly.swift
//  APP Core
//
//  Created by Alan Casas on 04/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

final class DetailsAssembly {
    private let imageLoadingAssembly: ImageLoadingAssembly
    private let navigationController: UINavigationController
    private let webServiceAssembly: WebServiceAssembly
    
    init (imageLoadingAssembly: ImageLoadingAssembly, navigationController: UINavigationController, webServiceAssembly: WebServiceAssembly) {
        self.imageLoadingAssembly = imageLoadingAssembly
        self.navigationController = navigationController
        self.webServiceAssembly = webServiceAssembly
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
    
    func moviePresenter( identifier: Int64 ) -> DetailPresenterProtocol {
        return MovieDetailPresenter(movieRepositoryProtocol: movieRepository(), dateFormatter: webServiceAssembly.dateFormatter, identifier: identifier)
    }
    
    func movieRepository() -> MovieRepositoryProtocol {
        return MovieRepository(webService: webServiceAssembly.webService)
    }
    
    func showPresenter(identifier: Int64) -> DetailPresenterProtocol {
        return ShowDetailPresenter(showRepositoryProtocol: showRepository(), dateFormatter: webServiceAssembly.dateFormatter, identifier: identifier)
    }
    
    func showRepository () -> ShowRepositoryProtocol {
        return ShowRepository(webService: webServiceAssembly.webService)
    }
    
    func personPresenter (identifier: Int64) -> DetailPresenterProtocol {
        return PersonDetailPresenter(personRepositoryProtocol: personRepository(), dateFormatter: webServiceAssembly.dateFormatter, identifier: identifier)
    }
    
    func personRepository () -> PersonRepositoryProtocol {
        return PersonRepository(webService: webServiceAssembly.webService)
    }
    
}

extension DetailsAssembly : DetailViewControllerProviderProtocol{
    func detailViewController(identifier: Int64, mediaType: MediaType) -> UIViewController {
        let presenter: DetailPresenterProtocol
        switch mediaType {
        case .movie:
            presenter = moviePresenter(identifier: identifier)
            break
        case .show:
            presenter = showPresenter(identifier: identifier)
            break
        case .person:
            presenter = personPresenter(identifier: identifier)
        }
        return DetailViewController(detailPresenter: presenter, detailHeaderPresenter: detailHeaderPresenter(), posterStripPresenter: posterStripPresenter())
    }
}
