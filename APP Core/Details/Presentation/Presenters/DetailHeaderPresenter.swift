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
        bindImageIntoView(path: header.backdropPath, view: view, imageSize: .w780)
        bindImageIntoView(path: header.posterPath, view: view, imageSize: .w300)
        
        view.titleLabel.text = header.title.uppercased()
        view.metadataLabel.text = header.metadata
    }
    
}

private extension DetailHeaderPresenter {
    func bindImageIntoView ( path: String?, view: DetailHeaderView, imageSize: ImageSize ) {
        guard let path = path else { return }
        
        imageRepositoryProtocol.imageFromApi(path: path, size: imageSize)
            .observeOn(MainScheduler.instance)
            .bind(to: view.detailPosterImageView.rx.image)
            .disposed(by: view.disposeBag)
    }
}
