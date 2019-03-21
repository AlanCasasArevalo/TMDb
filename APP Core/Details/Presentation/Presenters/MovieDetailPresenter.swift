//
//  MovieDetailPresenter.swift
//  APP Core
//
//  Created by Alan Casas on 20/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import RxSwift

final class MovieDetailPresenter : DetailPresenterProtocol {
    var view: DetailViewProtocol?
    
    private let movieRepositoryProtocol: MovieRepositoryProtocol
    private let dateFormatter: DateFormatter
    
    private let identifier: Int64
    private let disposeBag = DisposeBag()
    
    init(movieRepositoryProtocol: MovieRepositoryProtocol, dateFormatter: DateFormatter, identifier: Int64 ) {
        self.movieRepositoryProtocol = movieRepositoryProtocol
        self.dateFormatter = dateFormatter
        self.identifier = identifier
    }
    
    func didLoad() {
        view?.setLoading(loading: true)
        movieRepositoryProtocol.movieDetail(identifier: identifier)
            .map { [weak self]  movieDetail in
                self?.detailSections(for: movieDetail) ?? []
            }
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self ] detailSections in
                self?.view?.updateView(sections: detailSections)
            }, onError: { error in
                // TODO: We should return error.
                print(error.localizedDescription)
            }, onDisposed: { [weak self] in
                self?.view?.setLoading(loading: false)
            })
            .disposed(by: disposeBag)
    }
    
    func didSelect(item: PosterStripItem) {
        // TODO: We should do person detail
    }
    
}

extension MovieDetailPresenter {
    private func detailSections(for movie: MovieDetail) -> [DetailSection] {
        // TODO: we should return an array of detail sections.
        var detailSections: [DetailSection] = [
            .header(DetailHeader(movieDetail: movie, dateFormatter: dateFormatter))
        ]
        
        if !(movie.overview?.isEmpty)! {
            if let overview = movie.overview {
                detailSections.append(.about(title: CONSTANTS.MOVIEW_DETAIL_PRESENTER_STRINGS.overviewTitle, detail: overview))
            }
        } 
        
        let items = movie.credits?.cast.map({ creditMembers in
            PosterStripItem(castMember: creditMembers)
        })
        
        if let items = items {
            detailSections.append(.posterStrip(title: CONSTANTS.MOVIEW_DETAIL_PRESENTER_STRINGS.castTitle, items: items))
        }
        
        return detailSections
    }
}
