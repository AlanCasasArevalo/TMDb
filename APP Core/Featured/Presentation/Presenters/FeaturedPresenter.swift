//
//  FeaturedPresenter.swift
//  APP Core
//
//  Created by Alan Casas on 02/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import RxSwift

protocol FeaturedViewProtocol: class {
    var title: String? { get set }
    func setMoviesHeaderTitle(title: String)
    func setShowsHeaderTitle(title: String)
    func setLoading(loading: Bool)
    
    func updateView(with movies: [Movie])
    func updateView(with shows: [Show])
}

class FeaturedPresenter {
    weak var featureViewProtocol: FeaturedViewProtocol?
    private let detailNavigator: DetailNavigatorProtocol
    private let featuredRepositoryProtocol : FeaturedRepositoryProtocol
    private let disposeBag = DisposeBag()
    
    init(detailNavigator: DetailNavigatorProtocol, featuredRepositoryProtocol : FeaturedRepositoryProtocol) {
        self.detailNavigator = detailNavigator
        self.featuredRepositoryProtocol = featuredRepositoryProtocol
    }
    
    func didLoad() {
        featureViewProtocol?.setLoading(loading: true)
        featureViewProtocol?.title = NSLocalizedString(CONSTANTS.FEATURED_VIEW_LITERAL.FeatureTitle, comment: "")
        featureViewProtocol?.setShowsHeaderTitle(title: NSLocalizedString(CONSTANTS.FEATURED_VIEW_LITERAL.FeatureShowHeader, comment: ""))
        featureViewProtocol?.setMoviesHeaderTitle(title: NSLocalizedString(CONSTANTS.FEATURED_VIEW_LITERAL.FeatureMovieHeader, comment: ""))
        loadContentsFromApi()        
    }
    
    func didSelect(show: Show) {
        detailNavigator.showDetail(identifier: show.identifier, mediaType: .show)
    }
    
    func didSelect(movie: Movie) {
        detailNavigator.showDetail(identifier: movie.identifier, mediaType: .movie)
    }
}

private extension FeaturedPresenter {
    func loadContentsFromApi() {
        let movieNowPlaying = featuredRepositoryProtocol.movieNowPlaying(region: Locale.current.regionCode!)
            .map({ movies in
                movies.prefix(CONSTANTS.FEATURED_PRESENTER_PREFIX_CONSTANTS.moviesToShow)
            })
        
        let showsOnTheAir = featuredRepositoryProtocol.showOnTheAir()
            .map({ shows in
                shows.prefix(CONSTANTS.FEATURED_PRESENTER_PREFIX_CONSTANTS.moviesToShow)
            })
        
        Observable.combineLatest(showsOnTheAir, movieNowPlaying) { shows, movies in
            return (shows, movies)
        }
        .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] shows, movies in
                guard let `self` = self else { return }                
                self.featureViewProtocol?.updateView(with: Array(movies))
                self.featureViewProtocol?.updateView(with: Array(shows))
                self.featureViewProtocol?.setLoading(loading: false)
            }, onError: { error in
                // TODO: We should return error.
                print(error.localizedDescription)
            }, onDisposed: { [weak self] in
                self?.featureViewProtocol?.setLoading(loading: false)
            })
            .disposed(by: disposeBag)
        
    }
}


























