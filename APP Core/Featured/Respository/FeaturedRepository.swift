//
//  FeaturedRepository.swift
//  APP Core
//
//  Created by Alan Casas on 02/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import RxSwift

public protocol FeaturedRepositoryProtocol {
    func movieNowPlaying(region: String) -> Observable<[Movie]>
    func showOnTheAir() -> Observable<[Show]>
}

public class FeaturedRepository: FeaturedRepositoryProtocol {
    
    public let webService: WebService
    
    public init (webService:WebService) {
        self.webService = webService
    }
    
    public func movieNowPlaying(region: String) -> Observable<[Movie]> {
        return webService.loadGenericFromApi(type: Page<Movie>.self, endpoint: .moviesNowPlaying(region: region, page: 1))
            .map {
                $0.results
            }
    }
    
    public func showOnTheAir() -> Observable<[Show]> {
        return webService.loadGenericFromApi(type: Page<Show>.self, endpoint: .showsOnTheAir(page: 1))
            .map {
                $0.results
            }
    }
}
