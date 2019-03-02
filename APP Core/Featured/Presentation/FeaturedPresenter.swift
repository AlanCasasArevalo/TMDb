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
    
    func didLoad() {
        featureViewProtocol?.setShowsHeaderTitle(title: NSLocalizedString("ON TV", comment: ""))
        featureViewProtocol?.setMoviesHeaderTitle(title: NSLocalizedString("IN THEATERS", comment: ""))
        
        addFakeContent()
    }
    
    func didSelect(show: Show) {
        // TODO: implement
    }
    
    func didSelect(movie: Movie) {
        // TODO: implement
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
                 genreIdentifiers: [18, 9648])
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
            Movie(identifier: 324852,
                  title: "Despicable Me 3",
                  posterPath: "/5qcUGqWoWhEsoQwNUrtf3y3fcWn.jpg",
                  backdropPath: "/7YoKt3hzTg38iPlpCumqcriaNTV.jpg",
                  releaseDate: Date(timeIntervalSince1970: 1564905532),
                  genreIdentifiers: [12, 16, 35]),
            Movie(identifier: 324852,
                  title: "Despicable Me 3",
                  posterPath: "/5qcUGqWoWhEsoQwNUrtf3y3fcWn.jpg",
                  backdropPath: "/7YoKt3hzTg38iPlpCumqcriaNTV.jpg",
                  releaseDate: Date(timeIntervalSince1970: 1564905532),
                  genreIdentifiers: [12, 16, 35]),
            Movie(identifier: 324852,
                  title: "Despicable Me 3",
                  posterPath: "/5qcUGqWoWhEsoQwNUrtf3y3fcWn.jpg",
                  backdropPath: "/7YoKt3hzTg38iPlpCumqcriaNTV.jpg",
                  releaseDate: Date(timeIntervalSince1970: 1564905532),
                  genreIdentifiers: [12, 16, 35]),
            Movie(identifier: 324852,
                  title: "Despicable Me 3",
                  posterPath: "/5qcUGqWoWhEsoQwNUrtf3y3fcWn.jpg",
                  backdropPath: "/7YoKt3hzTg38iPlpCumqcriaNTV.jpg",
                  releaseDate: Date(timeIntervalSince1970: 1564905532),
                  genreIdentifiers: [12, 16, 35]),
            Movie(identifier: 324852,
                  title: "Despicable Me 3",
                  posterPath: "/5qcUGqWoWhEsoQwNUrtf3y3fcWn.jpg",
                  backdropPath: "/7YoKt3hzTg38iPlpCumqcriaNTV.jpg",
                  releaseDate: Date(timeIntervalSince1970: 1564905532),
                  genreIdentifiers: [12, 16, 35]),
            Movie(identifier: 324852,
                  title: "Despicable Me 3",
                  posterPath: "/5qcUGqWoWhEsoQwNUrtf3y3fcWn.jpg",
                  backdropPath: "/7YoKt3hzTg38iPlpCumqcriaNTV.jpg",
                  releaseDate: Date(timeIntervalSince1970: 1564905532),
                  genreIdentifiers: [12, 16, 35]),
            Movie(identifier: 324852,
                  title: "Despicable Me 3",
                  posterPath: "/5qcUGqWoWhEsoQwNUrtf3y3fcWn.jpg",
                  backdropPath: "/7YoKt3hzTg38iPlpCumqcriaNTV.jpg",
                  releaseDate: Date(timeIntervalSince1970: 1564905532),
                  genreIdentifiers: [12, 16, 35]),
            Movie(identifier: 324852,
                  title: "Despicable Me 3",
                  posterPath: "/5qcUGqWoWhEsoQwNUrtf3y3fcWn.jpg",
                  backdropPath: "/7YoKt3hzTg38iPlpCumqcriaNTV.jpg",
                  releaseDate: Date(timeIntervalSince1970: 1564905532),
                  genreIdentifiers: [12, 16, 35]),
            Movie(identifier: 324852,
                  title: "Despicable Me 3",
                  posterPath: "/5qcUGqWoWhEsoQwNUrtf3y3fcWn.jpg",
                  backdropPath: "/7YoKt3hzTg38iPlpCumqcriaNTV.jpg",
                  releaseDate: Date(timeIntervalSince1970: 1564905532),
                  genreIdentifiers: [12, 16, 35]),
            Movie(identifier: 324852,
                  title: "Despicable Me 3",
                  posterPath: "/5qcUGqWoWhEsoQwNUrtf3y3fcWn.jpg",
                  backdropPath: "/7YoKt3hzTg38iPlpCumqcriaNTV.jpg",
                  releaseDate: Date(timeIntervalSince1970: 1564905532),
                  genreIdentifiers: [12, 16, 35]),
            Movie(identifier: 324852,
                  title: "Despicable Me 3",
                  posterPath: "/5qcUGqWoWhEsoQwNUrtf3y3fcWn.jpg",
                  backdropPath: "/7YoKt3hzTg38iPlpCumqcriaNTV.jpg",
                  releaseDate: Date(timeIntervalSince1970: 1564905532),
                  genreIdentifiers: [12, 16, 35]),
            ]
        
        featureViewProtocol?.updateView(with: movies)
    }
}


























