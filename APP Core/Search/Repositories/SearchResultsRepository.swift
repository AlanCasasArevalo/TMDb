//
//  SearchResultsRepository.swift
//  APP Core
//
//  Created by Alan Casas on 19/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import RxSwift

protocol SearchResultsRepositoryProtocol {
    func searchResults(query: String, page: Int, includeAdult: Bool) -> Observable<[SearchResult]>
}

final class SearchResultsRepository : SearchResultsRepositoryProtocol {
    private let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func searchResults(query: String, page: Int, includeAdult: Bool) -> Observable<[SearchResult]> {
        return webService.loadGenericFromApi(type: Page<SearchResult>.self, endpoint: .searchResults(query: query, page: page, includeAdult: includeAdult))
            .map { results  in
                results.results
            }
    }
}




