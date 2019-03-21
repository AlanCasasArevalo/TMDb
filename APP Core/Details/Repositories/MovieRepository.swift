//
//  MovieRepository.swift
//  APP Core
//
//  Created by Alan Casas on 03/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import RxSwift

protocol MovieRepositoryProtocol {
    func movieDetail(identifier: Int64) -> Observable<MovieDetail>
}

final class MovieRepository : MovieRepositoryProtocol {
    
    private let webService: WebService
    
    init( webService: WebService) {
        self.webService = webService
    }
    
    func movieDetail(identifier: Int64) -> Observable<MovieDetail> {
        return webService.loadGenericFromApi(type: MovieDetail.self, endpoint: .movieDetail(identifier: identifier))
    }
}





