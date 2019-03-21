//
//  SearchResultsPresenter.swift
//  APP Core
//
//  Created by Alan Casas on 02/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation
import RxSwift

/// Presents search results
final class SearchResultsPresenter {
    
    /// The search query
    let query = Variable("")

    let detailNavigator: DetailNavigatorProtocol
    private let searchResultsRepositoryProtocol: SearchResultsRepositoryProtocol
    
    init (detailNavigator: DetailNavigatorProtocol, searchResultsRepositoryProtocol: SearchResultsRepositoryProtocol){
        self.detailNavigator = detailNavigator
        self.searchResultsRepositoryProtocol = searchResultsRepositoryProtocol
    }
    
    /// The search results
    lazy var searchResults: Observable<[SearchResult]> = query.asObservable()
        .distinctUntilChanged()
        .debounce(0.4, scheduler: MainScheduler.instance)
        .flatMapLatest { [weak self] query -> Observable<[SearchResult]> in
            guard let `self` = self,
                query.count >= 2 else {
                    return Observable.just([])
                }
            
            return self.searchResultsRepositoryProtocol.searchResults(query: query, page: 1, includeAdult: false)
            
        }
        .share()
        .observeOn(MainScheduler.instance)
    
    
    /// Called by the view when the user selects a search result
    func didSelect(searchResult: SearchResult) {
        switch searchResult {
        case .movie(let movie):
            detailNavigator.showDetail(identifier: movie.identifier, mediaType: .movie)
        case .show(let show):
            detailNavigator.showDetail(identifier: show.identifier, mediaType: .show)
        case .person(let person):
            detailNavigator.showDetail(identifier: person.identifier, mediaType: .person)
        }
        
    }
}
