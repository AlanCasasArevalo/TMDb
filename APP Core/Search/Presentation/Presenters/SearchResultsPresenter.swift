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

    let movie = Movie(identifier: 80122,
                      title: "El Capitán Trueno y el Santo Grial",
                      posterPath: "8S0JkayAUgmTnR77qKpo3Ehxtxw.jpg",
                      backdropPath: "46jNSA5xNm3dEKUwPyargoI0GJG.jpg",
                      releaseDate: "2011-10-07T10:44:00+0000",
                      genreIdentifiers: [12])
    
    init (detailNavigator: DetailNavigatorProtocol){
        self.detailNavigator = detailNavigator
    }
    
    /// The search results
    lazy var searchResults: Observable<[SearchResult]> = Observable
        // TODO: implement
        .just([.movie(movie)])
    
    
    /// Called by the view when the user selects a search result
    func didSelect(searchResult: SearchResult) {
        // TODO: implement

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
