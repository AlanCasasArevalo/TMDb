//
//  ShowDetailPresenter.swift
//  APP Core
//
//  Created by Alan Casas on 21/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import RxSwift

final class ShowDetailPresenter: DetailPresenterProtocol {
    
    var view: DetailViewProtocol?
    private let showRepositoryProtocol : ShowRepositoryProtocol
    private let dateFormatter : DateFormatter
    private let identifier: Int64
    private let disposeBag = DisposeBag()
    private let detailNavigatorProtocol: DetailNavigatorProtocol
    
    init(showRepositoryProtocol : ShowRepositoryProtocol, dateFormatter : DateFormatter, identifier: Int64, detailNavigatorProtocol: DetailNavigatorProtocol) {
        self.showRepositoryProtocol = showRepositoryProtocol
        self.dateFormatter = dateFormatter
        self.identifier = identifier
        self.detailNavigatorProtocol = detailNavigatorProtocol
    }
    
    func didLoad() {
        view?.setLoading(loading: true)        
        showRepositoryProtocol.showDetail(identifier: identifier)
            .map { [weak self] showDetail in
                self?.detailSections(for: showDetail) ?? []
            }
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { detailSections in
                self.view?.updateView(sections: detailSections)
            }, onError: { error in
                // TODO: We should do something with errors
            }, onDisposed: { [weak self] in
                self?.view?.setLoading(loading: false)
            })
            .disposed(by: disposeBag)
        
    }
    
    func didSelect(item: PosterStripItem) {
        detailNavigatorProtocol.showDetail(identifier: item.identifier, mediaType: .person)
    }
    
}

extension ShowDetailPresenter {
    private func detailSections(for show: ShowDetail) -> [DetailSection] {
        var detailSections: [DetailSection] = [
            .header(DetailHeader(showDetail: show, dateFormatter: dateFormatter))
        ]
        if !(show.overview?.isEmpty)! {
            if let overview = show.overview {
                detailSections.append(.about(title: CONSTANTS.MOVIEW_DETAIL_PRESENTER_STRINGS.overviewTitle, detail: overview))
            }
        }
        let items = show.credits?.cast.map({ creditMembers in
            PosterStripItem(castMember: creditMembers)
        })
        if let items = items {
            detailSections.append(.posterStrip(title: CONSTANTS.MOVIEW_DETAIL_PRESENTER_STRINGS.castTitle, items: items))
        }
        return detailSections
    }
}
