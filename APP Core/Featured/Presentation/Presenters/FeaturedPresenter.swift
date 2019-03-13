//
//  FeaturedPresenter.swift
//  APP Core
//
//  Created by Alan Casas on 02/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

public protocol FeaturedViewProtocol: class {
    var title: String? { get set }
    func setMoviesHeaderTitle(title: String)
    func setShowsHeaderTitle(title: String)
    
    func updateView(with movies: [Movie])
    func updateView(with shows: [Show])
}

public class FeaturedPresenter {
    weak var featureViewProtocol: FeaturedViewProtocol?
    private let detailNavigator: DetailNavigatorProtocol
    
    init(detailNavigator: DetailNavigatorProtocol) {
        self.detailNavigator = detailNavigator
    }
    
    func didLoad() {
        featureViewProtocol?.title = NSLocalizedString(CONSTANTS.FEATURED_VIEW_LITERAL.FeatureTitle, comment: "")
        featureViewProtocol?.setShowsHeaderTitle(title: NSLocalizedString(CONSTANTS.FEATURED_VIEW_LITERAL.FeatureShowHeader, comment: ""))
        featureViewProtocol?.setMoviesHeaderTitle(title: NSLocalizedString(CONSTANTS.FEATURED_VIEW_LITERAL.FeatureMovieHeader, comment: ""))
        
        addFakeContent()
    }
    
    func didSelect(show: Show) {
        detailNavigator.showDetail(identifier: show.identifier, mediaType: .show)
    }
    
    func didSelect(movie: Movie) {
        detailNavigator.showDetail(identifier: movie.identifier, mediaType: .movie)
    }
}

extension FeaturedPresenter {
    func addFakeContent() {
        let shows = [
            Show(identifier: 1413,
                 title: "American Horror Story",
                 posterPath: "/gwSzP1cJL2HsBmGStN2vOg3d4Qd.jpg",
                 backdropPath: "/anDMMvgVV6pTNSxhHgiDPUjc4pH.jpg",
                 firstAirDate: Date(timeIntervalSince1970: 1274905532),
                 genreIdentifiers: [18, 9648]),
            Show(identifier: 1413,
                 title: "American Horror Story",
                 posterPath: "/gwSzP1cJL2HsBmGStN2vOg3d4Qd.jpg",
                 backdropPath: "/anDMMvgVV6pTNSxhHgiDPUjc4pH.jpg",
                 firstAirDate: Date(timeIntervalSince1970: 1274905532),
                 genreIdentifiers: [18, 9648]),
        ]
        
        featureViewProtocol?.updateView(with: shows)
        
        let movies = [
            Movie(identifier: 330459,
                  title: "Rogue One: A Star Wars Story",
                  posterPath: "/qjiskwlV1qQzRCjpV0cL9pEMF9a.jpg",
                  backdropPath: "/tZjVVIYXACV4IIIhXeIM59ytqwS.jpg",
                  releaseDate: Date(timeIntervalSince1970: 1474905532),
                  genreIdentifiers: [28, 12, 878]),
            Movie(identifier: 297762,
                  title: "Wonder Woman",
                  posterPath: "/gfJGlDaHuWimErCr5Ql0I8x9QSy.jpg",
                  backdropPath: "/hA5oCgvgCxj5MEWcLpjXXTwEANF.jpg",
                  releaseDate: Date(timeIntervalSince1970: 1574905532),
                  genreIdentifiers: [28, 12, 14, 878]),
            Movie(identifier: 324852,
                  title: "Despicable Me 3",
                  posterPath: "/5qcUGqWoWhEsoQwNUrtf3y3fcWn.jpg",
                  backdropPath: "/7YoKt3hzTg38iPlpCumqcriaNTV.jpg",
                  releaseDate: Date(timeIntervalSince1970: 1564905532),
                  genreIdentifiers: [12, 16, 35]),
            Movie(identifier: 80122,
                  title: "El Capitán Trueno y el Santo Grial",
                  posterPath: "8S0JkayAUgmTnR77qKpo3Ehxtxw.jpg",
                  backdropPath: "46jNSA5xNm3dEKUwPyargoI0GJG.jpg",
                  releaseDate: DateFormatter().date(from: "2011-10-07T10:44:00+0000"),
                  genreIdentifiers: [12])
            ]
        
        featureViewProtocol?.updateView(with: movies)
    }
}


























