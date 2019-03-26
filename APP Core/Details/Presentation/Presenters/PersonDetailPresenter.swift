//
//  PersonDetailPresenter.swift
//  APP Core
//
//  Created by Alan Casas on 21/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import RxSwift

final class PersonDetailPresenter: DetailPresenterProtocol {
    var view: DetailViewProtocol?
    private let personRepositoryProtocol: PersonRepositoryProtocol
    private let dateFormatter: DateFormatter
    private let identifier: Int64
    private let disposeBag = DisposeBag()
    private let detailNavigatorProtocol: DetailNavigatorProtocol
    
    init(personRepositoryProtocol: PersonRepositoryProtocol, dateFormatter: DateFormatter, identifier: Int64, detailNavigatorProtocol: DetailNavigatorProtocol) {
        self.personRepositoryProtocol = personRepositoryProtocol
        self.dateFormatter = dateFormatter
        self.identifier = identifier
        self.detailNavigatorProtocol = detailNavigatorProtocol
    }
    
    func didLoad() {
        view?.setLoading(loading: true)
        personRepositoryProtocol.personDetail(identifier: identifier)
            .map { [weak self] personDetails in
                self?.detailSections(for: personDetails)
                
            }
        .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] detailSections in
                self?.view?.updateView(sections: detailSections ?? [])
            }, onError: { error in
                    
            }, onDisposed: {
                self.view?.setLoading(loading: false)
            })
            .disposed(by: disposeBag)
        
    }
    
    func didSelect(item: PosterStripItem) {
        // TODO: We shold know which one is choice movie/show
        detailNavigatorProtocol.showDetail(identifier: item.identifier, mediaType: .movie)
    }
}

extension PersonDetailPresenter {
    private func detailSections(for person: PersonDetail) -> [DetailSection] {
        var detailSections: [DetailSection] = [
            .header(DetailHeader(personDetail: person, dateFormatter: dateFormatter))
        ]
        if !(person.biography?.isEmpty)! {
            if let biography = person.biography {
                detailSections.append(.about(title: CONSTANTS.MOVIEW_DETAIL_PRESENTER_STRINGS.biography, detail: biography))
            }
        }
        let items = person.credits?.cast.map({ creditMembers in
            PosterStripItem(castMember: creditMembers)
        })
        if let items = items {
            detailSections.append(.posterStrip(title: CONSTANTS.MOVIEW_DETAIL_PRESENTER_STRINGS.castTitle, items: items))
        }        
        return detailSections
    }
}
