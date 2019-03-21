//
//  DetailHeaderPresenter.swift
//  APP Core
//
//  Created by Alan Casas on 08/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import RxSwift
import RxCocoa

class DetailHeaderPresenter {
    let imageRepositoryProtocol: ImageRepositoryProtocol
    
    init(imageRepositoryProtocol: ImageRepositoryProtocol) {
        self.imageRepositoryProtocol = imageRepositoryProtocol
    }
    
    func present (header: DetailHeader, view: DetailHeaderView) {        
        bindBackdrop(path: header.backdropPath, view: view)
        bindPoster(path: header.posterPath, view: view)
        
        view.titleLabel.text = header.title.uppercased()
        view.metadataLabel.text = header.metadata
    }
    
}

private extension DetailHeaderPresenter {
    func bindBackdrop(path: String?, view: DetailHeaderView) {
        guard let path = path else {
            return
        }
        imageRepositoryProtocol.imageFromApi(path: path, size: .w780)
            .observeOn(MainScheduler.instance)
            .bind(to: view.detailBackdropImageView.rx.image)
            .disposed(by: view.disposeBag)
    }
    
    func bindPoster(path: String?, view: DetailHeaderView) {
        guard let path = path else {
            return
        }
        
        imageRepositoryProtocol.imageFromApi(path: path, size: .w300)
            .observeOn(MainScheduler.instance)
            .bind(to: view.detailPosterImageView.rx.image)
            .disposed(by: view.disposeBag)
    }
    
}
