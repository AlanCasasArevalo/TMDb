//
//  PersonRepository.swift
//  APP Core
//
//  Created by Alan Casas on 21/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import RxSwift

protocol PersonRepositoryProtocol {
    func personDetail (identifier: Int64) -> Observable<PersonDetail>
}

final class PersonRepository: PersonRepositoryProtocol {
    
    private let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func personDetail(identifier: Int64) -> Observable<PersonDetail> {
        return webService.loadGenericFromApi(type: PersonDetail.self, endpoint: .personDetail(identifier: identifier))        
    }
}
