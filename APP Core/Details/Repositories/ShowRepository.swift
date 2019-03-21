//
//  ShowRepository.swift
//  APP Core
//
//  Created by Alan Casas on 21/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import RxSwift

protocol ShowRepositoryProtocol {
    func showDetail ( identifier: Int64 ) -> Observable<ShowDetail>
}

final class ShowRepository : ShowRepositoryProtocol {
    private let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func showDetail (identifier: Int64) -> Observable<ShowDetail> {
        return webService.loadGenericFromApi(type: ShowDetail.self, endpoint: .showDetail(identifier: identifier))
    }
}

