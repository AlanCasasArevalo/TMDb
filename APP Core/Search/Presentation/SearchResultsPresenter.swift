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
final public class SearchResultsPresenter {
    
    /// The search query
    public let query = Variable("")
    
    public let movie = Movie(identifier: 80122,
                      title: "El Capitán Trueno y el Santo Grial",
                      posterPath: "8S0JkayAUgmTnR77qKpo3Ehxtxw.jpg",
                      backdropPath: "46jNSA5xNm3dEKUwPyargoI0GJG.jpg",
                      releaseDate: DateFormatter().date(from: "2011-10-07T10:44:00+0000"),
                      genreIdentifiers: [12])
    
    /// The search results
    public lazy var searchResults: Observable<[SearchResult]> = Observable
        // TODO: implement
        .just([.movie(movie)])
    
    
    /// Called by the view when the user selects a search result
    public func didSelect(searchResult: SearchResult) {
        // TODO: implement
    }
}
