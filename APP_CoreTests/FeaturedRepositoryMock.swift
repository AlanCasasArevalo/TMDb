//
//  FeaturedRepositoryMock.swift
//  APP_CoreTests
//
//  Created by Alan Casas on 22/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

@testable import APP_Core
import RxSwift
import RxCocoa
import RxAtomic
import Kingfisher

final class FeaturedRepositoryMock: FeaturedRepositoryProtocol {
    private(set) var movieNowPlayingCalled = false
    private(set) var movieNowPlayingParameters: String?
    var movieNowPlayingResult = Observable<[Movie]>.just([])
    
    private(set) var showOnTheAirCalled = false
    var showOnTheAirResult = Observable<[Show]>.just([])

    func movieNowPlaying(region: String) -> Observable<[Movie]> {
        movieNowPlayingCalled = true
        movieNowPlayingParameters = region
        return movieNowPlayingResult
    }
    
    func showOnTheAir() -> Observable<[Show]> {
        showOnTheAirCalled = true
        return showOnTheAirResult
    }
}
